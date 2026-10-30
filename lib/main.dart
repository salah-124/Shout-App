import 'package:flutter/material.dart';
import 'package:shout_app/splash_view.dart';

void main() {
  runApp(SholarApp());
}

class SholarApp extends StatelessWidget {
  const SholarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: splashView());
  }
}
