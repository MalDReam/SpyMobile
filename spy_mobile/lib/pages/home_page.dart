import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container( // Logo and name
              child: const Column(
                children: [
                  SizedBox(
                    child: Placeholder(), 
                    width: 200, 
                    height: 200
                  ),
                  Text("SPY MOBILE")
                ],
              ),
            ),
            ElevatedButton(
              onPressed: (){Navigator.pushNamed(context, '/settings_page');}, 
              child: const Text("Начать"),
            ),   
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){Navigator.pushNamed(context, '/hints_page');}, 
                  child: const Text("Подсказки"),
                ),
                ElevatedButton(
                  onPressed: (){Navigator.pushNamed(context, '/rules_page');}, 
                  child: const Text("Правила"),
                )
              ],
            )        
          ],
        ),
      ),
    );
  }
}