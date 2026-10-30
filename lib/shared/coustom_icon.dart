import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoustomIcon extends StatelessWidget {
  const CoustomIcon({super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 30),
    );
  }
}
