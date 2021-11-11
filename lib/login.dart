/*
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/createBusinessAccount.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import 'package:scutiwidgets/size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin{



  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
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
          username.text=prefEmail!;
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
    username.clear();
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

                            Form(
                                key: _loginFormKey,
                                child: AnimatedBuilder(
                                    animation: offsetAnimation,
                                    builder: (context, child) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(horizontal: 24.0),
                                        padding: EdgeInsets.only(
                                            left: offsetAnimation.value + 30.0,
                                            right: 30.0 - offsetAnimation.value),
                                        child: Container(
                                          // margin: EdgeInsets.only(top: _height * 0.28),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              loginvalidation?Text("Invalid Email Or Password",
                                                style: TextStyle(color: Colors.red,fontSize: 18,fontFamily: 'RR',letterSpacing: 0.2),
                                              ):Container(height: 20,width: 0,),
                                              SizedBox(height: 10,),
                                              Text("User Email",style: TextStyle(fontFamily: 'RR',color: Colors.white,fontSize: 20),),
                                              SizedBox(height: 10,),
                                              Container(
                                                height: 60,
                                                width:SizeConfig.screenWidth! > 420? SizeConfig.screenWidth! * 0.4:SizeConfig.screenWidth!*0.8,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(13),
                                                    border:loginvalidation? Border.all(color: Colors.red,width: 2):Border.all(color: borderColor,width: 2),
                                                    color: loginvalidation?Color(0xFFCECECE):fillColor),
                                                child: TextFormField(
                                                  scrollPadding: EdgeInsets.only(bottom:SizeConfig.height250!),
                                                  style: TextStyle(color:loginvalidation?Colors.red:inputTextColor,fontSize:18,fontFamily: 'RR' ),
                                                  controller: username,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    hintText: "Email",
                                                    hintStyle: TextStyle(
                                                        color:loginvalidation?Colors.red: inputTextColor.withOpacity(0.7),fontSize: 18,fontFamily: 'RR'),
                                                    contentPadding: EdgeInsets.only(left: 20,top: 5),
                                                    //   fillColor: loginvalidation?HexColor("1C1F32"):Colors.white,

                                                  ),
                                                  keyboardType: TextInputType.emailAddress,
                                                  validator:(value){

                                                    Pattern pattern =
                                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                                    RegExp regex = new RegExp(pattern as String);
                                                    if (!regex.hasMatch(value!)) {
                                                      return 'Email format is invalid';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  onEditingComplete: (){
                                                    node.nextFocus();
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: 20,),
                                              Text("Password",style: TextStyle(fontFamily: 'RR',color: Colors.white,fontSize: 20),),
                                              SizedBox(height: 10,),
                                              Container(
                                                height: 60,
                                                width: SizeConfig.screenWidth! > 420? SizeConfig.screenWidth! * 0.4:SizeConfig.screenWidth!*0.8,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(13),
                                                    border:loginvalidation? Border.all(color: Colors.red,width: 2):Border.all(color: borderColor,width: 2),
                                                    color:loginvalidation?Color(0xFFCECECE): fillColor),
                                                child: TextFormField(
                                                  scrollPadding: EdgeInsets.only(bottom:SizeConfig.height250!),
                                                  style: TextStyle(color:loginvalidation?Colors.red:inputTextColor,fontSize:18,fontFamily: 'RR' ),
                                                  controller: password,
                                                  obscureText: passwordvisible,
                                                  obscuringCharacter: '*',
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      enabledBorder: InputBorder.none,
                                                      focusedBorder: InputBorder.none,
                                                      hintText: "Password",
                                                      hintStyle:TextStyle(color:loginvalidation?Colors.red:inputTextColor.withOpacity(0.7),fontSize:18,fontFamily: 'RR' ),
                                                      contentPadding: EdgeInsets.only(left: 20, top: 19),
                                                      // suffixIconConstraints: BoxConstraints(
                                                      //     minHeight: 55,
                                                      //     maxWidth: 55
                                                      // ),
                                                      suffixIcon: Padding(
                                                        padding:  EdgeInsets.only(right: 20,top: 3),
                                                        child: IconButton(icon: Icon(passwordvisible?Icons.visibility_off:Icons.visibility,size: 30,color: Colors.grey,),
                                                            onPressed: (){
                                                              setState(() {
                                                                passwordvisible=!passwordvisible;
                                                              });
                                                            }),
                                                      )
                                                  ),
                                                  keyboardType: TextInputType.emailAddress,
                                                  validator:(value){
                                                    if(value!.isEmpty){
                                                      return 'Password is required';
                                                    }
                                                  },
                                                  onEditingComplete: () async {
                                                    node.unfocus();
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: 40,),
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context, pr.PageRoute().fade(CreateBusinessAccount()));
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
                                                  child: Text("Login",style: whiteRM20,),
                                                ),
                                              )
                                              */
