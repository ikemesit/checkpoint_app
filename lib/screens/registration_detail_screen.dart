import 'package:checkpoint_app2/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../checkpoint_theme.dart';

class RegistrationDetailScreen extends StatelessWidget {
  RegistrationDetailScreen({Key? key}) : super(key: key);

  final date = Jiffy().dateTime.toLocal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Registration Ticket',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/1200px-QR_code_for_mobile_English_Wikipedia.svg.png'),
            ),
            Container(
              height: 200.0,
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jeju Virtual Run 2021',
                        style: CheckpointTheme.lightTextTheme.headline3,
                      ),
                      Text(
                        'PFSVR21-R03AAD047',
                        style: CheckpointTheme.lightTextTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '$date',
                        style: CheckpointTheme.lightTextTheme.bodyText1,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // CustomScrollView(
  // slivers: <Widget>[
  // SliverAppBar(
  // expandedHeight: 300,
  // flexibleSpace: FlexibleSpaceBar(
  // title: Text(
  // "Beautiful World",
  // style: CheckpointTheme.darkTextTheme.headline3,
  // ),
  // background: Hero(
  // tag: "avatar-$index",
  // child: Image.network(
  // "https://picsum.photos/seed/$index/800",
  // fit: BoxFit.cover,
  // ),
  // ),
  // ),
  // ),
  // ],
  // ),
}
