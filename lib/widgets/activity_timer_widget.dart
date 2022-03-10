import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/controllers/activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class ActivityTimerWidget extends StatefulWidget {
  const ActivityTimerWidget({Key? key}) : super(key: key);

  @override
  State<ActivityTimerWidget> createState() => _ActivityTimerWidgetState();
}

class _ActivityTimerWidgetState extends State<ActivityTimerWidget> {
  final ActivityController _mapWidgetController =
      Get.find<ActivityController>();
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  String displayTime = '00:00:00';

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();

    _mapWidgetController.timeElasped(displayTime);
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  Future<void> startTimer() async {
    await Future.delayed(const Duration(seconds: 1), () {
      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _stopWatchTimer.rawTime,
      initialData: 0,
      builder: (context, snap) {
        final value = snap.data;
        displayTime = StopWatchTimer.getDisplayTime(value!);
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                displayTime,
                style: CheckpointTheme.lightTextTheme.headline2,
              ),
            ),
          ],
        );
      },
    );
  }
}
