import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';



class RulesPage extends StatelessWidget {

  final List<RuleCardData> ruleCardData = [
    RuleCardData(
      textHeader: "Об игре", 
      textDesc: "Шпион - игра для комании от трёх человек. Каждому игроку выдается карточка, на которой указана его роль.", 
      icon: Icons.info_outline_rounded
    ),
    RuleCardData(
      textHeader: "Начало", 
      textDesc: "Настройте игру, раздайте роли и вперёд! Всего две роли: шпионы и игроки", 
      icon: Icons.flag_outlined
    ),
    RuleCardData(
      textHeader: "Игрок", 
      textDesc: "Тем, кому выпала роль \"игрок\", известна общая локация. Задавайте друг другу вопросы и ищите шпиона!", 
      icon: Icons.person_outline
    ),
    RuleCardData(
      textHeader: "Шпион", 
      textDesc: "Тем, кому выпала роль \"шпион\", не известна общая локация. Задавайте друг другу вопросы и угадывайте локацию!", 
      icon: Icons.person
    ),
    RuleCardData(
      textHeader: "Цель", 
      textDesc: "Все участники задают друг другу вопросы, связанные с локацией. Игроки должны по ответам определить шпиона, а шпион должен угадать локацию раньше чем его раскроют.", 
      icon: Icons.flag_outlined
    ),
    RuleCardData(
      textHeader: "Конец", 
      textDesc: "Пока идёт таймер - задавайте вопросы. Как только таймер кончился, игроки голосуют за шпиона. Если шпион так и не найден, он может отгадать локацию.", 
      icon: Icons.autorenew_outlined
    ),
  ];

  RulesPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Widget> data = ruleCardData
        .map((ruleCardData) => RuleCard(data: ruleCardData,)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Правила"),
        centerTitle: true,
      ),
      body: Center(
        child: CarouselSlider(
          items: data,
          options: CarouselOptions(
            height: 500,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
          ),
        ),
      ),
      
    );
  }
}


// Класс для хранения данных карточки правил
class RuleCardData{

  final String textHeader;
  final String textDesc;
  final IconData icon;

  RuleCardData({required this.textHeader, required this.textDesc, required this.icon});
}


// Описание карточки правил
class RuleCard extends StatelessWidget {

  final RuleCardData data;

  const RuleCard({
    super.key, 
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: _FrontSideCard(data: data), 
      back: _BackSideCard(data: data)
    );
  }
}


//Передняя сторона карточки
class _FrontSideCard extends StatelessWidget {

  final RuleCardData data;

  const _FrontSideCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40), //Для "необрезанной" анимации переварачивания
      decoration: BoxDecoration(
        color: Colors.red[300],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              data.icon,
              size: 128,
            ),
            Text(
              data.textHeader,
              style: const TextStyle(
                fontSize: 28
              ),
            ),
            const Text("(Нажмите на карточку)")
          ],
        ),
      ),
    );
  }
}


//Задняя сторона карточки
class _BackSideCard extends StatelessWidget {

  final RuleCardData data;

  const _BackSideCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40), //Для "необрезанной" анимации переварачивания
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            data.textDesc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18
            ),
          ),
        )
      )
    );
  }
}