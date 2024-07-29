import 'package:flutter/material.dart';

class HintsPage extends StatelessWidget {
  final List<String> _textOfData = const [
    "Живут ли там пингвины?", 
    "Там сыро?", 
    "Чем славится это место?",
    "Можно ли туда пригласить на первое свидание?",
    "Это место находится высоко?",
    "Может ли человек находиться там без специального оборудования?",
    "Там опасно?",
    "Там продают сладкое?",
    "Есть ли там животные?",
    "На что в этом месте можно потратить деньги?",
    "Чем там питаются люди?",
    "Можно ли там плавать?",
    "Там говорят на нашем языке?",
    "Оттуда можно уйти самому?",
    "Там можно спать?",
    "Какие опасности могут быть в этом месте?"
  ];
  const HintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Подсказки"),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: _textOfData.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => HintsRow(data: _textOfData[index]),
      ),
    );
  }
}

class HintsRow extends StatelessWidget {
  final String data;
  const HintsRow({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(data),
    );
  }
}