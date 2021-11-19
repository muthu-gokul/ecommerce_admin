import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
class SaveBtn extends StatelessWidget {
  VoidCallback ontap;
  String title;
  double hei;
  double wid;
  SaveBtn({required this.ontap,this.title="Save",this.hei=50,this.wid=150});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: hei,
        width: wid,
        decoration: BoxDecoration(
          color:  Provider.of<ThemeNotifier>(context,listen: false).loginBtn,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text("$title",style: TextStyle(fontFamily: 'RM',color: Colors.white,fontSize: 20),),
      ),
    );
  }
}
class SaveBtn2 extends StatelessWidget {
  VoidCallback ontap;
  String title;
  double hei;
  double wid;
  Color color;
  Color textColor;
  SaveBtn2({required this.ontap,this.title="Save",this.hei=50,this.wid=150,required this.color,this.textColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: hei,
        width: wid,
        decoration: BoxDecoration(
          color:  color,
          borderRadius: BorderRadius.circular(7),
        ),
        alignment: Alignment.center,
        child: Text(title,style: ts16(textColor,fontfamily: 'RM'),),
      ),
    );
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: hei,
        width: wid,
        decoration: BoxDecoration(
          color:  Provider.of<ThemeNotifier>(context,listen: false).loginBtn,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text("$title",style: TextStyle(fontFamily: 'RM',color: Colors.white,fontSize: 20),),
      ),
    );
  }
}
