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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  TextFieldHeader(
                    title: "Category Name",

                  ),
                  AddNewLabelTextField(
                    width: textFormWidth,
                    margin: marginAddNewTextField,
                    textEditingController: title,
                    hintText: "Category Title",
                    ontap: (){

                    },
                    onChange: (v){

                    },
                    onEditComplete: (){
                      node.unfocus();
                      setState(() {
                        slug.text=title.text.replaceAll(" ", "-").replaceAll(",", "");
                      });
                    },
                  ),
                  validationList[0]?ValidationErrorText(title: validationText,):Container(),
                  SizedBox(height: 20,),
                  TextFieldHeader(
                    title: "Category",
                  ),
                  SizedBox(height: 10,),
                  CustomPopup(
                      hintText: "Select Category",
                      data: pn.categoryDropDownList,
                      selectedValue: selectedCategory,
                      width:textFormWidth ,
                      onSelect: (v){
                        setState(() {
                          selectedCategory=v;
                        });
                      },
                  ),
                  validationList[1]?ValidationErrorText(title: validationText,):Container(),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        filters.add(
                          FilterModel(title: TextEditingController(), data: [])
                        );
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: addNewTextFieldBorder),
                          color: Colors.white
                      ),
                      alignment: Alignment.center,
                      child: Text("Add Values",style: textFormTs1,),
                    ),
                  ),
                  SizedBox(height: 20,),
                  for(int i=0;i<filters.length;i++)
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: addNewTextFieldBorder),
                      color: Colors.white
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddNewLabelTextField(
                            margin: EdgeInsets.only(left: 20,top: 10),
                            width: 200,
                            hintText: "Enter Title",
                            textEditingController: filters[i].title,
                            onChange: (v){},
                            onEditComplete: (){
                              node.unfocus();
                            },
                        ),
                        Spacer(),
                        MultiTags(
                            data: filters[i].data,
                          hintText: "Enter value",
                          width: SizeConfig.screenWidth!-350,
                        ),
                        AddBtn(ontap: (){
                          setState(() {
                            filters.removeAt(i);
                          });

                        },
                          color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
                          margin: EdgeInsets.only(right: 10,top: 10),
                          widget: Icon(Icons.clear,color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
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
