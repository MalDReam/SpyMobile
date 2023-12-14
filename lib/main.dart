import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MyApp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent) );
  runApp(const MyApp());}

