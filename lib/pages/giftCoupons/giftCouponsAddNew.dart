import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';

class GiftCouponsAdd extends StatefulWidget {
  const GiftCouponsAdd({Key? key}) : super(key: key);

  @override
  _GiftCouponsAddState createState() => _GiftCouponsAddState();
}

class _GiftCouponsAddState extends State<GiftCouponsAdd> {
  TextEditingController Stitle=new TextEditingController();
  TextEditingController Ctype=new TextEditingController();
  TextEditingController sortOrder=new TextEditingController();
  TextEditingController SCatg=new TextEditingController();
  TextEditingController fBrand=new TextEditingController();
  TextEditingController fproduct=new TextEditingController();
  TextEditingController fDisplay=new TextEditingController();


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
              Text("Gift Coupons / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                    title: "Coupon Valid to",
                    validation: validationList[1],
                    textEditingController: Stitle,
                    onComplete: (){},
                    isTextField: false,
                    widget:CustomPopup(
                      hintText: "Select Coupon Valid to",
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
                    title: "Coupon Effect",
                    validation: validationList[1],
                    textEditingController: Ctype,
                    onComplete: (){},
                    isTextField: false,
                    widget:CustomPopup(
                      hintText: "Select Coupon Effect",
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
                      title: "Coupon offer",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Coupon Name",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Coupon Type:",
                    validation: validationList[1],
                    textEditingController: SCatg,
                    onComplete: (){},
                    isTextField: false,
                    widget:CustomPopup(
                      hintText: "Select Coupon Type",
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
                      title: "Coupon Code",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Redeem Amount Value",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Start Date",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "End Date",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Minimum Purchase  Amount",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Maximum Purchase  Amount",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Minimum Quantity",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Maximum Quantity",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Terms & Conditions",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Coupon Apply",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Login Level",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Custom Coupon Message",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight+10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Upload Coupon",
                    validation: validationList[2],
                    isTextField: false,
                    onComplete: (){
                      node.unfocus();
                    },
                    crossAxisAlignment: imageUploadCA,
                    showValidation: true,
                    widget:PickImage(image: image, title: "Upload Coupon",cb: (v){
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
