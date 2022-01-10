import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkpoint_app2/controllers/user_controller.dart';
import 'package:checkpoint_app2/models/event.dart';
import 'package:checkpoint_app2/screens/login_screen.dart';
import 'package:checkpoint_app2/screens/notifications_screen.dart';
import 'package:checkpoint_app2/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../checkpoint_theme.dart';

class EventDetailScreen extends StatefulWidget {
  final CheckpointEvent event;

  const EventDetailScreen({Key? key, required this.event}) : super(key: key);

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final DateFormat formatter = DateFormat('dd MMMM, yyyy');
  int position = 1;
  double _webViewHeight = 100;
  late WebViewController _webViewController;

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    final dateFrom = formatter.format(widget.event.dDateTimeFrom);
    final dateTo = formatter.format(widget.event.dDateTimeTo);
    final currDate = DateTime.now();
    bool isRegistrationOpen = currDate.isBefore(widget.event.dDateTimeTo);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Event Detail',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(LineIcons.wallet),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsScreen(),
                ),
              );
            },
            icon: const Icon(LineIcons.bell),
            color: Colors.white,
          ),
          if (userController.isLoggedIn.value == true)
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const UserProfileScreen(title: 'User Profile'),
                  ),
                );
              },
              icon: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/trophy1.jpg'),
                  radius: 12.0),
              color: Colors.white,
            )
        ],
        elevation: 2.0,
        shadowColor: Colors.black,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          CachedNetworkImage(
            imageUrl: widget.event.cImageUrl,
            colorBlendMode: BlendMode.srcOver,
            width: 350,
            height: 300,
            fit: BoxFit.cover,
            placeholder: (context, url) => const LinearProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              size: 100.0,
              // color: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.event.cDescription.toUpperCase().trim(),
              style: CheckpointTheme.lightTextTheme.headline4,
              softWrap: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(LineIcons.calendarWithDayFocus),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'STARTS',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          dateFrom,
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.black87),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(LineIcons.calendarWithDayFocus),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ENDS',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          dateTo,
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.black87),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          if (isRegistrationOpen && userController.isLoggedIn.value == true)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  _launchURL(widget.event.cEventRegistrationUrl);
                },
                child: Text(
                  'Register Now',
                  style: CheckpointTheme.darkTextTheme.headline6,
                ),
              ),
            )
          else
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  // _launchURL(widget.event.cEventRegistrationUrl);
                  Get.to(LoginScreen());
                },
                child: Text(
                  'Login to Register',
                  style: CheckpointTheme.darkTextTheme.headline6,
                ),
              ),
            ),
          const Divider(),
          SizedBox(
            width: 300,
            height: _webViewHeight, // TODO fix webview auto height
            child: IndexedStack(
              index: position,
              children: [
                WebView(
                  initialUrl: widget.event.cEventDetailUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageStarted: (some) {
                    setState(() {
                      position = 1;
                    });
                    print('Height on page start $_webViewHeight');
                  },
                  onPageFinished: (some) async {
                    double height = double.parse(
                        await _webViewController.runJavascriptReturningResult(
                            "document.body.offsetHeight;"));

                    setState(() {
                      position = 0;
                      _webViewHeight = height;
                    });
                    print('Height on page finish $_webViewHeight');
                  },
                  onWebViewCreated: (controller) async {
                    _webViewController = controller;
                  },
                ),
                const Center(
                    heightFactor: 3.0, child: CircularProgressIndicator()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
