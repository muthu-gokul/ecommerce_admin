import 'package:flutter/material.dart';

Color yellowColor=Color(0xFF158BCC);
Color bgColor=Color(0xFF4267F6);
Color gridBodyBgColor=Color(0xFFFFFFFF);
Color grey=Color(0xFF787878);
Color lightGrey=Color(0xffF8F8FA);
Color addNewTextFieldBorder=Color(0xFFCDCDCD);
const Color addNewTextFieldFocusBorder=Color(0xFF6B6B6B);
Color disableColor=Color(0xFFe8e8e8);
Color uploadColor=Color(0xFFC7D0D8);
Color indicatorColor=Color(0xFF1C1C1C);

Border gridBottomborder= Border(bottom: BorderSide(color: addNewTextFieldBorder.withOpacity(0.5)));
TextStyle bgColorTS14=TextStyle(fontFamily: 'RR',color: bgColor,fontSize: 14);
TextStyle gridHeaderTS=TextStyle(fontFamily: 'RR',color: bgColor,fontSize: 16);
TextStyle gridTextColor14=TextStyle(fontFamily: 'RR',color: grey,fontSize: 14);
TextStyle gridTextColor15=TextStyle(fontFamily: 'RR',color:Colors.black,fontSize: 14);
TextStyle TSWhite166=TextStyle(fontFamily: 'RR',fontSize: 16,color: Colors.white,letterSpacing: 0.1);
TextStyle hintText=TextStyle(fontFamily: 'RR',fontSize: 16,color: grey.withOpacity(0.5));

late String prefEmail;
late String prefPassword;



const kPrimaryColor = Color(0xFFFFFFFF);
const kTextColor = Color(0xFFFFFFFF);

final headingStyle = TextStyle(
  fontSize:28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final otpInputDecoration = InputDecoration(fillColor: Colors.red,
  contentPadding:
  EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: kTextColor),
  );
}
//rawScrollBar Properties
const Color srollBarColor=Colors.white;
const double scrollBarRadius=5.0;
const double scrollBarThickness=4.0;


double attWidth=10;
// BoxShadow(
// color: Colors.grey.withOpacity(0.3),
// blurRadius: 20,
// spreadRadius: 2,
// offset: Offset(0,0)
// )