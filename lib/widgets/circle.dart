import 'package:flutter/material.dart';
class Circle extends StatelessWidget {
  double hei;
  Color color;
  Circle({required this.hei,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hei,
      width: hei,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color
      ),
    );
  }
}
