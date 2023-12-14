import 'package:flutter/material.dart';
import 'fileOfData.dart';

class SettingsRout extends StatefulWidget {
  const SettingsRout({Key? key}) : super(key: key);

  @override
  _SettingsRoutState createState() => _SettingsRoutState();
}

  class _SettingsRoutState extends State<SettingsRout>{
  int indexThemes = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
          automaticallyImplyLeading: true,
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(138, 193, 135, 1),
              ),
              onPressed: (){Navigator.of(context).pop();}
          ),
          title: const Text(
            "Настройка игры",
            style: TextStyle(
              color: Color.fromRGBO(138, 193, 135, 1),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: ListView(
          children: [
            Card(
              color: const Color.fromRGBO(33, 34, 36, 0.7),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 30),
                    child: Text(
                      "Количество игроков: $countOfPlayers",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(138, 193, 135, 1),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsetsDirectional.all(20)),
                          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: (){
                          setState(() {
                            if (countOfPlayers > 3 && countOfPlayers > countOfSpy+2){
                              countOfPlayers = countOfPlayers - 1;
                            }
                          });
                        },
                        child: const Icon(
                            Icons.remove,
                            color: Color.fromRGBO(255, 170, 199, 1),
                            size: 28
                        ),
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsetsDirectional.all(20)),
                          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: (){
                          setState(() {
                            countOfPlayers = countOfPlayers + 1;
                          });
                        },
                        child: const Icon(
                            Icons.add,
                            color: Color.fromRGBO(138, 193, 135, 1),
                            size: 28
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Card(
              color: const Color.fromRGBO(33, 34, 36, 0.7),
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 30),
                    child: Text(
                      "Количество шпионов: $countOfSpy",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(138, 193, 135, 1),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsetsDirectional.all(20)),
                          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: (){
                          setState(() {
                            if (countOfSpy > 1){
                              countOfSpy = countOfSpy - 1;
                            }
                          });
                        },
                        child: const Icon(
                            Icons.remove,
                            color: Color.fromRGBO(255, 170, 199, 1),
                            size: 28
                        ),
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsetsDirectional.all(20)),
                          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: (){
                          setState(() {
                            if (countOfSpy < countOfPlayers - 2){
                              countOfSpy = countOfSpy + 1;
                            }
                          });
                        },
                        child: const Icon(
                            Icons.add,
                            color: Color.fromRGBO(138, 193, 135, 1),
                            size: 28
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Card(
              color: const Color.fromRGBO(33, 34, 36, 0.7),
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 30),
                    child: Text(
                      "Тема: ${listOfThemes[indexThemes]}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(138, 193, 135, 1),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsetsDirectional.all(20)),
                          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: (){
                          setState(() {
                            if (indexThemes > 0){
                              indexThemes = indexThemes - 1;
                              selectedTheme = listOfThemes[indexThemes];
                            } else {
                              indexThemes = listOfThemes.length - 1;
                              selectedTheme = listOfThemes[indexThemes];
                            }
                          });
                        },
                        child: const Icon(
                            Icons.remove,
                            color: Color.fromRGBO(255, 170, 199, 1),
                            size: 28
                        ),
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsetsDirectional.all(20)),
                          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: (){
                          setState(() {
                            if (indexThemes < listOfThemes.length - 1){
                              indexThemes = indexThemes + 1;
                              selectedTheme = listOfThemes[indexThemes];
                            } else {
                              indexThemes = 0;
                              selectedTheme = listOfThemes[indexThemes];
                            }
                          });
                        },
                        child: const Icon(
                            Icons.add,
                            color: Color.fromRGBO(138, 193, 135, 1),
                            size: 28
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Card(
              color: const Color.fromRGBO(33, 34, 36, 0.7),
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 30),
                    child: Text(times == 1 || times == 21 ? "Время игры: $times минута" :
                                times > 1 && times < 5 || times > 20 && times < 25 ? "Время игры: $times минуты" :
                                "Время игры: $times минут",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(138, 193, 135, 1),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsetsDirectional.all(20)),
                          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: (){
                          setState(() {
                            if (times > 1){
                              times = times - 1;
                            } else {
                              times = 30;
                            }
                          });
                        },
                        child: const Icon(
                            Icons.remove,
                            color: Color.fromRGBO(255, 170, 199, 1),
                            size: 28
                        ),
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsetsDirectional.all(20)),
                          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: (){
                          setState(() {
                            if (times < 30){
                              times = times + 1;
                            } else {
                              times = 1;
                            }
                          });
                        },
                        child: const Icon(
                            Icons.add,
                            color: Color.fromRGBO(138, 193, 135, 1),
                            size: 28
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            MaterialButton(
                color: const Color.fromRGBO(138, 193, 135, 1),
                height: 100,
                minWidth: 200,
              onPressed: (){Navigator.pushNamed(context, '/RolesPage');},
              child: const Text(
                "Выдать роли",
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(30, 31, 36, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}