import 'package:captainneuro/pages/const.dart';
import 'package:captainneuro/pages/geminichat.dart';
import 'package:captainneuro/pages/home.dart';
import 'package:captainneuro/pages/navbar.dart';
import 'package:captainneuro/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void main() {
  Gemini.init(
    apiKey: GEMINI_API_KEY,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.grey.shade100,
        useMaterial3: true,
      ),
      home: NavbarPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
        '/geminichat': (context) => GeminiChatPage()
      },
    );
  }
}
