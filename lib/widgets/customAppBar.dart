import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../constants.dart';
import 'buttons/backBtn.dart';
class CustomAppBarAddNew extends StatelessWidget {
  String title;
  bool diffColor;
  Color color;
  CustomAppBarAddNew({required this.title,this.diffColor=false,this.color=Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color:  diffColor?color:Provider.of<ThemeNotifier>(context,listen: false).addNewAppBarColor,
        borderRadius: BorderRadius.circular(7),
      ),
      
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: [
          BackBtn(
            ontap: (){
              Navigator.pop(context);
            },
            imgColor: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
          ),
          Text(title,style: TextStyle(fontFamily: 'RR',color: grey1,fontSize: 20),),
        ],
      ),
    );
  }
}
