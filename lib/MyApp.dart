import 'package:flutter/material.dart';
import 'HomeFile.dart';
import 'SettingsFile.dart';
import 'RolesFile.dart';
import 'TimerFile.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeRoute(),
      routes:
      {
        '/HomePage': (context)      => HomeRoute(),
        '/SettingsPage': (context)  => SettingsRout(),
        '/RolesPage': (context)     => RolesRout(),
        '/TimerPage': (context)     => TimerRout()
      },
    );
  }
}