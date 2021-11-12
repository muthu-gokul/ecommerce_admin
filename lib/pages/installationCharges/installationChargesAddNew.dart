import 'dart:async';

import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/addMoreTextFieldAnimation.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
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
              Text("Installation Charges / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Product",
                    validation: validationList[1],
                    textEditingController: role,
                    onComplete: (){},
                    isTextField: false,
                    widget: OverLayPopUp(
                      ontap: (){
                        setState(() {
                          showProductDropDown=!showProductDropDown;
                        });
                      },
                      width: textFormWidth,
                      hinttext: "Select Product",
                      selectedValue: selectedProduct,
                      showPopUp: showProductDropDown,
                      data: pn.categoryDropDownList,
                      onitemTap: (i){
                        setState(() {
                          showProductDropDown=false;
                          selectedProduct=pn.categoryDropDownList[i];
                        });
                      },
                      isToJson: false,
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
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: SizeConfig.screenWidth!*0.5+170,
                      title: "Covered Under Installation",
                      validation: validationList[0],
                      //textEditingController: dummyTextController,
                      onComplete: (){
                        node.unfocus();
                      },
                      isTextField: false,
                      widget: AddMoreTextFieldAnimation(
                          data: covered,
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
                    width: SizeConfig.screenWidth!*0.5+170,
                    title: "Not Covered Under Installation",
                    validation: validationList[0],
                    //textEditingController: dummyTextController,
                    onComplete: (){
                      node.unfocus();
                    },
                    isTextField: false,
                    widget: AddMoreTextFieldAnimation(
                        data: notCovered,
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




