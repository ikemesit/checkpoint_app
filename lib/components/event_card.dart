import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkpoint_app2/models/event.dart';
import 'package:checkpoint_app2/screens/event_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

import '../checkpoint_theme.dart';

class EventCard extends StatelessWidget {
  final CheckpointEvent event;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFrom = formatter.format(event.dDateTimeFrom);
    final dateTo = formatter.format(event.dDateTimeTo);
    final currDate = DateTime.now();
    final isRegistrationOpen = currDate.isBefore(event.dDateTimeTo);
    final registrationStatus =
        isRegistrationOpen ? 'Registration Open' : 'Registration Closed';
    List<String> months = [
      'jan',
      'feb',
      'mar',
      'apr',
      'may',
      'jun',
      'jul',
      'aug',
      'sep',
      'oct',
      'nov',
      'dec'
    ];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 15.0),
      shadowColor: Colors.black54,
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EventDetailScreen(
                  event: event,
                );
              },
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: event.cImageUrl,
                  colorBlendMode: BlendMode.srcOver,
                  width: 350,
                  height: 150,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const LinearProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 50.0,
                  ),
                ),
                Container(
                  width: 350,
                  height: 150,
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.cDescription.trim(),
                    style: CheckpointTheme.lightTextTheme.headline5,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            LineIcons.calendarWithDayFocus,
                            color: Colors.black87,
                            size: 16.0,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            event.dDateTimeFrom.day.toString() +
                                ' ' +
                                months[event.dDateTimeFrom.month - 1]
                                    .toUpperCase() +
                                ' ' +
                                event.dDateTimeFrom.year.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: isRegistrationOpen ? Colors.green : Colors.red,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(36.0)),
                        ),
                        child: Text(
                          registrationStatus,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    LineIcons.mapMarker,
                    color: Colors.blueGrey,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                    flex: 4,
                    child: Text(
                      event.cVenue,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
