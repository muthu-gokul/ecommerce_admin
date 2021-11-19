import 'package:flutter/material.dart';

import '../../constants.dart';
class DeleteBtnText extends StatelessWidget {
  VoidCallback ontap;
  double hei;
   DeleteBtnText({required this.ontap,this.hei=40});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        height: hei,
        width: 50,
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Text("Delete",style: ts16(Colors.red,fontfamily: 'RR'),),
      ),
    );
  }
}
