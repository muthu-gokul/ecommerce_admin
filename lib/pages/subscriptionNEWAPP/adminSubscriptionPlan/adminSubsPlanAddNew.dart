import 'package:ecommerce_admin/constants.dart';
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



class AdminSubsPlanAdd extends StatefulWidget {
  const AdminSubsPlanAdd({Key? key}) : super(key: key);

  @override
  _AdminSubsPlanAddState createState() => _AdminSubsPlanAddState();
}

class _AdminSubsPlanAddState extends State<AdminSubsPlanAdd> {
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
              Text("Admin Subscription Plan / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Consumer<ThemeNotifier>(
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
                        title: "Code",
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
                          hinttext: "Code",
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
                        title: "Name",
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
                          hinttext: "Select Name",
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
                        title: "Plan Type:",
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
                          hinttext: "Select Plan",
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
                          title: "Description",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Trial Days",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          },maxlines: 3,
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Monthly Amount",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Yearly Amount",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
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
