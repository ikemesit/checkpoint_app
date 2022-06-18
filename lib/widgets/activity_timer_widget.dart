import 'package:checkpoint_app2/checkpoint_theme.dart';
import 'package:checkpoint_app2/controllers/activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class ActivityTimerWidget extends StatefulWidget {
  // final bool pauseTimer;
  final String? presetTime;

  const ActivityTimerWidget({Key? key, this.presetTime}) : super(key: key);

  @override
  State<ActivityTimerWidget> createState() => _ActivityTimerWidgetState();
}

class _ActivityTimerWidgetState extends State<ActivityTimerWidget> {
  final ActivityController _mapWidgetController =
      Get.find<ActivityController>();

  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  late String displayTime;

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

  Future<void> pauseTimer() async {
    await Future.delayed(const Duration(seconds: 1), () {
      _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.presetTime != null) {
      displayTime = widget.presetTime!;
    } else {
      displayTime = '00:00:00:00';
    }

    return StreamBuilder<int>(
        stream: _stopWatchTimer.rawTime,
        initialData: 0,
        builder: (context, snap) {
          final value = snap.data;
          displayTime = StopWatchTimer.getDisplayTime(value!);
          _mapWidgetController
              .timeElasped(StopWatchTimer.getDisplayTime(value));

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
        });
  }
}
