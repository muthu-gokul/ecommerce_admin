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

class ProductShowCaseAddNew extends StatefulWidget {
  @override
  State<ProductShowCaseAddNew> createState() => _ProductShowCaseAddNewState();
}

class _ProductShowCaseAddNewState extends State<ProductShowCaseAddNew> {
  TextEditingController heading=new TextEditingController();
  TextEditingController dummyTextController=new TextEditingController();
  TextEditingController sortOrder=new TextEditingController();

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  String selectedBrand="";
  String selectedCategory="";
  String selectedSubCategory="";

  bool showBrandDropDown=false;
  bool showCategoryDropDown=false;
  bool showSubCategoryDropDown=false;


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
              Text("Product ShowCase / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                          title: "Heading",
                          validation: validationList[1],
                          textEditingController: heading,
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Select Category",
                        validation: validationList[2],
                        textEditingController: dummyTextController,
                        onComplete: (){},
                        isTextField: false,
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showCategoryDropDown=!showCategoryDropDown;
                            });
                          },
                          width: textFormWidth,
                          crossAxisAlignment: cA2,
                          hinttext: "Select Category",
                          selectedValue: selectedCategory,
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
                        title: "Select Sub Category",
                        validation: validationList[2],
                        textEditingController: dummyTextController,
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
                        title: "Select Brand",
                        validation: validationList[2],
                        textEditingController: dummyTextController,
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
                          data: pn.brandList,
                          onitemTap: (i){
                            setState(() {
                              showBrandDropDown=false;
                              selectedBrand=pn.brandList[i].title;
                            });
                          },
                          isToJson: true,
                          propertyName: "title",
                        ),
                      ),
                      SizedBox(height: inBetweenHeight,),

                      ProductTextField(
                        width: textFormWidth,
                        title: "Select Display Products",
                        validation: validationList[2],
                        textEditingController: dummyTextController,
                        onComplete: (){},
                        isTextField: false,
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showBrandDropDown=!showBrandDropDown;
                            });
                          },
                          width: textFormWidth,
                          hinttext: "Select Display Products",
                          crossAxisAlignment: cA2,
                          selectedValue: selectedBrand,
                          showPopUp: showBrandDropDown,
                          data: pn.brandList,
                          onitemTap: (i){
                            setState(() {
                              showBrandDropDown=false;
                              selectedBrand=pn.brandList[i].title;
                            });
                          },
                          isToJson: true,
                          propertyName: "title",
                        ),
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Display",
                        validation: validationList[2],
                        textEditingController: dummyTextController,
                        onComplete: (){},
                        isTextField: false,
                        widget: CustomSwitch(value: true, onchange: (v){

                        }),
                      ),

                      SizedBox(height: inBetweenHeight,),

                      ProductTextField(
                          width: textFormWidth,
                          title: "Sort Order",
                          validation: validationList[1],
                          textEditingController: sortOrder,
                          textInputType: TextInputType.number,
                          onComplete: (){
                            node.unfocus();
                          }
                      ),



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
              GestureDetector(
                onTap: (){
                  setState(() {
                    showBrandDropDown=false;
                    showCategoryDropDown=false;
                    showSubCategoryDropDown=false;
                  });
                },
                child: Container(
                  height:showBrandDropDown||showCategoryDropDown || showSubCategoryDropDown? SizeConfig.screenHeight:0,
                  width: SizeConfig.screenWidth,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

