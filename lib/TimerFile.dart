import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'fileOfData.dart';

class TimerRout extends StatefulWidget {
  const TimerRout({Key? key}) : super(key: key);

  @override
  State<TimerRout> createState() => _TimerRoutState();
}

class _TimerRoutState extends State<TimerRout> {

  Timer? timer;
  bool isStopTimer = false;

  List minutesList = [];
  List secondsList = [];

  int minutes = times;
  int seconds = 0;
  String displayTime = "${times < 10 ? '0' : ''}$times : 00";

  runTimer() {
    isStopTimer = false;
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (seconds >= 0) {seconds = seconds - 1;}
      if (minutes > 0) {
        if (seconds == -1) {
          minutes = minutes - 1;
          seconds = 59;
        }
      }

      String result = '${minutes < 10 ? '0' : ''}$minutes : ${seconds < 10 ? '0' : ''}${max(seconds, 0)}';
      displayTime = result;
      setState(() {});
    });
  }

  stopTimer() {
    isStopTimer = true;
    timer!.cancel();
    setState(() {});
  }

  @override
  void initState() {
    for (int i = 0; i < 61; i++) {
      minutesList.add(i.toString());
    }
    for (int i = 0; i < 61; i++) {
      secondsList.add(i.toString());
    }
    setState(() {});
    super.initState();
  }

  resetTimer() {
    stopTimer();
    minutes = 0;
    seconds = -1;
    displayTime = '00 : 00';
    setState(() {});
  }

   @override
   void dispose(){
     stopTimer();
     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
            centerTitle: true,
            title: const Text(
              "Игра идет",
              style: TextStyle(
                color: Color.fromRGBO(254, 212, 126, 1),
                fontWeight: FontWeight.w600,
              ),
            ),
            bottom: const TabBar(
              labelColor: Color.fromRGBO(200, 146, 84, 1),
              dividerColor: Color.fromRGBO(33, 34, 36, 0.2),
              indicatorColor: Color.fromRGBO(254, 212, 126, 1),
              unselectedLabelColor: Colors.white60,
              tabs: [
                Tab(
                  icon: Icon(Icons.announcement),
                  text: "Подсказки",
                ),
                Tab(
                  icon: Icon(Icons.gamepad),
                  text: "Игра",
                ),
                Tab(
                  icon: Icon(Icons.question_mark_rounded),
                  text: "Правила",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                  itemCount: listOfHints.length,
                  itemBuilder: (context, index){
                    return Card(
                      color: const Color.fromRGBO(33, 34, 36, 0.7),
                      margin: const EdgeInsets.only(top: 10),
                      child: ListTile(
                        title: Text(
                            listOfHints[index],
                            style: const TextStyle(
                                color: Colors.white70
                            ),
                        ),
                      ),
                    );
                  }
              ),
              Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    displayTime,
                    style: TextStyle(
                      color: timer == null || isStopTimer ? Colors.white24 : const Color.fromRGBO(121, 104, 216, 1),
                      fontSize: 100,
                    ),
                  ),
                  MaterialButton(
                    height: 80,
                    minWidth: 250,
                    color: const Color.fromRGBO(138, 193, 135, 1),
                    disabledColor: Colors.white24,
                    onPressed: (minutes == 0 && seconds == -1) ? null : () {
                      if (timer != null) {
                        stopTimer();
                      }
                      runTimer();
                    },
                    child: const Text(
                      'Пуск',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(30, 31, 36, 1)
                      ),
                    ),
                  ),
                  MaterialButton(
                    height: 80,
                    minWidth: 250,
                    color: const Color.fromRGBO(254, 212, 126, 1),
                    disabledColor: Colors.white24,
                    onPressed: (minutes == 0 && seconds == -1) ? null : () {
                      if (timer != null) {stopTimer();}
                    },
                    child: const Text(
                      'Пауза',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(30, 31, 36, 1)
                      ),
                    ),
                  ),
                  MaterialButton(
                    height: 80,
                    minWidth: 250,
                    color: const Color.fromRGBO(255, 170, 199, 1),
                    disabledColor: Colors.white24,
                    onPressed: !(minutes == 0 && seconds == -1) ? null : () {
                      resetTimer();
                      Navigator.of(context).pushNamed('/HomePage');
                    },
                    child: const Text(
                      'Конец',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(30, 31, 36, 1)
                      ),
                    ),
                  ),
                ],
              ),
            ),
              CarouselSlider.builder(
                  itemCount: listOfTitlesRule.length,
                  itemBuilder: (context, index, pageViewIndex){
                    return Card(
                      color: const Color.fromRGBO(254, 212, 126, 1),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              listOfTitlesRule[index],
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(30, 31, 36, 1),
                              ),
                            ),
                            Text(
                              listOfContentsRule[index],
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(30, 31, 36, 1),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.vertical,
                  )
              ),
            ]
          ),
        ),
      ),
    );
  }
}