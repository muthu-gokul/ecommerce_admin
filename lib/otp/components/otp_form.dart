import 'package:flutter/material.dart';
import 'package:scutiwidgets/size.dart';

import '../../Otp-style.dart';



class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight !* 0.05),
          Container(
            width: SizeConfig.screenWidth !* 0.75,
            margin: EdgeInsets.only(left: 100,right: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    autofocus: true,
                    obscureText: true,
                      obscuringCharacter: '*',
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      nextField(value, pin2FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    obscuringCharacter: '*',
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin3FocusNode),
                  ),
                ),
                SizedBox(
                  width:50,
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    obscuringCharacter: '*',
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin4FocusNode),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    obscuringCharacter: '*',
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin4FocusNode!.unfocus();
                        // Then you need to check is the code is correct or not
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          // DefaultButton(
          //   text: "Continue",
          //   press: () {},
          // )
        ],
      ),
    );
  }
}
