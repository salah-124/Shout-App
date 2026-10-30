import 'package:flutter/material.dart';

class CoustomText extends StatelessWidget {
  const CoustomText({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
    this.color = Colors.black,
  });
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
    );
  }
}
