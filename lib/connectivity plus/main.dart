import 'package:flutter/material.dart';
import 'package:flutter_adv_ch4/connectivity%20plus/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Screens(),
      },
    );
  }
}
