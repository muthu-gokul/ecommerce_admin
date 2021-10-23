
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


String decimalReg=r'^\d+\.?\d{0,2}';

int phoneNoLength=10;
int zipcodeLength=6;
String digitRegEx='[0-9]';
String alphaSpaceRegEx='[A-Za-z ]';
String addressRegEx='[A-Za-z0-9-,_/*+()@. ]';
String currentDate=DateFormat("dd-MM-yyyy").format(DateTime.now());

var formatCurrency = NumberFormat.currency(locale: 'HI',name: "");

Duration animeDuration = Duration(milliseconds: 300);
Cubic animeCurve=Curves.easeIn;
String validationText="* Required";

Color disableColor=Color(0xFFe8e8e8);
Color addNewTextFieldText=Color(0xFF787878);
Color addNewTextFieldBorder=Color(0xFFE5E5E5);
Color addNewTextFieldFocusBorder=Color(0xFFE5E5E5);
Color bgColor=Color(0xFFF3F4F9);
Color grey1=Color(0xFF595959);//nav bar title
Color grey2=Color(0xFF565859);//grid header
Color grey3=Color(0xFF808080);//grid Text
Color grey4=Color(0xFFE3E4E9);//grid border

TextStyle textFormTs1=TextStyle(fontFamily: 'RR',fontSize: 16,color:addNewTextFieldText,letterSpacing: 0.2);
TextStyle textFormHintTs1=TextStyle(fontFamily: 'RL',fontSize: 15,color: addNewTextFieldText.withOpacity(0.9));
TextStyle whiteRM20=TextStyle(fontFamily: 'RM',color: Colors.white,fontSize: 20);


double textFormWidth=400;


glowFun(BuildContext context){
  return Theme.of(context).copyWith(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Provider.of<ThemeNotifier>(context,listen:false).scrollGlowColor.withOpacity(0.8)
      )
  );
}

glowTransparent(BuildContext context){
  return Theme.of(context).copyWith(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.white10
      )
  );
}

ts12(Color color,{String fontfamily='RR'}){
  return TextStyle(fontSize: 12,fontFamily: fontfamily,color: color,letterSpacing: 0.1);
}
ts14(Color color,{String fontfamily='RR'}){
  return TextStyle(fontSize: 14,fontFamily: fontfamily,color: color,letterSpacing: 0.1);
}
ts15(Color color,{String fontfamily='RR'}){
  return TextStyle(fontSize: 15,fontFamily: fontfamily,color: color,letterSpacing: 0.1);
}
ts16(Color color,{String fontfamily='RR'}){
  return TextStyle(fontSize: 16,fontFamily: fontfamily,color: color,letterSpacing: 0.1);
}
ts18(Color color,{String fontfamily='RR',double fontsize=18}){
  return TextStyle(fontSize: fontsize,fontFamily: fontfamily,color: color,letterSpacing: 0.1);
}


// BoxShadow(
// color: Colors.grey.withOpacity(0.3),
// blurRadius: 20,
// spreadRadius: 2,
// offset: Offset(0,0)
// )
//Provider.of<ThemeNotifier>(context,listen: false)
//Provider.of<ProductNotifier>(context,listen: false)