import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Duration duration = const Duration(minutes: 0, seconds: 1);

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Theme(
        data: ThemeData.dark(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: const Color(0xFF1D202E),
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.only(left: 30),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: const Color(0xFF2E303E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Timer'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (duration.inSeconds > 1) {
                      duration = duration - const Duration(seconds: 1);
                    }
                  });
                },
                child: const Icon(
                  Icons.remove_circle_outline,
                  color: Color(0xFFC8C8C8),
                ),
              ),
              GestureDetector(
                onTap: () => _showDialog(
                  CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.ms,
                    initialTimerDuration: duration,
                    onTimerDurationChanged: (Duration newDuration) {
                      setState(() => duration = newDuration);
                    },
                  ),
                ),
                child: Text(
                  '${(duration.inMinutes.toString().padLeft(2, '0'))}:${(duration.toString().substring(5, 7).padLeft(2, '0'))}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    duration = duration + const Duration(seconds: 1);
                  });
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Color(0xFFC8C8C8),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
