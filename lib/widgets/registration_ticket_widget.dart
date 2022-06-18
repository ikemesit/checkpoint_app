import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/screens/registration_detail_screen.dart';
import 'package:flutter/material.dart';

class RegistrationTicketWidget extends StatelessWidget {
  const RegistrationTicketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0), side: BorderSide.none),
      child: Container(
        height: 100.0,
        padding: const EdgeInsets.all(10.0),
        // color: Colors.white,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegistrationDetailScreen()),
                );
              },
              icon: const Icon(Icons.qr_code_2),
              iconSize: 32.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jeju Virtual Run 2021',
                  style: CheckpointTheme.lightTextTheme.headline4,
                ),
                Text(
                  'PFSVR21-R03AAD047',
                  style: CheckpointTheme.lightTextTheme.bodyText1,
                )
              ],
            ),
            const Icon(Icons.more_horiz)
          ],
        ),
      ),
    );
  }
}
