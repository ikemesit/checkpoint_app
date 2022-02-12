import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkpoint_app2/controllers/event_detail_controller.dart';
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

class EventDetailScreen extends StatelessWidget {
  final CheckpointEvent event;

  EventDetailScreen({Key? key, required this.event}) : super(key: key) {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  final DateFormat formatter = DateFormat('dd MMMM, yyyy');
  late WebViewController _webViewController;

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    final EventDetailController eventDetailController =
        Get.put(EventDetailController());
    final dateFrom = formatter.format(event.dDateTimeFrom);
    final dateTo = formatter.format(event.dDateTimeTo);
    final currDate = DateTime.now();
    bool isRegistrationOpen = currDate.isBefore(event.dDateTimeTo);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event Detail',
          style: CheckpointTheme.darkTextTheme.headline4,
        ),
        actions: [
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
          ),
          // Obx(() {
          //   if (userController.isLoggedIn.value == true) {
          //     return IconButton(
          //       onPressed: () {},
          //       icon: const Icon(LineIcons.wallet),
          //       color: Colors.white,
          //     );
          //   } else {
          //     return const Visibility(
          //       child: Text('None'),
          //       visible: false,
          //     );
          //   }
          // }),
          Obx(() {
            if (userController.isLoggedIn.value == true) {
              return IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UserProfileScreen(title: 'User Profile'),
                    ),
                  );
                },
                icon: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/trophy1.jpg'),
                    radius: 12.0),
                color: Colors.white,
              );
            } else {
              return const Visibility(
                child: Text('None'),
                visible: false,
              );
            }
          })
        ],
      ),
      body: Obx(() => ListView(
            padding: const EdgeInsets.all(0),
            children: [
              CachedNetworkImage(
                imageUrl: event.cImageUrl,
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
                  event.cDescription.toUpperCase().trim(),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURL(event.cEventRegistrationUrl);
                    },
                    child: Text(
                      'Register Now',
                      style: CheckpointTheme.darkTextTheme.headline6,
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // _launchURL(widget.event.cEventRegistrationUrl);
                      Get.to(() => LoginScreen(), fullscreenDialog: true);
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
                height: eventDetailController
                    .webViewHeight.value, // TODO fix webview auto height
                child: IndexedStack(
                  index: eventDetailController.position.value,
                  children: [
                    WebView(
                      initialUrl: event.cEventDetailUrl,
                      javascriptMode: JavascriptMode.unrestricted,
                      onPageStarted: (some) {
                        eventDetailController.updatePosition(1);
                        print(
                            'Height on page start ${eventDetailController.webViewHeight.value}');
                      },
                      onPageFinished: (some) async {
                        double height = double.parse(await _webViewController
                            .runJavascriptReturningResult(
                                "document.body.clientHeight;"));

                        eventDetailController.updatePosition(0);
                        eventDetailController.updateWebViewHeight(height);
                        print(
                            'Height on page finish ${eventDetailController.webViewHeight.value}');
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
          )),
    );
  }
}
