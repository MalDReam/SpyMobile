import 'dart:math';
import 'package:flutter/material.dart';
import 'fileOfData.dart';

class RolesRout extends StatefulWidget {
  const RolesRout({super.key});

  @override
  State<RolesRout> createState() => _RolesRoutState();
}

class _RolesRoutState extends State<RolesRout> {
  int index = 0;
  String selectedLocation = selectLocation(selectedTheme);
  List<String> listOfPlayers = selectSpys();

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
            onPressed: (){Navigator.of(context).pop();},
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(121, 104, 216, 1)
            ),
          ),
          title: const Text(
              "Выдаем роли",
              style: TextStyle(
                color: Color.fromRGBO(121, 104, 216, 1),
                fontWeight: FontWeight.w600
              )
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Center(
              child: MaterialButton(
                color: const Color.fromRGBO(121, 104, 216, 1),
                height: 80,
                minWidth: 250,
                disabledColor: Colors.white24,
                onPressed: (index < countOfPlayers) ? (){
                  showDialog(context: context, builder: (BuildContext context) {
                    if (listOfPlayers[index] != "Шпион") {
                      return AlertDialog(
                        backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
                        title: Text(
                          listOfPlayers[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromRGBO(138, 193, 135, 1),
                          ),
                        ),
                        content: Text(
                          selectedLocation,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromRGBO(138, 193, 135, 1),
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(138, 193, 135, 1)),
                              minimumSize: MaterialStatePropertyAll(Size(150, 50)),
                            ),
                            onPressed: (){
                              Navigator.of(context).pop();
                              setState(() {
                                index++;
                              });
                              },
                            child: const Text(
                              "Закрыть",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color.fromRGBO(30, 31, 36, 1)
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return AlertDialog(
                        backgroundColor: const Color.fromRGBO(35, 35, 45, 1),
                        title: Text(
                          listOfPlayers[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 170, 199, 1),
                          ),
                        ),
                        content: const Text(
                          "Угадай локацию",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 170, 199, 1),
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(255, 170, 199, 1)),
                              minimumSize: MaterialStatePropertyAll(Size(150, 50)),
                            ),
                            onPressed: (){
                              Navigator.of(context).pop();
                              setState(() {
                                index++;
                              });
                              },
                            child: const Text(
                              "Закрыть",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color.fromRGBO(30, 31, 36, 1)
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  });
                } : null,
                child: const Text(
                  "Получить роль",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(30, 31, 36, 1),
                  ),
                ),
              ),
            ),
            Center(
              child: MaterialButton(
                color: const Color.fromRGBO(121, 104, 216, 1),
                height: 80,
                minWidth: 250,
                disabledColor: Colors.white24,
                onPressed: (index == countOfPlayers) ? () {
                  Navigator.of(context).pushNamed('/TimerPage');
                } : null,
                child: const Text(
                  "Продолжить",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(30, 31, 36, 1)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Создаем рандомное число из длины массива соответствий тем и выбираем тему из списка
String selectLocation(String selectedTheme) {
  int len = themes[selectedTheme].length;
  int rand = Random().nextInt(len);
  List<String> theme = themes[selectedTheme];
  String endingTheme = theme[rand];
  return endingTheme;
}

//Создаем список и заполняем его значением. Для кол-ва шпионов проходимся по списку игроков и находим места с нужными индексом. Если уже Шпион, то переизбираем индекс.
List<String> selectSpys() {
  List<String> listOfPlayers = List<String>.filled(countOfPlayers, "Гражданин");
  int indexRole = 0;
  for(int i = 0; i < countOfSpy; i++) {
    indexRole = Random().nextInt(countOfPlayers);
    while (listOfPlayers[indexRole] == "Шпион") {
      indexRole = Random().nextInt(countOfPlayers);
    }
    listOfPlayers[indexRole] = "Шпион";
  }
  return listOfPlayers;
}