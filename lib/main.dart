import 'package:flutter/material.dart';
import 'package:study_flutter_08_codingchef05_chat/screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginSignupScreen(),
    );
  }
}
