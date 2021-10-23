import 'dart:io';

import 'package:ecommerce_admin/constants.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover_direction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/scutiwidgets.dart' as sw;
import 'package:scutiwidgets/size.dart';
import 'package:image_picker/image_picker.dart';

class CreateBusinessAccount extends StatefulWidget {
  const CreateBusinessAccount({Key? key}) : super(key: key);

  @override
  _CreateBusinessAccountState createState() => _CreateBusinessAccountState();
}

class _CreateBusinessAccountState extends State<CreateBusinessAccount> {

  TextEditingController businessName=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController phNo=new TextEditingController();
  TextEditingController gstNo=new TextEditingController();

  //validation
  List<bool> validationList= List<bool>.generate(7, (i) => false);
  bool emailValid=true;


  bool _keyboardVisible = false;
  Color headerClr=Color(0xFF505050);
  TextStyle headerTs=TextStyle(fontFamily: 'RR',fontSize: 18,color: Color(0xFF505050));

  List<String> advertiserTypeList=[
     "Agency (Managing ads for a brands)",
     "Brand (Managing my own ads)",
  ];
  int selectedAdType=-1;

  List<String> categoryList=["Restaurant","Automobile","Pet","Grocery","Mobile","Fashion"];
  String selectedCategory="";


  final ImagePicker _picker = ImagePicker();
    XFile? image=null;
  pickImg() async {
   final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
   setState(() {
     image=_image;
   });
  }


  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>Container(
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
                        image: AssetImage("assets/login/businessAccountBg.jpg"),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 0,
                child: Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth!*0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        Container(
                          height: 70,
                          child: Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: th.primaryColor1
                                ),
                                alignment: Alignment.center,
                                child: Text("BA",style: TextStyle(color: th.primaryColor3,fontSize: 28,fontFamily: 'RM'),),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Create a Business Account",style: TextStyle(fontFamily: 'RR',fontSize: 20,color: headerClr),),
                                  SizedBox(height: 5,),
                                  Container(
                                      width: SizeConfig.screenWidth!*0.5-110,
                                      child: Text("A Business Account is an uber account that allows you to manage your Ad accounts",style: TextStyle(fontFamily: 'RL',fontSize: 15,color: Color(0xFF939393)),)),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text("Business Details",style: TextStyle(fontFamily: 'RM',fontSize: 21,color: headerClr),),
                        SizedBox(height: 30,),
                        Padding(
                          padding:  paddTextFieldHeader,
                          child: Text("Enter Business Name",style: headerTs),
                        ),
                        AddNewLabelTextField(
                          margin: marginAddNewTextField,
                          textEditingController: businessName,
                          hintText: "Business Name",
                          ontap: (){

                          },
                          onChange: (v){

                          },
                          onEditComplete: (){
                            node.unfocus();
                          },
                        ),
                        validationList[0]?ValidationErrorText(title: validationText,):Container(),
                        SizedBox(height: 20,),
                        Padding(
                          padding:paddTextFieldHeader,
                          child: Text("Email Id",style: headerTs),
                        ),
                        AddNewLabelTextField(
                          margin: marginAddNewTextField,
                          textEditingController: email,
                          hintText: "Email Id",
                          scrollPadding: 500,
                          ontap: (){

                          },
                          onChange: (v){

                          },
                          onEditComplete: (){
                            node.unfocus();
                          },
                        ),
                        validationList[1]?ValidationErrorText(title: validationText,):Container(),
                        emailValid?Container():ValidationErrorText(title: "* Invalid email",),
                        SizedBox(height: 20,),
                        Padding(
                          padding:  paddTextFieldHeader,
                          child: Text("Mobile Number",style: headerTs),
                        ),
                        AddNewLabelTextField(
                          margin: marginAddNewTextField,
                          textEditingController: phNo,
                          hintText: "Mobile Number",
                          scrollPadding: 500,
                          ontap: (){

                          },
                          onChange: (v){

                          },
                          onEditComplete: (){
                            node.unfocus();
                          },
                          textInputType: TextInputType.number,
                          textLength: phoneNoLength,
                          regExp: digitRegEx,
                        ),
                        validationList[2]?ValidationErrorText(title: validationText,):Container(),
                        SizedBox(height: 20,),
                        Padding(
                          padding:  paddTextFieldHeader,
                          child: Text("GST No",style: headerTs),
                        ),
                        AddNewLabelTextField(
                          margin: marginAddNewTextField,
                          textEditingController: gstNo,
                          hintText: "GST No",
                          scrollPadding: 500,
                          ontap: (){

                          },
                          onChange: (v){

                          },
                          onEditComplete: (){
                            node.unfocus();
                          },
                        ),
                        validationList[3]?ValidationErrorText(title: validationText,):Container(),
                        SizedBox(height: 20,),
                        Padding(
                          padding: paddTextFieldHeader,
                          child: Text("Advertiser Type",style: headerTs),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: advertiserTypeList.length*50.0,
                          child: Theme(
                            data: glowTransparent(context),
                            child: ListView.builder(
                              itemCount: advertiserTypeList.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (ctx,i){
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      selectedAdType=i;
                                    });

                                  },
                                  child: Container(
                                    height: 50,
                                    alignment: Alignment.centerLeft,
                                    padding:  EdgeInsets.only(left: SizeConfig.width20!),
                                    color: Colors.transparent,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        AnimatedContainer(
                                          duration: animeDuration,
                                          curve: animeCurve,
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            color: selectedAdType==i?th.loginBtn:Color(0xFFBABABA),
                                            shape: BoxShape.circle,
                                            border: Border.all(color: selectedAdType==i?th.primaryColor2:Color(0xFFDADADA),width: 7)
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text("${advertiserTypeList[i]}",
                                          style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 18,fontFamily: 'RL'),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        validationList[4]?ValidationErrorText(title: validationText,):Container(),
                        SizedBox(height: 15,),
                        Padding(
                          padding:  paddTextFieldHeader,
                          child: Text("Category",style: headerTs),
                        ),
                        SizedBox(height: 15,),
                        Builder(
                          builder: (BuildContext ctx1) =>
                              GestureDetector(
                                onTap: (){
                                  showPopover(
                                    barrierColor: Colors.transparent,
                                    context: ctx1,
                                    transitionDuration: const Duration(milliseconds: 150),
                                    bodyBuilder: (context) => ListView.builder(
                                      itemCount: categoryList.length,
                                      itemBuilder: (ctx,index){
                                        return   InkWell(
                                          onTap: () {
                                            Navigator.pop(ctx1);
                                            setState(() {
                                              selectedCategory=categoryList[index];
                                            });

                                            //  onSelect!(data![index]);


                                          },
                                          child: Container(
                                            height: 50,
                                            width:200,
                                            padding: EdgeInsets.only(left: 20,),
                                          //  margin: EdgeInsets.only(bottom: 3),
                                            alignment: Alignment.centerLeft,
                                            // color:selectedValue==data![index]?AppTheme.red: Color(0xFFf6f6f6),
                                            decoration: BoxDecoration(
                                              //borderRadius: BorderRadius.circular(8),
                                              color: Colors.white,
                                            ),
                                            child:  Text("${categoryList[index]}",
                                              style: TextStyle(fontFamily: 'RR',fontSize: 16,color: headerClr
                                                // color:selectedValue==data![index]?Colors.white: Color(0xFF555555),letterSpacing: 0.1
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    onPop: () => print('Popover was popped!'),
                                    direction: PopoverDirection.bottom,
                                    width: 245,
                                    height: categoryList.length*50.0,
                                    arrowHeight: 0,
                                    arrowWidth: 0,
                                    //  backgroundColor: Color(0xFFf6f6f6),
                                    backgroundColor: Colors.transparent,
                                    contentDyOffset: 5,
                                    //isAttachRight: false,
                                    shadow:[
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          blurRadius: 20,
                                          spreadRadius: 2,
                                          offset: Offset(0,0)
                                      )
                                    ],
                                    margin: 0,
                                    isCustom: true,
                                    leftMargin: 40,
                                    constraints: BoxConstraints(
                                        maxHeight: 180
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  margin: paddTextFieldHeader,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: addNewTextFieldBorder),
                                    color: Colors.transparent,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: [
                                      Text(selectedCategory.isEmpty?"Select Category":selectedCategory,
                                        style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 16,fontFamily: selectedCategory.isEmpty?'RL':'RR'),
                                      ),
                                      Spacer(),
                                      Icon(Icons.arrow_drop_down,size: 25,)
                                    ],
                                  ),
                                ),
                              ),
                        ),
                        validationList[5]?ValidationErrorText(title: validationText,):Container(),
                        SizedBox(height: 20,),
                        Padding(
                          padding:  paddTextFieldHeader,
                          child: Text("Company Brand Logo",style: headerTs),
                        ),
                        GestureDetector(
                          onTap: (){
                            pickImg();
                          },
                          child: Container(
                            height: 150,
                            margin: marginAddNewTextField,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: addNewTextFieldBorder),
                              color: Colors.transparent,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: (SizeConfig.screenWidth!-SizeConfig.width100!)*0.31,
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    height: 130,
                                    width: (SizeConfig.screenWidth!-SizeConfig.width100!)*0.25,
                                    child: image==null?Container():Image.file(File(image!.path)),
                                   // color: Colors.red,
                                  ),
                                ),
                                Icon(Icons.upload_file,color: th.primaryColor3,),
                                Text("  Select Logo",style: TextStyle(color: th.primaryColor3,fontFamily: 'RR',fontSize: 18),)
                              ],
                            ),
                          ),
                        ),
                        validationList[6]?ValidationErrorText(title: validationText,):Container(),
                        SizedBox(height: 40,),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: (){
                              if(businessName.text.isEmpty){setState(() {validationList[0]=true;});}
                              else{setState(() {validationList[0]=false;});}

                              if(email.text.isEmpty){setState(() {validationList[1]=true;});}
                              else{setState(() {validationList[1]=false;});}

                              if(phNo.text.isEmpty){setState(() {validationList[2]=true;});}
                              else{setState(() {validationList[2]=false;});}

                              if(gstNo.text.isEmpty){setState(() {validationList[3]=true;});}
                              else{setState(() {validationList[3]=false;});}

                              if(email.text.isNotEmpty){
                                setState(() {
                                  emailValid=sw.EmailValidation().validateEmail(email.text);
                                });
                              }

                              if(selectedAdType==-1){setState(() {validationList[4]=true;});}
                              else{setState(() {validationList[4]=false;});}

                              if(selectedCategory.isEmpty){setState(() {validationList[5]=true;});}
                              else{setState(() {validationList[5]=false;});}

                              if(image==null){setState(() {validationList[6]=true;});}
                              else{setState(() {validationList[6]=false;});}


                              int length=validationList.where((element) => element==false).toList().length;
                              if(length==validationList.length && emailValid){
                                Navigator.push(context, pr.PageRoute().fade(HomePage()));
                              }
                              else{
                                Navigator.push(context, pr.PageRoute().fade(HomePage()));
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                color: th.loginBtn,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              alignment: Alignment.center,
                              child: Text("Save",style: whiteRM20,),
                            ),
                          ),
                        ),

                        SizedBox(height: _keyboardVisible?400:50,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}


