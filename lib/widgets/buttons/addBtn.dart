import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AddBtn extends StatelessWidget {
  VoidCallback ontap;
  EdgeInsets margin;
  double hei;
  Color color;
  Widget widget;
  AddBtn({required this.ontap,this.margin=const EdgeInsets.only(right: 50),this.hei=50,required this.color,
  this.widget=const Icon(Icons.add,color: Colors.white,size: 25,)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: hei,
        width: hei,
        margin: margin,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color
        ),
        alignment: Alignment.center,
        child: widget,
      ),
    );
  }
}
