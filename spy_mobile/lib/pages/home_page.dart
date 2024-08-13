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
            Container(
              // Logo and name
              child: Column(
                children: [
                  SizedBox(
                    width: 256,
                    height: 256,
                    child: Image.asset("assets/images/spy-256.png",
                        color: Colors.black54),
                  ),
                  const Text(
                    "SPY MOBILE",
                    style: TextStyle(fontSize: 22),
                  )
                ],
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings_page');
              },
              child: const Text(
                "Начать",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/hints_page');
                  },
                  label: const Text("Подсказки"),
                  icon: const Icon(Icons.announcement_outlined),
                ),
                FilledButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/rules_page');
                  },
                  label: const Text("Правила"),
                  icon: const Icon(Icons.help_outline),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
