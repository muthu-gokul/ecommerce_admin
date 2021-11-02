import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({Key? key}) : super(key: key);

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  TextEditingController cmpyAdrs=new TextEditingController();
  TextEditingController officalAdrs=new TextEditingController();
  TextEditingController name=new TextEditingController();
  TextEditingController queris=new TextEditingController();
  TextEditingController mail=new TextEditingController();
  TextEditingController mblNo=new TextEditingController();




  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  List<FilterModel> filters=[];


  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    SizeConfig().init(context);
    return Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Container(
            height: SizeConfig.screenHeight!-50,
            width: SizeConfig.screenWidth!-100,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth+20,
                      title: "Company Address",
                      validation: validationList[1],
                      textEditingController: cmpyAdrs,
                      onComplete: (){
                        node.unfocus();
                      },maxlines: 3,
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth+20,
                    title: "Offical Address",
                    validation: validationList[1],
                    textEditingController: officalAdrs,
                    onComplete: (){
                      node.unfocus();
                    },maxlines: 3,
                  ),
                  SizedBox(height: 10,),
                  Container(
                      padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text("Leave Message:",style: ts18(grey1,fontsize: 30),)
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Name",
                      validation: validationList[1],
                      textEditingController: name,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Email Id",
                      validation: validationList[1],
                      textEditingController: mail,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Mobile Number",
                      validation: validationList[1],
                      textEditingController: mblNo,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth+20,
                      title: "Queries",
                      validation: validationList[1],
                      textEditingController: queris,
                      onComplete: (){
                        node.unfocus();
                      },maxlines: 3,
                  ),
                  SizedBox(height: 10,),
                  Container(
                    alignment:Alignment.center,
                    child: SaveBtn(title:'Send',
                      ontap: (){},
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
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
