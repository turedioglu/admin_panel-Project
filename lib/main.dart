import 'package:flutter/material.dart';

import 'on_board.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel OnBoard',
      home: OnBoardPage(),
    );
  }
}