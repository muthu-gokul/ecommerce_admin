import 'package:flutter/material.dart';
class Circle extends StatelessWidget {
  double hei;
  Color color;
  Widget? widget;
  List<BoxShadow> bs;
  Circle({required this.hei,required this.color,this.widget,this.bs=const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hei,
      width: hei,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: bs
      ),
      child: widget??Container(),
    );
  }
}
