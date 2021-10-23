import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class BackBtn extends StatelessWidget {
  VoidCallback ontap;
  BackBtn({required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:ontap,
        child: Container(
            height: 50,width: 100 ,
            color: Colors.transparent,
            child: Center(
                child: SvgPicture.asset("assets/icons/arrow-back.svg",width: 30,height: 30,color: Colors.white,)
            )
        ),
    );
  }
}
