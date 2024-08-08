import 'dart:async';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  final int time;
  const TimerPage({super.key, required this.time});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late Timer timer;
  late int timeInTimer;
  bool isRunning = false;
  bool isComleted = false;

  void startTimer() {
    isRunning = true;
    timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (timeInTimer > 0) {
        setState(() {
          timeInTimer--;
        });
      } else {
        stopTimer();
        setState(() {
          isComleted = true;
        });
      }
    });
  }

  void stopTimer() {
    setState(() {
      isRunning = false;
      timer.cancel();
    });
  }

  void endGame() {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      timeInTimer = widget.time * 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          actions: [
            IconButton(
                onPressed: isComleted ? endGame : null,
                icon: const Icon(Icons.check))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTimer(),
              buildActionsTimer(),
            ],
          ),
        ));
  }

  Widget buildTimer() {
    return Text("$timeInTimer");
  }

  Widget buildActionsTimer() {
    return isRunning
        ? ElevatedButton(
            onPressed: stopTimer,
            child: const Text("pause"),
          )
        : ElevatedButton(onPressed: startTimer, child: const Text("Start"));
  }
}
