import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
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

class AttributeAdd extends StatefulWidget {
  const AttributeAdd({Key? key}) : super(key: key);

  @override
  _AttributeAddState createState() => _AttributeAddState();
}

class _AttributeAddState extends State<AttributeAdd> {
  TextEditingController name=new TextEditingController();
  TextEditingController slug=new TextEditingController();
  TextEditingController description=new TextEditingController();
  TextEditingController type=new TextEditingController();
  TextEditingController sortorders=new TextEditingController();



  String selectedCategory="";
  String selectedSortOrder="";
  String selectedCategoryType="";

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  bool showCategoryDropDown=false;
  bool showSortOrderDropDown=false;
  bool showCategoryTypeDropDown=false;


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
              Text("Attributes / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                      title: "Slug",
                      validation: validationList[1],
                      textEditingController: slug,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Type",
                    validation: validationList[1],
                    textEditingController: type,
                    onComplete: (){},
                    isTextField: false,
                    widget: OverLayPopUp(
                      ontap: (){
                        setState(() {
                          showCategoryDropDown=!showCategoryDropDown;
                        });
                      },
                      width: textFormWidth,
                      hinttext: "Select Type",
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
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Description",
                      validation: validationList[1],
                      textEditingController: description,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: textFormWidth,

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 20,),
                        TextFieldHeader(
                          title: "Active",
                          padd: paddTextFieldHeader2,
                        ),
                        Spacer(),
                        CustomSwitch(value: true, onchange: (v){

                        })
                      ],
                    ),
                  ),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Default Sort Order",
                    validation: validationList[1],
                    textEditingController: sortorders,
                    onComplete: (){},
                    isTextField: false,
                    widget: OverLayPopUp(
                      ontap: (){
                        setState(() {
                          showSortOrderDropDown=!showSortOrderDropDown;
                        });
                      },
                      width: textFormWidth,
                      hinttext: "Select Default Sort Order",
                      selectedValue: selectedSortOrder,
                      showPopUp: showSortOrderDropDown,
                      data: pn.categoryDropDownList,
                      onitemTap: (i){
                        setState(() {
                          showSortOrderDropDown=false;
                          selectedSortOrder=pn.categoryDropDownList[i];
                        });
                      },
                      isToJson: false,
                    ),
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

class FilterModel{
  TextEditingController title;
  List<dynamic> data;
  FilterModel({required this.title,required this.data});
}
