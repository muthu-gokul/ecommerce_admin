import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandGrid.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/multiTags.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import 'productAddNew.dart';
class CategoryAddNew extends StatefulWidget {
  @override
  State<CategoryAddNew> createState() => _CategoryAddNewState();
}

class _CategoryAddNewState extends State<CategoryAddNew> {
  TextEditingController title=new TextEditingController();
  TextEditingController slug=new TextEditingController();
  String selectedCategory="";
  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  List<FilterModel> filters=[];

  addFilter(){
    setState(() {
      filters.add(
          FilterModel(title: TextEditingController(), data: [])
      );
    });
  }

  @override
  void initState() {
    addFilter();
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
              Text("Category / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Category Name",
                      validation: validationList[0],
                      textEditingController: title,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  validationList[0]?ValidationErrorText(title: validationText,):Container(),
                  SizedBox(height: 20,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Select Category",
                      validation: validationList[0],
                      isTextField: false,
                      onComplete: (){
                        node.unfocus();
                      },

                      widget:CustomPopup(
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
                  validationList[1]?ValidationErrorText(title: validationText,):Container(),
                  SizedBox(height: 30,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Add Filter",
                    validation: validationList[0],
                    isTextField: false,
                    onComplete: (){
                      node.unfocus();
                    },
                    crossAxisAlignment: CrossAxisAlignment.start,
                    widget:Expanded(
                      child: Column(
                        children: [
                          for(int i=0;i<filters.length;i++)
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 0,right: 0,bottom: 0),
                                  width: textFormWidth,
                                 // padding: EdgeInsets.only(top: 10,bottom: 10),
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                     // border: Border.all(color: addNewTextFieldBorder),
                                      color: addNewValuesBg
                                  ),
                                //  height: 200,
                                  child: Column(
                                 //   crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AddNewLabelTextField(
                                        margin: EdgeInsets.only(left: 0,top: 0),
                                        width: textFormWidth,
                                        labelText: "Enter Title",
                                        textEditingController: filters[i].title,
                                        onChange: (v){},
                                        onEditComplete: (){
                                          node.unfocus();
                                        },
                                      ),

                                      MultiTags(
                                        data: filters[i].data,
                                        hintText: "Enter Filter",
                                        width: textFormWidth,
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: textFormWidth,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          addFilter();
                                        },
                                        child: Text("Add more filter",style:  ts18(Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,fontfamily: 'RR'),),
                                      ),
                                      i==0?Container():Text("    or    ",style: ts16(Colors.grey),),
                                      i==0?Container():GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              filters.removeAt(i);
                                            });
                                          },
                                          child: Text("Delete",style: ts18(Colors.red),)
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    )
                  ),

                  SizedBox(height: 20,),

                  SizedBox(height: 20,),
                  PickImage(image: image, title: "Select Logo",cb: (v){
                    setState(() {
                      image=v;
                    });
                  },),
                  validationList[2]?ValidationErrorText(title: validationText,):Container(),
                  SizedBox(height: 50,),
                  Container(
                    width: textFormWidth+(40),
                    alignment: Alignment.center,
                    child: SaveBtn(ontap: (){
                      if(title.text.isEmpty){setState(() {validationList[0]=true;});}
                      else{setState(() {validationList[0]=false;});}

                      if(selectedCategory.isEmpty){setState(() {validationList[1]=true;});}
                      else{setState(() {validationList[1]=false;});}

                      if(image==null){setState(() {validationList[2]=true;});}
                      else{setState(() {validationList[2]=false;});}

                      int length=validationList.where((element) => element==false).toList().length;
                      if(length==validationList.length){
                        pn.addCategory(title.text, selectedCategory);

                        Navigator.pop(context);
                      }


                    }),
                  )
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
