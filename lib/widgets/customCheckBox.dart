import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
class CustomCheckBox extends StatefulWidget {
  bool show;
  VoidCallback ontap;
  CustomCheckBox({required this.show,required this.ontap});
  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:widget.ontap,
      child: AnimatedContainer(
        duration: animeDuration,
        curve: animeCurve,
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color:widget.show?Provider.of<ThemeNotifier>(context,listen: false).primaryColor2: addNewValuesBg,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color:widget.show?Colors.transparent: Provider.of<ThemeNotifier>(context,listen: false).primaryColor1.withOpacity(0.4))
        ),
        child: widget.show?Icon(Icons.done,color: Colors.white,size: 15,):Container(),
      ),
    );
  }
}
