import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';

class VendorListAdd extends StatefulWidget {
  const VendorListAdd({Key? key}) : super(key: key);

  @override
  _VendorListAddState createState() => _VendorListAddState();
}

class _VendorListAddState extends State<VendorListAdd> {
  TextEditingController vendorName=new TextEditingController();
  TextEditingController vendorType=new TextEditingController();
  TextEditingController cmpyName=new TextEditingController();
  TextEditingController SCatg=new TextEditingController();
  TextEditingController items=new TextEditingController();
  TextEditingController status=new TextEditingController();
  TextEditingController gstNo=new TextEditingController();
  TextEditingController mail=new TextEditingController();
  TextEditingController mblNo=new TextEditingController();
  TextEditingController address=new TextEditingController();
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
              Text("Vendor List / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                    widget:CustomPopup(
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
                    title: "Category:",
                    validation: validationList[1],
                    textEditingController: SCatg,
                    onComplete: (){},
                    isTextField: false,
                    widget: CustomPopup(
                      hintText: "Select Category",
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
                    widget:  CustomPopup(
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
                    title: "Service Status",
                    validation: validationList[1],
                    textEditingController:items,
                    onComplete: (){},
                    isTextField: false,
                    widget:CustomSwitch(value: true, onchange: (v){

                    })
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
                      title: "Registered Date",
                      validation: validationList[1],
                      textEditingController: regdate,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight+10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Select Logo",
                    validation: validationList[2],
                    isTextField: false,
                    onComplete: (){
                      node.unfocus();
                    },
                    crossAxisAlignment: imageUploadCA,
                    showValidation: true,
                    widget:PickImage(image: image, title: "Select Logo",cb: (v){
                      setState(() {
                        image=v;
                      });
                    },),
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