/*Container(
                                                height: _width > 420?68:50,
                                                width:_width > 420? _width * 0.4:_width*0.8,
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap:(){
                                                        setState(() {
                                                          rememberMe=!rememberMe!;
                                                        });
                                                      },
                                                      child: Container(
                                                        color:Colors.transparent,
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 25,
                                                              width: 25,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  color: fillColor,
                                                                  border: Border.all(color: borderColor)
                                                              ),
                                                              alignment: Alignment.center,
                                                              child:AnimatedContainer(
                                                                duration: animeDuration,
                                                                curve: animeCurve,
                                                                height: 15,
                                                                width: 15,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    color: fillColor,
                                                                    border: Border.all(color:rememberMe!? AppTheme.red:fillColor,width: 3)
                                                                ),

                                                              ),
                                                            ),
                                                            SizedBox(width: 15,),
                                                            Text("Remember Me",style: TextStyle(fontFamily: 'RR',color: inputTextColor,fontSize: 18,letterSpacing: 0.1),)
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),*//*


                                            ],
                                          ),
                                        ),
                                      );
                                    })),

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
}
*/



import 'package:ecommerce_admin/forgot.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/createBusinessAccount.dart';
import 'package:ecommerce_admin/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import 'package:scutiwidgets/size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin{



  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
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
          username.text=prefEmail!;
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
    username.clear();
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

                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/login-bg.jpg"),
                      fit: BoxFit.fill
                  ),
                  //color: th.primaryColor1,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: Container(
                        height: SizeConfig.screenHeight,
                        width: SizeConfig.screenWidth!*0.5,
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //       image: AssetImage("assets/images/login-bg.jpg"),
                        //       fit: BoxFit.fill
                        //   ),
                        // ),
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

                            Form(
                                key: _loginFormKey,
                                child: AnimatedBuilder(
                                    animation: offsetAnimation,
                                    builder: (context, child) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(horizontal: 24.0),
                                        padding: EdgeInsets.only(
                                            left: offsetAnimation.value + 30.0,
                                            right: 30.0 - offsetAnimation.value),
                                        child: Container(
                                          // margin: EdgeInsets.only(top: _height * 0.28),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              loginvalidation?Text("Invalid Email Or Password",
                                                style: TextStyle(color: Colors.red,fontSize: 18,fontFamily: 'RR',letterSpacing: 0.2),
                                              ):Container(height: 20,width: 0,),
                                              SizedBox(height: 10,),
                                              Text("User Email",style: TextStyle(fontFamily: 'RR',color: Colors.white,fontSize: 20),),
                                              SizedBox(height: 10,),
                                              Container(
                                                height: 60,
                                                width:SizeConfig.screenWidth! > 420? SizeConfig.screenWidth! * 0.4:SizeConfig.screenWidth!*0.8,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(13),
                                                    border:loginvalidation? Border.all(color: Colors.red,width: 2):Border.all(color: borderColor,width: 2),
                                                    color: loginvalidation?Color(0xFFCECECE):fillColor),
                                                child: TextFormField(
                                                  scrollPadding: EdgeInsets.only(bottom:SizeConfig.height250!),
                                                  style: TextStyle(color:loginvalidation?Colors.red:inputTextColor,fontSize:18,fontFamily: 'RR' ),
                                                  controller: username,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    hintText: "Email",
                                                    hintStyle: TextStyle(
                                                        color:loginvalidation?Colors.red: inputTextColor.withOpacity(0.7),fontSize: 18,fontFamily: 'RR'),
                                                    contentPadding: EdgeInsets.only(left: 20,top: 5),
                                                    //   fillColor: loginvalidation?HexColor("1C1F32"):Colors.white,

                                                  ),
                                                  keyboardType: TextInputType.emailAddress,
                                                  validator:(value){

                                                    Pattern pattern =
                                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                                    RegExp regex = new RegExp(pattern as String);
                                                    if (!regex.hasMatch(value!)) {
                                                      return 'Email format is invalid';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  onEditingComplete: (){
                                                    node.nextFocus();
                                                  },
                                                ),
                                              ),
                                              SizedBox(height: 20,),
                                              Text("Password",style: TextStyle(fontFamily: 'RR',color: Colors.white,fontSize: 20),),
                                              SizedBox(height: 10,),
                                              Container(
                                                height: 60,
                                                width: SizeConfig.screenWidth! > 420? SizeConfig.screenWidth! * 0.4:SizeConfig.screenWidth!*0.8,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(13),
                                                    border:loginvalidation? Border.all(color: Colors.red,width: 2):Border.all(color: borderColor,width: 2),
                                                    color:loginvalidation?Color(0xFFCECECE): fillColor),
                                                child: TextFormField(
                                                  scrollPadding: EdgeInsets.only(bottom:SizeConfig.height250!),
                                                  style: TextStyle(color:loginvalidation?Colors.red:inputTextColor,fontSize:18,fontFamily: 'RR' ),
                                                  controller: password,
                                                  obscureText: passwordvisible,
                                                  obscuringCharacter: '*',
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      enabledBorder: InputBorder.none,
                                                      focusedBorder: InputBorder.none,
                                                      hintText: "Password",
                                                      hintStyle:TextStyle(color:loginvalidation?Colors.red:inputTextColor.withOpacity(0.7),fontSize:18,fontFamily: 'RR' ),
                                                      contentPadding: EdgeInsets.only(left: 20, top: 19),
                                                      // suffixIconConstraints: BoxConstraints(
                                                      //     minHeight: 55,
                                                      //     maxWidth: 55
                                                      // ),
                                                      suffixIcon: Padding(
                                                        padding:  EdgeInsets.only(right: 20,top: 3),
                                                        child: IconButton(icon: Icon(passwordvisible?Icons.visibility_off:Icons.visibility,size: 30,color: Colors.grey,),
                                                            onPressed: (){
                                                              setState(() {
                                                                passwordvisible=!passwordvisible;
                                                              });
                                                            }),
                                                      )
                                                  ),
                                                  keyboardType: TextInputType.emailAddress,
                                                  validator:(value){
                                                    if(value!.isEmpty){
                                                      return 'Password is required';
                                                    }
                                                  },
                                                  onEditingComplete: () async {
                                                    node.unfocus();
                                                  },
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                width: SizeConfig.screenWidth! > 420? SizeConfig.screenWidth! * 0.4:SizeConfig.screenWidth!*0.8,
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap:(){
                                                        setState(() {
                                                          rememberMe=!rememberMe!;
                                                        });
                                                      },
                                                      child: Container(
                                                        color:Colors.transparent,
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 25,
                                                              width: 25,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  color: fillColor,
                                                                  border: Border.all(color: borderColor)
                                                              ),
                                                              alignment: Alignment.center,
                                                              child:AnimatedContainer(
                                                                duration: animeDuration,
                                                                curve: animeCurve,
                                                                height: 15,
                                                                width: 15,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    color: fillColor,
                                                                    border: Border.all(color:rememberMe!? Color(0XFF490091):fillColor,width: 3)
                                                                ),

                                                              ),
                                                            ),
                                                            SizedBox(width: 15,),
                                                            Text("Remember Me",style: TextStyle(fontFamily: 'RR',color: Colors.white,fontSize: 18,letterSpacing: 0.1,),),

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    GestureDetector(
                                                        onTap: (){
                                                          Navigator.push(context, pr.PageRoute().slideFromLeftToRight(ForgotPassword()));
                                                        },
                                                        child: Text("Forgot password?",style: TextStyle(fontFamily: 'RR',color: Colors.white,fontSize: 18,letterSpacing: 0.1,),)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 40,),
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context, pr.PageRoute().fade(CreateBusinessAccount()));
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
                                                  child: Text("Login",style: whiteRM20,),
                                                ),
                                              ),
                                              SizedBox(height: 20,),
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context, pr.PageRoute().slideFromLeftToRight(SignUp()));
                                                },
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text("Sign Up Your Account",style: TextStyle(fontFamily: 'RR',color: Colors.white,fontSize: 18,letterSpacing: 0.1,),)
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })),

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
}
