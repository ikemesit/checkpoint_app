import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final String dateTime;
  final String timeElapsed;
  final String distanceCovered;

  const ActivityItem(
      {Key? key,
      required this.dateTime,
      required this.timeElapsed,
      required this.distanceCovered})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dateTime,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                distanceCovered,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                timeElapsed,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
