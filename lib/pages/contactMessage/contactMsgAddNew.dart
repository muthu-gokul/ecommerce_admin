import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandGrid.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/multiTags.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

class ContactMsgAddNew extends StatefulWidget {
  @override
  State<ContactMsgAddNew> createState() => _ContactMsgAddNewState();
}

class _ContactMsgAddNewState extends State<ContactMsgAddNew> {
  TextEditingController key=new TextEditingController();
  TextEditingController dummyTextController=new TextEditingController();
  TextEditingController secret=new TextEditingController();
  TextEditingController Stitle=new TextEditingController();

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  String selectedCategory="";
  bool showCategoryDropDown=false;


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
              Text("Contact Message / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
            ],
          ),
        ),
      ),
      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: cA1,
                    children: [
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Name",
                        validation: validationList[1],

                        onComplete: (){
                          node.unfocus();
                        },
                        regExp: digitRegEx,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Email Id",
                        validation: validationList[1],

                        onComplete: (){
                          node.unfocus();
                        },
                        regExp: digitRegEx,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Mobile no",
                        validation: validationList[1],

                        onComplete: (){
                          node.unfocus();
                        },
                        regExp: digitRegEx,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Subject",
                        validation: validationList[1],

                        onComplete: (){
                          node.unfocus();
                        },
                        regExp: digitRegEx,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Message",
                        validation: validationList[1],

                        onComplete: (){
                          node.unfocus();
                        },
                        regExp: digitRegEx,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: inBetweenHeight,),

                      SizedBox(height: 50,),
                      Container(
                        width: textFormWidth+(40),
                        alignment: Alignment.center,
                        child: SaveBtn(ontap: (){



                        }),
                      ),

                      SizedBox(height: 100,),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

