import 'package:flutter/material.dart';
import 'dart:math';

import 'package:spy_mobile/pages/timer_page.dart';

enum Roles { player, spy }

class RolesPage extends StatefulWidget {
  final int countPlayers;
  final int countSpies;
  final String theme;
  final int time;

  const RolesPage(
      {super.key,
      required this.countPlayers,
      required this.countSpies,
      required this.theme,
      required this.time});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  late String role;
  late final String location;
  late String textLocation;
  int rolesIndex = 0;
  bool showRole = false;
  bool rolesReceived = false;
  List<Roles> listOfPlayers = [];

  final Map<String, List<String>> listOfLocations = {
    "Города": [
      "Барнаул",
      "Москва",
      "Санкт-Петербург",
      "Мадрид",
      "Вашингтон",
      "Париж",
      "Токио",
      "Рим"
    ],
    "Страны": [
      "Франция",
      "Германия",
      "Россия",
      "Гвинея",
      "Канада",
      "Алжир",
      "Япония"
    ],
    "Достопримечательности": [
      "Мачу-Пикчу",
      "Московский Кремль",
      "Собор Святой Софии",
      "Тауэрский мост",
      "Тадж-Махал",
      "Большой Барьерный риф",
      "Дорога гигантов",
      "Петра",
      "Великая Китайская стена"
    ]
  };

  //Функция инициализации и выбора локации в зависимости от темы
  String initLocation() {
    String selectLocation;
    List<String> list = listOfLocations[widget.theme]!;
    int locationIndex = Random().nextInt(list.length);
    selectLocation = list[locationIndex];
    return selectLocation;
  }

  //Функция инициализации игроков и шпионов
  //Создается список из countPlayers игроков. Все элементы по умолчанию - Игроки.
  //Для количества шионов создаем рандомные индексы, и в элементы списка по этим индексам присваиваем значение "шпион"
  List<Roles> initPlayersAndSpies() {
    int spiesIndex;
    List<Roles> listOfPlayers =
        List<Roles>.filled(widget.countPlayers, Roles.player);
    for (var i = 0; i < widget.countSpies; i++) {
      spiesIndex = Random().nextInt(widget.countPlayers);
      while (listOfPlayers[spiesIndex] == Roles.spy) {
        spiesIndex = Random().nextInt(widget.countPlayers);
      }
      listOfPlayers[spiesIndex] = Roles.spy;
    }
    return listOfPlayers;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      listOfPlayers = initPlayersAndSpies();
      location = initLocation();
      role = "Получи роль, скрой ее и передавай другому!";
      textLocation = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Роли",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: rolesReceived ? toTimerPage : null,
          ),
        ],
      ),
      body: createBody(),
    );
  }

  Widget createBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  role,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              Text(textLocation)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(
                  onPressed: rolesIndex < listOfPlayers.length && !showRole
                      ? giveRole
                      : null,
                  child: const Text("Получить роль")),
              FilledButton(
                  onPressed: showRole ? disableRole : null,
                  child: const Text("Скрыть")),
            ],
          )
        ],
      ),
    );
  }

  //Функция,ответственная за работу кнопки "Скрыть"
  void disableRole() {
    setState(() {
      role = "Получи роль, скрой ее и передавай другому!";
      textLocation = "";
      showRole = !showRole;
    });
  }

  //Функция, ответственная за работу кнопки "Получить роль"
  void giveRole() {
    setState(() {
      role = viewRole(listOfPlayers[rolesIndex]);
      if (listOfPlayers[rolesIndex] == Roles.player) {
        textLocation = location;
      } else {
        textLocation = "Узнай локацию и не раскрой себя";
      }
      rolesIndex++;
      showRole = !showRole;

      //Если все роли получены
      if (rolesIndex == listOfPlayers.length && showRole) {
        rolesReceived = true;
      }
    });
  }

  //Функция перемещения на экран таймера
  void toTimerPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TimerPage(time: widget.time)));
  }

  //Функция для "красивого" отображения роли на экране
  String viewRole(Roles thisRole) {
    String result;
    switch (thisRole) {
      case Roles.player:
        result = "Вы игрок";
        break;
      case Roles.spy:
        result = "Вы шпион";
    }
    return result;
  }
}
