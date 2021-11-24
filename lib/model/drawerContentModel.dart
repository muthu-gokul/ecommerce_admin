import 'package:flutter/material.dart';

class DrawerContentModel{
  String img;
  String title;
  Widget? widget;
  double rightPadd;
  double imgHeight;
  bool isReport=false;
  List<DrawerContentModel> list;
  bool isExpand;
  int index;
  DrawerContentModel({required this.img,required this.title, this.widget,this.rightPadd=5,required this.imgHeight,
    this.isReport=false,this.list=const [],this.isExpand=false,required this.index});
}