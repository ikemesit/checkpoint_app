import 'package:checkpoint_app2/screens/registration_detail_screen.dart';
import 'package:checkpoint_app2/widgets/app_bar_widget.dart';
import 'package:checkpoint_app2/widgets/registration_ticket_widget.dart';
import 'package:flutter/material.dart';

class RegistrationTicketsScreen extends StatelessWidget {
  const RegistrationTicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _openDetail(context, index) {
      final route = MaterialPageRoute(
        builder: (context) => RegistrationDetailScreen(),
      );
      Navigator.push(context, route);
    }

    return Scaffold(
      backgroundColor: const Color(0xfff2f3f8),
      appBar: AppBarWidget(
        title: 'Registration Tickets',
      ),
      body: ListView.separated(
        itemCount: 15,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        itemBuilder: (BuildContext context, int index) {
          return const RegistrationTicketWidget();
          // return ListTile(
          //   style: ListTileStyle.drawer,
          //   tileColor: Colors.white,
          //   contentPadding:
          //       const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          //   shape: const RoundedRectangleBorder(
          //     side: BorderSide.none,
          //     borderRadius: BorderRadius.all(Radius.circular(4.0)),
          //   ),
          //   leading: CircleAvatar(
          //     child: ClipOval(
          //       child: Hero(
          //         tag: "avatar-$index",
          //         child: const Icon(Icons.qr_code_2),
          //       ),
          //     ),
          //   ),
          //   trailing: const Icon(Icons.more_horiz),
          //   title: Text(
          //     "Jeju Virtual Run 2021",
          //     style: CheckpointTheme.lightTextTheme.headline4,
          //   ),
          //   subtitle: Text(
          //     "PFSVR21-R03AAD047",
          //     style: CheckpointTheme.lightTextTheme.bodyText1,
          //   ),
          //   onTap: () => _openDetail(context, index),
          // );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
