import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  int countPlayers = 3;
  int countSpys = 1;
  int time = 5;

  final List<SettingsRowData> settingsRowData = [
    SettingsRowData(
      leftIcon: Icons.remove, 
      rightIcon: Icons.add, 
      headerRow: "Количество учстников"
    ),
    SettingsRowData(
      leftIcon: Icons.remove, 
      rightIcon: Icons.add, 
      headerRow: "Количество шпионов"
    ),
    SettingsRowData(
      leftIcon: Icons.remove, 
      rightIcon: Icons.add, 
      headerRow: "Количество времени"
    ),
    SettingsRowData(
      leftIcon: Icons.chevron_left_rounded, 
      rightIcon: Icons.chevron_right_rounded, 
      headerRow: "Тема"
    ),
  ];


  @override
  Widget build(BuildContext context) {

    final List<Widget> data = settingsRowData
        .map((settingsRowData) => SettingsRow(data: settingsRowData)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройки"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.check)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: data,
        ),
      ),
    );
  }
}


//Класс данных строки
class SettingsRowData{
  final IconData leftIcon;
  final IconData rightIcon;
  final String headerRow;
  var valueRow = 0;

  SettingsRowData({
    required this.leftIcon, 
    required this.rightIcon, 
    required this.headerRow,
    //required this.valueRow
  });
}


//Класс описания строки настроек
class SettingsRow extends StatefulWidget {
  final SettingsRowData data;

  const SettingsRow({
    super.key,
    required this.data
  });

  @override
  State<SettingsRow> createState() => _SettingsRowState();
}

class _SettingsRowState extends State<SettingsRow> {

  int plusValue(int value){
    setState((){value++;});
    print(value);
    return value;
  }

  int minusValue(int value){
    setState((){value--;});
    print(value);
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {widget.data.valueRow = minusValue(widget.data.valueRow); }, 
            icon: Icon(widget.data.leftIcon)),
          Column(
            children: [
              Text("${widget.data.valueRow}"),
              Text(widget.data.headerRow),
            ],
          ),
          IconButton(
            onPressed: () {widget.data.valueRow = plusValue(widget.data.valueRow); }, 
          icon: Icon(widget.data.rightIcon)),
        ],
      ),
    );
  }
}
