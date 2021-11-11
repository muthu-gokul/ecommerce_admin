import 'package:flutter/material.dart';

class DrawerContentModel{
  String img;
  String title;
  Widget? widget;
  double rightPadd;
  double imgHeight;
  DrawerContentModel({required this.img,required this.title, this.widget,this.rightPadd=5,required this.imgHeight});
}