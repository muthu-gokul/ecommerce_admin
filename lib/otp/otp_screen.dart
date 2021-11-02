import 'package:flutter/material.dart';
import 'package:scutiwidgets/size.dart';


import 'components/body.dart';

class MailScreen extends StatelessWidget {
  static String routeName = "/mail-otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("OTP Verification"),
        // ),
        body: Body(),
      ),
    );
  }
}
