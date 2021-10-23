import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ActionIcon extends StatelessWidget {
  double imgHeight;
  VoidCallback ontap;
  Color imgColor;
  String img;
  ActionIcon({ this.imgHeight=25,required this.ontap,required this.imgColor,required this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child:  Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        color: Colors.transparent,
        child: SvgPicture.asset(img,height: imgHeight,color: imgColor,),
      ),
    );
  }
}
