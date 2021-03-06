import 'dart:async';

import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/addMoreTextFieldAnimation.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customAppBar.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';

class InstallationChargesAdd extends StatefulWidget {
  const InstallationChargesAdd({Key? key}) : super(key: key);

  @override
  _InstallationChargesAddState createState() => _InstallationChargesAddState();
}

class _InstallationChargesAddState extends State<InstallationChargesAdd> {
  TextEditingController name=new TextEditingController();
  TextEditingController idno=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController phno=new TextEditingController();
  TextEditingController role=new TextEditingController();

  String selectedProduct="";

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  bool showProductDropDown=false;



  //final GlobalKey<AnimatedListState> coveredKey = GlobalKey<AnimatedListState>();
  List<dynamic> covered=[];
  List<dynamic> notCovered=[];

  addCovered(){
    setState(() {
      covered.add(TextEditingController());
    });
  }

  addNotCovered(){
    setState(() {
      notCovered.add(TextEditingController());
    });
  }
  deleteNotCovered(int i){
    setState(() {
      notCovered.removeAt(i);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      addCovered();
      addNotCovered();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    SizeConfig().init(context);
    return Scaffold(

      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            color:th.addNewBodyColor,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: cA1,
                children: [
                  CustomAppBarAddNew(
                    title: "Add New Installation Charges",
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Product",
                    validation: validationList[1],
                    textEditingController: role,
                    onComplete: (){},
                    isTextField: false,
                    widget:CustomPopup(
                      hintText: "Select Product",
                      data: pn.categoryDropDownList,
                      selectedValue: selectedProduct,
                      width:textFormWidth ,
                      leftMargin: 0,
                      edgeInsets: EdgeInsets.only(left: 0),
                      onSelect: (v){
                        setState(() {
                          selectedProduct=v;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "No of days",
                      validation: validationList[1],
                      textEditingController: name,
                      textInputType: TextInputType.number,
                      regExp: digitRegEx,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Amount",
                      validation: validationList[1],
                      textEditingController: idno,
                      textInputType: TextInputType.number,
                      regExp: decimalReg,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Description",
                      validation: validationList[1],
                      textEditingController: email,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10+10,),
                  ProductTextField(
                      width: textFormWidth+140,
                      title: "Covered Under Installation",
                      leftPadding: 155,
                      validation: validationList[0],
                      paddTextFieldHeader2: EdgeInsets.only(top: 10),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //textEditingController: dummyTextController,
                      onComplete: (){
                        node.unfocus();
                      },
                      isTextField: false,
                      widget: AddMoreTextFieldAnimation(
                          data: covered,
                          wid: 530,
                          hintText: "Covered Under Installation",
                          addCB: addCovered,
                          deleteCB: (i){
                            setState(() {
                              covered.removeAt(i);
                            });
                          }
                      )
                  ),

                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth+140,
                    title: "Not Covered Under Installation",
                      leftPadding: 155,
                      validation: validationList[0],
                      paddTextFieldHeader2: EdgeInsets.only(top: 10),
                      crossAxisAlignment: CrossAxisAlignment.start,
                    onComplete: (){
                      node.unfocus();
                    },
                    isTextField: false,
                    widget: AddMoreTextFieldAnimation(
                        data: notCovered,
                        wid: 530,
                        hintText: "Not Covered Under Installation",
                        addCB: addNotCovered,
                        deleteCB: (i){
                          deleteNotCovered(i);
                        }
                    )
                  ),
                  SizedBox(height: 50,),
                  Container(
                    alignment:Alignment.center,
                    child: SaveBtn(
                      ontap: (){},
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



}




