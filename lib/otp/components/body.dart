
import 'package:ecommerce_admin/pages/createBusinessAccount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scutiwidgets/size.dart';


import '../../constants.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(height: SizeConfig.screenHeight !* 0.05),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/loginpages/otp.png', width: 200,fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: SizeConfig.screenWidth!*0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Enter 4-digit",style: TextStyle(fontSize: 30,fontFamily: 'RB',color: Color(0XFF212B3B)),),
                        Text("recovery code",style: TextStyle(fontSize: 30,fontFamily: 'RB',color: Color(0XFF212B3B)),),
                        SizedBox(height: 10,),
                        Container(
                          width: SizeConfig.screenWidth!*0.60,
                          child: Text("the recovery code was sent to your email. Please enter the code:",style: ts16(Color(0XFF7D7D7D)),textAlign: TextAlign.left,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  OtpForm(),
                  SizedBox(height:10),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateBusinessAccount()),);
                    },
                    child: Container(
                      width: SizeConfig.screenWidth!*0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // boxShadow: [
                        //   BoxShadow(color: Colors.green, spreadRadius: 3),
                        // ],
                        color: Color(0XFF371176),
                      ),
                      child:Center(child: Text('Sumbit',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xffffffff),fontFamily:'RR'), )) ,
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Please enter the ',
            style: TextStyle(fontSize: 14,fontFamily: 'RR',color: Color(0XFF000000)),
            children: const <TextSpan>[
              TextSpan(text: 'OTP', style: TextStyle(fontSize: 16,fontFamily: 'RB',color: Color(0XFF000000))),
              TextSpan(text: ' sent to  ', style: TextStyle(fontSize: 14,fontFamily: 'RR',color: Color(0XFF000000))),
            ],
          ),

        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color:Color(0XFF6A8528)),
          ),
        ),
      ],
    );
  }
}
