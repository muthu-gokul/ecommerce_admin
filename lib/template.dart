import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import '../../constants.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
class template extends StatefulWidget {
  const template({Key? key}) : super(key: key);

  @override
  _templateState createState() => _templateState();
}

class _templateState extends State<template> {
  late double width;
  @override
  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-100;
    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=> Container(
        height: SizeConfig.screenHeight!-50,
        width: width,
        color: bgColor,
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            Container(
              height: 50,
              child: Row(
                children: [
                  Spacer(),
                  AddBtn(
                    ontap: (){

                    },
                    color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}