import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';

class EmailSettingAdd extends StatefulWidget {
  const EmailSettingAdd({Key? key}) : super(key: key);

  @override
  _EmailSettingAddState createState() => _EmailSettingAddState();
}

class _EmailSettingAddState extends State<EmailSettingAdd> {
  TextEditingController smptHost=new TextEditingController();
  TextEditingController smptPost=new TextEditingController();
  TextEditingController smptUser=new TextEditingController();
  TextEditingController smptpd=new TextEditingController();
  TextEditingController fullName=new TextEditingController();
  TextEditingController fromEmail=new TextEditingController();
  TextEditingController active=new TextEditingController();



  List<bool> validationList= List<bool>.generate(3, (i) => false);

  List<FilterModel> filters=[];


  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,
        elevation: 0,
        leadingWidth: 100,
        leading: BackBtn(ontap: (){
          Navigator.pop(context);
        }),
        title: Container(
          height: 50,
          //  color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,
          child: Row(
            children: [
              Text("Email Settings / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
            ],
          ),
        ),
      ),
      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: cA1,
                children: [
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "SMTP Host",
                      validation: validationList[1],
                      textEditingController: smptHost,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "SMTP Post",
                      validation: validationList[1],
                      textEditingController: smptPost,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "SMTP Username",
                      validation: validationList[1],
                      textEditingController: smptUser,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "SMTP Password",
                      validation: validationList[1],
                      textEditingController: smptpd,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Full Name",
                      validation: validationList[1],
                      textEditingController: fullName,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "From Email",
                      validation: validationList[1],
                      textEditingController: fromEmail,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Active",
                    validation: validationList[1],
                    textEditingController: active,
                    onComplete: (){},
                    isTextField: false,
                    widget: CustomSwitch(
                      value: true,
                      onchange: (v){

                      },
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    alignment:Alignment.center,
                    child: SaveBtn(
                      ontap: (){},
                    ),
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FilterModel{
  TextEditingController title;
  List<dynamic> data;
  FilterModel({required this.title,required this.data});
}
