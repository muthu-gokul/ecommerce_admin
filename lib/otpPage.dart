import 'package:ecommerce_admin/forgot.dart';
import 'package:ecommerce_admin/login.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';

import 'package:ecommerce_admin/pages/createBusinessAccount.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import 'package:scutiwidgets/size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'otp/components/otp_form.dart';


class OTPHome extends StatefulWidget {
  const OTPHome({Key? key}) : super(key: key);

  @override
  _OTPHomeState createState() => _OTPHomeState();
}

class _OTPHomeState extends State<OTPHome> with SingleTickerProviderStateMixin{



  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController password = new TextEditingController();
  TextEditingController confrimpassword = new TextEditingController();
  late bool passwordvisible;
  late bool loginvalidation;
  late AnimationController shakecontroller;
  late Animation<double> offsetAnimation;
  bool isLoading=false;
  bool isVisible=false;
  bool? rememberMe=false;

  String? prefEmail;
  String? prefPassword;
  bool? prefRememberMe;
  late SharedPreferences _Loginprefs;
  static const String useremail = 'email';
  static const String passwordd = 'password';
  static const String rememberMee = 'rememberMe';


  void _loadCredentials() {

    setState(() {
      this.prefEmail = this._Loginprefs.getString(useremail) ?? "";
      this.prefPassword = this._Loginprefs.getString(passwordd) ?? "";
      this.prefRememberMe = this._Loginprefs.getBool(rememberMee) ?? false;
    });
    setState(() {
      rememberMe=prefRememberMe;
    });
    if(prefRememberMe!){
      if(prefEmail!.isNotEmpty&&prefPassword!.isNotEmpty){
        setState(() {
          confrimpassword.text=prefEmail!;
          password.text=prefPassword!;
        });
      }
    }
  }

  Future<Null> _setCredentials(String email,String pass,bool rem) async {
    await this._Loginprefs.setString(useremail, email);
    await this._Loginprefs.setString(passwordd, pass);
    await this._Loginprefs.setBool(rememberMee, rem);
    // _loadCredentials();
  }

  late var node;
  Color fillColor=Color(0xFFFFFFFF);
  Color borderColor=Color(0xFFFFFFFF);
  Color inputTextColor=Color(0xFF9b9b9b);


  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    passwordvisible = true;
    loginvalidation=false;
    shakecontroller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    confrimpassword.clear();
    password.clear();
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() => this._Loginprefs = prefs);

        _loadCredentials();
      });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    node=FocusScope.of(context);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);

    offsetAnimation = Tween(begin: 0.0, end: 28.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(shakecontroller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          shakecontroller.reverse().whenComplete(() {
            setState(() {
              loginvalidation=false;
            });
          });
        }
      });
    return SafeArea(
      child: Scaffold(
        body: Consumer<ThemeNotifier>(
          builder: (context,th,child)=> Theme(
            data: glowFun(context),
            child: SingleChildScrollView(
              child: Container(
                height: SizeConfig.screenHeight!,
                width: SizeConfig.screenWidth,
                color: th.primaryColor1,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: Container(
                        height: SizeConfig.screenHeight,
                        width: SizeConfig.screenWidth!*0.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/login-bg.jpg"),
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      right: 70,
                      top: SizeConfig.screenHeight!*0.1,
                      child: Container(
                        height: SizeConfig.screenHeight!*0.8,
                        width: SizeConfig.screenWidth!*0.43,

                        decoration: BoxDecoration(
                            color: th.primaryColor2,
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //SizedBox(height: SizeConfig.screenHeight! * 0.1,),
                            SizeConfig.screenWidth!<980?Container():Image.asset("assets/login/logo.jpg",height: 150,),
                            SizedBox(height: 10,),
                            Container(
                              width: SizeConfig.screenWidth!*0.85,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Enter 4-digit",style: TextStyle(fontSize: 30,fontFamily: 'RB',color: Color(0XFFffffff)),),
                                  Text("recovery code",style: TextStyle(fontSize: 30,fontFamily: 'RB',color: Color(0XFFffffff)),),
                                  SizedBox(height: 10,),
                                  Container(
                                    alignment: Alignment.center,
                                    width: SizeConfig.screenWidth!*0.60,
                                    child: Text("the recovery code was sent to your email. Please enter the code:",style: ts16(Color(0XFFffffff)),textAlign: TextAlign.left,),
                                  ),
                                  buildTimer(),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            OtpForm(),
                            SizedBox(height:10),
                            Container(
                              height: 60,
                              width: SizeConfig.screenWidth! > 420? SizeConfig.screenWidth! * 0.4:SizeConfig.screenWidth!*0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: th.loginBtn,
                                  boxShadow: [
                                    BoxShadow(
                                        color:th.loginBtn.withOpacity(0.7),
                                        offset: const Offset(0, 9.0),
                                        blurRadius: 25.0,
                                        spreadRadius: 1
                                    )
                                  ]
                              ),
                              alignment: Alignment.center,
                              child: Text("Resend OTP",style: whiteRM20,),
                            ),
                            SizedBox(height: 10,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, pr.PageRoute().slideFromLeftToRight(Login()));
                              },
                              child: Container(
                                height: 60,
                                width: SizeConfig.screenWidth! > 420? SizeConfig.screenWidth! * 0.4:SizeConfig.screenWidth!*0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: th.loginBtn,
                                    boxShadow: [
                                      BoxShadow(
                                          color:th.loginBtn.withOpacity(0.7),
                                          offset: const Offset(0, 9.0),
                                          blurRadius: 25.0,
                                          spreadRadius: 1
                                      )
                                    ]
                                ),
                                alignment: Alignment.center,
                                child: Text("Verified OTP",style: whiteRM20,),
                              ),
                            ),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, pr.PageRoute().slideFromLeftToRight(ForgotPassword()));
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text("Back to forget screen",style: TextStyle(fontFamily: 'RR',color: Colors.white,fontSize: 18,letterSpacing: 0.1,),)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: 'Please enter the ',
            style: TextStyle(fontSize: 14,fontFamily: 'RR',color: Color(0XFFFFFFFF)),
            children: const <TextSpan>[
              TextSpan(text: 'OTP', style: TextStyle(fontSize: 16,fontFamily: 'RB',color: Color(0XFFffffff))),
              TextSpan(text: ' sent to  ', style: TextStyle(fontSize: 14,fontFamily: 'RR',color: Color(0XFFffffff))),
            ],
          ),

        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color:Color(0XFFFFFFFF)),
          ),
        ),
      ],
    );
  }
}
