import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier{
  int selectThemeIndex=3;

  // Color primaryColor=Color(0xff6A8528);
  // Color primaryColor1=Color(0XFF4E6713);
  // Color primaryColor2=Color(0xFFE0E8D3);
  // Color primaryColor3=Color(0xFF90A75B);

  Color primaryColor1=Color(0xFFAE91F2);
  Color scrollGlowColor=Color(0xFFAE91F2);
  Color primaryColor2=Color(0xFF7C44F1);
  Color primaryColor3=Color(0xFF5E22EB);
  Color primaryColor4=Color(0xFF4A1BB4);
  Color loginBtn=Color(0xFF300B78);
  Color addNewAppBarColor=Color(0xFFF6F5F9);
  Color addNewBodyColor=Color(0xFFffffff);

  updateTheme(int index){
    selectThemeIndex=index;

    if(index==1){

      primaryColor1=Color(0XFF4E6713);
      primaryColor2=Color(0xFFE0E8D3);
      addNewAppBarColor=Color(0xFFF6F5F9);
      addNewBodyColor=Color(0xFFffffff);
    }
    else if(index==2){

      primaryColor1=Color(0XffA73A24);
      primaryColor2=Color(0xFFFDBCAE);
      addNewAppBarColor=Color(0xFFF6F5F9);
      addNewBodyColor=Color(0xFFffffff);
    }
    else if(index==3){

       primaryColor1=Color(0xFFAE91F2);
       primaryColor2=Color(0xFF7C44F1);
       primaryColor3=Color(0xFF5E22EB);
       addNewAppBarColor=Color(0xFFF6F5F9);
       addNewBodyColor=Color(0xFFffffff);
    }
    else if(index==4){

      primaryColor1=Color(0XffAA6720);
      primaryColor2=Color(0xFFFFD7AD);
      addNewAppBarColor=Color(0xFFF6F5F9);
      addNewBodyColor=Color(0xFFffffff);
    }
    else if(index==5){

      primaryColor1=Color(0Xff1267A8);
      primaryColor2=Color(0xFFD1EAFE);
      addNewAppBarColor=Color(0xFFF6F5F9);
      addNewBodyColor=Color(0xFFffffff);
    }




    else{
      primaryColor1=Color(0xff6A8528);
      addNewAppBarColor=Color(0xFFF6F5F9);
      addNewBodyColor=Color(0xFFffffff);
    }


    notifyListeners();

  }

}