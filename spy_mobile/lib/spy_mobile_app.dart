import 'package:flutter/material.dart';
import 'package:spy_mobile/theme/light_theme.dart';
import 'package:spy_mobile/theme/theme.dart';
import 'package:spy_mobile/pages/hints_page.dart';
import 'package:spy_mobile/pages/home_page.dart';
import 'package:spy_mobile/pages/roles_page.dart';
import 'package:spy_mobile/pages/rules_page.dart';
import 'package:spy_mobile/pages/settings_page.dart';
import 'package:spy_mobile/pages/timer_page.dart';

class SpyMobileApp extends StatelessWidget {
  const SpyMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: createLightTheme(),
      routes: {
        '/': (context) => const HomePage(),
        '/hints_page': (context) => const HintsPage(),
        '/rules_page': (context) => RulesPage(),
        '/settings_page': (context) => const SettingsPage(),
        '/roles_page': (context) => const RolesPage(
              countPlayers: 3,
              countSpies: 1,
              theme: "Города",
              time: 1,
            ),
        '/timer_page': (context) => const TimerPage(time: 1),
      },
    );
  }
}
