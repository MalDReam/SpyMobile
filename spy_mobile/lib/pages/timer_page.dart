import 'dart:async';
import 'package:flip_card/flip_card.dart';
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
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTimer(),
              buildActionsTimer(),
              buildActions()
            ],
          ),
        ));
  }

  Widget buildTimer() {
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: (timeInTimer / (widget.time * 60)),
            strokeWidth: 12,
            
          ),
          Center(child: Text(
            "$timeInTimer",
            style: TextStyle(
              fontSize: 24
            ),
            ))
          ]
      ),
    );
  }

  Widget buildActionsTimer() {
    return isRunning
        ? FilledButton(
            onPressed: stopTimer,
            child: const Text("Пауза"),
          )
        : FilledButton(onPressed: startTimer, child: const Text("Старт"));
  }

  Row buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilledButton(
          onPressed: () {
            Navigator.pushNamed(context, '/hints_page');
          },
          child: const Text("Подсказки"),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pushNamed(context, '/rules_page');
          },
          child: const Text("Правила"),
        ),
      ],
    );
  }
}
