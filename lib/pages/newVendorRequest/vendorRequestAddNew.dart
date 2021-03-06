import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
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

class VendorRequestAdd extends StatefulWidget {
  const VendorRequestAdd({Key? key}) : super(key: key);

  @override
  _VendorRequestAddState createState() => _VendorRequestAddState();
}

class _VendorRequestAddState extends State<VendorRequestAdd> {
  TextEditingController vendorName=new TextEditingController();
  TextEditingController vendorType=new TextEditingController();
  TextEditingController cmpyName=new TextEditingController();
  TextEditingController gstNo=new TextEditingController();
  TextEditingController mail=new TextEditingController();
  TextEditingController mblNo=new TextEditingController();
  TextEditingController address=new TextEditingController();
  TextEditingController district=new TextEditingController();
  TextEditingController city=new TextEditingController();
  TextEditingController state=new TextEditingController();
  TextEditingController pincode=new TextEditingController();
  TextEditingController postOffice=new TextEditingController();
  TextEditingController wkHour=new TextEditingController();
  TextEditingController deliveryslot=new TextEditingController();
  TextEditingController spotdelivery=new TextEditingController();
  TextEditingController preparingDays=new TextEditingController();
  TextEditingController packingChrg=new TextEditingController();
  TextEditingController delvrymthd=new TextEditingController();
  TextEditingController delvrychrg=new TextEditingController();
  TextEditingController pickMthd=new TextEditingController();
  TextEditingController pickOffer=new TextEditingController();



  TextEditingController SCatg=new TextEditingController();
  TextEditingController items=new TextEditingController();
  TextEditingController status=new TextEditingController();
  TextEditingController regdate=new TextEditingController();



  String selectedCategory="";
  String selectedCategoryType="";
  String selectedSubCategory="";
  String selectedBrand="";
  String selectedProduct="";
  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  bool showCategoryDropDown=false;
  bool showCategoryTypeDropDown=false;
  bool showSubCategoryDropDown=false;
  bool showBrandDropDown=false;
  bool showProductDropDown=false;

  List<FilterModel> filters=[];


  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
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
                    title: "Add New Vendor List",
                  ),
                  SizedBox(height: inBetweenHeight,),
                  Container(
                      padding:  EdgeInsets.only(left: 10,bottom: 10),
                   //   alignment: Alignment.centerLeft,
                      child: Text("Basic Information",style: ts18(grey1,fontsize: 30),)
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Select Image",
                    validation: validationList[2],
                    isTextField: false,
                    onComplete: (){
                      node.unfocus();
                    },
                    crossAxisAlignment: imageUploadCA,
                    showValidation: true,
                    widget:PickImage(image: image, title: "Select Image",cb: (v){
                      setState(() {
                        image=v;
                      });
                    },),
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Vendor Name  ",
                      validation: validationList[1],
                      textEditingController: vendorName,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Vendor Type",
                    validation: validationList[1],
                    textEditingController: vendorType,
                    onComplete: (){},
                    isTextField: false,
                    widget:  CustomPopup(
                      hintText: "Select Vendor Type",
                      data: pn.categoryDropDownList,
                      selectedValue: selectedCategory,
                      width:textFormWidth ,
                      leftMargin: 0,
                      edgeInsets: EdgeInsets.only(left: 0),
                      onSelect: (v){
                        setState(() {
                          selectedCategory=v;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Company Name ",
                      validation: validationList[1],
                      textEditingController: cmpyName,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "GST No",
                      validation: validationList[1],
                      textEditingController: gstNo,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Email Id",
                      validation: validationList[1],
                      textEditingController: mail,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Mobile Number",
                      validation: validationList[1],
                      textEditingController: mblNo,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  Container(
                      padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                     // alignment: Alignment.centerLeft,
                      child: Text("Company Address",style: ts18(grey1,fontsize: 30),)
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Address",
                      validation: validationList[1],
                      textEditingController: address,
                      onComplete: (){
                        node.unfocus();
                      },maxlines: 3,
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "District",
                    validation: validationList[1],
                    textEditingController: district,
                    onComplete: (){
                      node.unfocus();
                    },
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "City",
                    validation: validationList[1],
                    textEditingController: city,
                    onComplete: (){
                      node.unfocus();
                    },
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "State",
                    validation: validationList[1],
                    textEditingController: state,
                    onComplete: (){
                      node.unfocus();
                    },
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Pincode",
                    validation: validationList[1],
                    textEditingController: pincode,
                    onComplete: (){
                      node.unfocus();
                    },
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Post Office",
                    validation: validationList[1],
                    textEditingController: postOffice,
                    onComplete: (){
                      node.unfocus();
                    }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  Container(
                      padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                    //  alignment: Alignment.centerLeft,
                      child: Text("Company Settings",style: ts18(grey1,fontsize: 30),)
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Company Category:",
                    validation: validationList[1],
                    textEditingController: SCatg,
                    onComplete: (){},
                    isTextField: false,
                    widget:  CustomPopup(
                      hintText: "Select Company Category",
                      data: pn.categoryDropDownList,
                      selectedValue: selectedCategory,
                      width:textFormWidth ,
                      leftMargin: 0,
                      edgeInsets: EdgeInsets.only(left: 0),
                      onSelect: (v){
                        setState(() {
                          selectedCategory=v;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Items",
                    validation: validationList[1],
                    textEditingController:items,
                    onComplete: (){},
                    isTextField: false,
                    widget: CustomPopup(
                      hintText: "Select Items",
                      data: pn.categoryDropDownList,
                      selectedValue: selectedCategory,
                      width:textFormWidth ,
                      leftMargin: 0,
                      edgeInsets: EdgeInsets.only(left: 0),
                      onSelect: (v){
                        setState(() {
                          selectedCategory=v;
                        });
                      },
                    ),
                  ),
                 SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Working Hours",
                      validation: validationList[1],
                      textEditingController: wkHour,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Delivery slot",
                      validation: validationList[1],
                      textEditingController: deliveryslot,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Spot Delivery slot",
                      validation: validationList[1],
                      textEditingController: spotdelivery,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Preparing Days",
                      validation: validationList[1],
                      textEditingController: preparingDays,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Packing Charge",
                      validation: validationList[1],
                      textEditingController: packingChrg,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  Container(
                      padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                   //   alignment: Alignment.centerLeft,
                      child: Text("Delivery Options",style: ts18(grey1,fontsize: 30),)
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Delivery Method",
                      validation: validationList[1],
                      isTextField: false,
                      onComplete: (){
                        node.unfocus();
                      },
                      widget: CustomSwitch(value: true, onchange: (v){

                      }),
                  ),

                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Delivery Charge",
                    validation: validationList[1],
                    isTextField: false,
                    onComplete: (){
                      node.unfocus();
                    },
                    widget: CustomSwitch(value: true, onchange: (v){

                    }),
                  ),

                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Pickup Method",
                    validation: validationList[1],
                    isTextField: false,
                    onComplete: (){
                      node.unfocus();
                    },
                    widget: CustomSwitch(value: true, onchange: (v){

                    }),
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Pickup Offer",
                    validation: validationList[1],
                    isTextField: false,
                    onComplete: (){
                      node.unfocus();
                    },
                    widget: CustomSwitch(value: true, onchange: (v){

                    }),
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
