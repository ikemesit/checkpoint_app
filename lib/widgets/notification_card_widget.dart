import 'package:checkpoint_app2/controllers/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class NotificationCardWidget extends StatelessWidget {
  NotificationCardWidget({Key? key}) : super(key: key);
  final notificationsController = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Some event title here',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: const [
                  CircleAvatar(
                    foregroundImage: AssetImage('assets/images/trophy1.jpg'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus a elit ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam vitae finibus nulla. Quisque aliquam sed ipsum non imperdiet. Suspendisse in mi vitae eros laoreet gravida. Nulla hendrerit feugiat aliquam.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'poppins',
                      ),
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              TextButton(
                onPressed: () {},
                child: const Text(
                  '14th May, 2021',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 12.0),
                ),
              )
            ],
          ),
        ),
      ),
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          notificationsController.decrement();
        }),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              notificationsController.decrement();
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Dismiss',
          ),
        ],
      ),
    );
  }
}
