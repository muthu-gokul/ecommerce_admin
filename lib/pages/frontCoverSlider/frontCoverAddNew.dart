import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customAppBar.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';

class FrontCoverSliderAdd extends StatefulWidget {
  const FrontCoverSliderAdd({Key? key}) : super(key: key);

  @override
  _FrontCoverSliderAddState createState() => _FrontCoverSliderAddState();
}

class _FrontCoverSliderAddState extends State<FrontCoverSliderAdd> {
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

      body: Stack(
        children: [
          Consumer<ThemeNotifier>(
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
                        title: "Add New Front Cover",
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Slider Title",
                        validation: validationList[1],
                        textEditingController: Stitle,
                        onComplete: (){},
                        isTextField: false,
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showCategoryDropDown=!showCategoryDropDown;
                            });
                          },
                          width: textFormWidth,
                          hinttext: "Slider Title",
                          selectedValue: selectedCategory,
                          crossAxisAlignment: cA2,
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
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Category Type",
                        validation: validationList[1],
                        textEditingController: Ctype,
                        onComplete: (){},
                        isTextField: false,
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showCategoryTypeDropDown=!showCategoryTypeDropDown;
                            });
                          },
                          width: textFormWidth,
                          hinttext: "Select Category Type",
                          crossAxisAlignment: cA2,
                          selectedValue: selectedCategoryType,
                          showPopUp: showCategoryTypeDropDown,
                          data: pn.categoryDropDownList,
                          onitemTap: (i){
                            setState(() {
                              showCategoryTypeDropDown=false;
                              selectedCategoryType=pn.categoryDropDownList[i];
                            });
                          },
                          isToJson: false,
                        ),
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Sub Category Name:",
                        validation: validationList[1],
                        textEditingController: SCatg,
                        onComplete: (){},
                        isTextField: false,
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showSubCategoryDropDown=!showSubCategoryDropDown;
                            });
                          },
                          width: textFormWidth,
                          hinttext: "Select Sub Category",
                          crossAxisAlignment: cA2,
                          selectedValue: selectedSubCategory,
                          showPopUp: showSubCategoryDropDown,
                          data: pn.categoryDropDownList,
                          onitemTap: (i){
                            setState(() {
                              showSubCategoryDropDown=false;
                              selectedSubCategory=pn.categoryDropDownList[i];
                            });
                          },
                          isToJson: false,
                        ),
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Brand",
                        validation: validationList[1],
                        textEditingController: fBrand,
                        onComplete: (){},
                        isTextField: false,
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showBrandDropDown=!showBrandDropDown;
                            });
                          },
                          width: textFormWidth,
                          hinttext: "Select Brand",
                          crossAxisAlignment: cA2,
                          selectedValue: selectedBrand,
                          showPopUp: showBrandDropDown,
                          data: pn.categoryDropDownList,
                          onitemTap: (i){
                            setState(() {
                              showBrandDropDown=false;
                              selectedBrand=pn.categoryDropDownList[i];
                            });
                          },
                          isToJson: false,
                        ),
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Product",
                        validation: validationList[1],
                        textEditingController: fproduct,
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
                          crossAxisAlignment: cA2,
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
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Display",
                        validation: validationList[1],
                        textEditingController: fDisplay,
                        onComplete: (){},
                        isTextField: false,
                        widget: CustomSwitch(
                          value: true,
                          onchange: (v){

                          },
                        ),
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Sort Order",
                          validation: validationList[1],
                          textEditingController: sortOrder,
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      PickImage(image: image, title: "Select Slider",cb: (v){
                        setState(() {
                          image=v;
                        });
                      },),
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
          GestureDetector(
            onTap: (){
              setState(() {
                showCategoryDropDown=false;
                showCategoryTypeDropDown=false;
                showSubCategoryDropDown=false;
                showBrandDropDown=false;
                showProductDropDown=false;
              });
            },
            child: Container(
              height:showCategoryDropDown||showCategoryTypeDropDown||showSubCategoryDropDown||showBrandDropDown||showProductDropDown? SizeConfig.screenHeight:0,
              width: SizeConfig.screenWidth,
              color: Colors.transparent,
            ),
          ),
        ],
      )
    );
  }
}

class FilterModel{
  TextEditingController title;
  List<dynamic> data;
  FilterModel({required this.title,required this.data});
}
