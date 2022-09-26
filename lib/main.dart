import 'dart:math';

import 'package:click_to_pay/new.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:like_button/like_button.dart';
import 'package:confetti/confetti.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home:
      PayScreen(),

      //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
