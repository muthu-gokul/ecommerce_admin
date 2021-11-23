import 'package:ecommerce_admin/forgot.dart';
import 'package:ecommerce_admin/login.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/bulkCouponGenerat/bulkCouponGenerate.dart';
import 'package:ecommerce_admin/pages/createBusinessAccount.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import 'package:scutiwidgets/size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'notifiers/productNotifier.dart';
import 'widgets/buttons/saveBtn.dart';
import 'widgets/customOverLayPopUp.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin{



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


  late var node;
  Color fillColor=Color(0xFFFFFFFF);
  Color borderColor=Color(0xFFFFFFFF);
  Color inputTextColor=Color(0xFF9b9b9b);


  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    shakecontroller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() => this._Loginprefs = prefs);

        _loadCredentials();
      });
    super.initState();
  }
  TextEditingController salutation =new TextEditingController();
  TextEditingController firstName=new TextEditingController();
  TextEditingController lastName=new TextEditingController();
  TextEditingController cmpyName=new TextEditingController();
  TextEditingController conbfirmPd=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController mobileNo=new TextEditingController();


  String selectedCategory="";

  XFile? image=null;

  List<bool> validationList= List<bool>.generate(3, (i) => false);

  bool showCategoryDropDown=false;

  List<FilterModel> filters=[];
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
          builder: (context,th,child)=> Consumer<ProductNotifier>(
            builder: (context,pn,child)=> Theme(
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
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizeConfig.screenWidth!<980?Container():Container(
                                  alignment: Alignment.center,
                                    child: Image.asset("assets/login/logo.jpg",height: 150,)),
                                SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ProductTextField2(
                                      width: 120,
                                      title: "Salutation",
                                      paddTextFieldHeader2: EdgeInsets.only(bottom: 10),
                                      titleColor: Colors.white,
                                      validation: validationList[1],
                                      textEditingController: salutation,
                                      onComplete: (){},
                                      isTextField: false,
                                      widget: OverLayPopUp(
                                        ontap: (){
                                          setState(() {
                                            showCategoryDropDown=!showCategoryDropDown;
                                          });
                                        },
                                        width: 120,
                                        hinttext: "Mr",

                                        selectedValue: selectedCategory,
                                        showPopUp: showCategoryDropDown,
                                        data: pn.categoryDropDownList,
                                        onitemTap: (i){
                                          setState(() {
                                            showCategoryDropDown=false;
                                            selectedCategory=pn.categoryDropDownList[i];
                                          });
                                        },
                                        isToJson: false,
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    ProductTextField2(
                                        width: textFormWidth-300,
                                        title: "First Name",
                                        titleColor: Colors.white,
                                        validation: validationList[1],
                                        textEditingController: firstName,
                                        onComplete: (){
                                          node.unfocus();
                                        }
                                    ),
                                    SizedBox(width: 5,),
                                    ProductTextField2(
                                        width: textFormWidth-300,
                                        title: "Last Name",
                                        titleColor: Colors.white,
                                        validation: validationList[1],

                                        onComplete: (){
                                          node.unfocus();
                                        }
                                    ),
                                    SizedBox(width: 15,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                ProductTextField2(
                                    width: textFormWidth+130,
                                    title: "Company Name",
                                    titleColor: Colors.white,
                                    validation: validationList[1],
                                    textEditingController: cmpyName,
                                    onComplete: (){
                                      node.unfocus();
                                    }
                                ),
                                SizedBox(height: 10,),
                                ProductTextField2(
                                    width: textFormWidth+130,
                                    title: "Confirm Password",
                                    titleColor: Colors.white,
                                    validation: validationList[1],
                                    textEditingController: conbfirmPd,
                                    onComplete: (){
                                      node.unfocus();
                                    }
                                ),
                                SizedBox(height: 10,),
                                ProductTextField2(
                                    width: textFormWidth+130,
                                    title: "Email",
                                    titleColor: Colors.white,
                                    validation: validationList[1],
                                    textEditingController: email,
                                    onComplete: (){
                                      node.unfocus();
                                    }
                                ),
                                SizedBox(height: 10,),
                                ProductTextField2(
                                    width: textFormWidth+130,
                                    title: "Mobile Number",
                                    titleColor: Colors.white,
                                    validation: validationList[1],
                                    textEditingController: mobileNo,
                                    onComplete: (){
                                      node.unfocus();
                                    }
                                ),
                                SizedBox(height: 20,),

                                Container(
                                  alignment:Alignment.center,
                                  child: SaveBtn(
                                    title: 'Send OTP',
                                    ontap: (){},
                                  ),
                                ),
                                SizedBox(height: 10,),
                                ProductTextField2(
                                    width: textFormWidth+130,
                                    title: "Enter OTP Number",
                                    titleColor: Colors.white,
                                    validation: validationList[1],
                                    textEditingController: mobileNo,
                                    onComplete: (){
                                      node.unfocus();
                                    }
                                ),
                                SizedBox(height: 20,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, pr.PageRoute().slideFromLeftToRight(Login()));
                                  },
                                  child: Container(
                                    alignment:Alignment.center,
                                    child: SaveBtn(
                                      title: 'Login',
                                      ontap: (){},
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50,),
                              ],
                            ),
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
      ),
    );
  }
}
