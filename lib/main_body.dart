import 'package:flutter/material.dart';

class MainBody extends StatelessWidget {
  final double iconSize;
  final Color iconColor;

  MainBody({required this.iconSize, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.access_alarm,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
