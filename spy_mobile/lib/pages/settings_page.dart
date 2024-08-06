import 'package:flutter/material.dart';
import 'package:spy_mobile/pages/roles_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int countPlayers = 3;
  int countSpies = 1;
  int time = 1;
  int themeIndex = 0;

  List<String> themes = ["Города", "Страны", "Достопримечательности"];

  List<Widget> data() {
    List<Widget> dataBody = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (countPlayers > 3 && countPlayers > countSpies+2) {
                setState(() {
                  countPlayers--;
                });
              }
            },
            icon: const Icon(Icons.remove),
          ),
          Column(
            children: [
              Text("$countPlayers"),
              const Text("Количество участников")
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                countPlayers++;
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (countSpies > 1) {
                setState(() {
                  countSpies--;
                });
              }
            },
            icon: const Icon(Icons.remove),
          ),
          Column(
            children: [Text("$countSpies"), const Text("Количество шпионов")],
          ),
          IconButton(
            onPressed: () {
              if (countSpies < countPlayers - 2) {
                setState(() {
                  countSpies++;
                });
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (time > 1) {
                setState(() {
                  time--;
                });
              }
            },
            icon: const Icon(Icons.remove),
          ),
          Column(
            children: [Text("$time"), const Text("Количество времени")],
          ),
          IconButton(
            onPressed: () {
              if (time < 30) {
                setState(() {
                  time++;
                });
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (themeIndex > 0) {
                setState(() {
                  themeIndex--;
                });
              }
            },
            icon: const Icon(Icons.arrow_back),
          ),
          Column(children: [Text(themes[themeIndex]), const Text("Тема")]),
          IconButton(
            onPressed: () {
              if (themeIndex < themes.length - 1) {
                setState(() {
                  themeIndex++;
                });
              }
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      )
    ];
    return dataBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройки"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RolesPage(
                              countPlayers: countPlayers,
                              countSpies: countSpies,
                              theme: themes[themeIndex],
                              time: time,
                            )));
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: data(),
        ),
      ),
    );
  }
}
