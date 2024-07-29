import 'package:flutter/material.dart';
import 'package:spy_mobile/pages/hints_page.dart';
import 'package:spy_mobile/pages/home_page.dart';
import 'package:spy_mobile/pages/rules_page.dart';

class SpyMobileApp extends StatelessWidget {
  const SpyMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/hints_page': (context) => const HintsPage(),
        '/rules_page': (context) => RulesPage(),
      },
    );
  }
}