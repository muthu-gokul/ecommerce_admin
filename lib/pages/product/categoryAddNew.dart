import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandGrid.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/circle.dart';
import 'package:ecommerce_admin/widgets/customAppBar.dart';
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
  String selectedNullImage="";
  List<bool> validationList= List<bool>.generate(3, (i) => false);
  List<int> iconList= List<int>.generate(10,(i)=>i+1);

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

  bool iconOpen=false;


  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    SizeConfig().init(context);
    return Scaffold(

      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                color: th.addNewBodyColor,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: cA1,
                    children: [
                          CustomAppBarAddNew(
                            title: "Add New Category",
                          ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Category Name",
                          validation: validationList[0],
                          textEditingController: title,
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      //  validationList[0]?ValidationErrorText(title: validationText,):Container(),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Select Category",
                        validation: validationList[1],
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
                      //validationList[1]?ValidationErrorText(title: validationText,):Container(),
                      SizedBox(height: 30,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Add Filter",
                          validation: validationList[0],
                          isTextField: false,
                          onComplete: (){
                            node.unfocus();
                          },
                          crossAxisAlignment: cA2,
                          showValidation: false,
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

                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Category Icon",
                        validation: validationList[2],
                        isTextField: false,
                        onComplete: (){
                          node.unfocus();
                        },
                        crossAxisAlignment: imageUploadCA,
                        showValidation: true,
                        widget:GestureDetector(
                          onTap: (){
                            setState(() {
                              iconOpen=!iconOpen;
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: PickImage(
                              image: image,
                              isPick: false,
                              title: "Select Logo",
                              nullImage: selectedNullImage.isEmpty?"assets/images/addnew-brand.jpg":selectedNullImage,
                              cb: (v){
                              setState(() {
                                image=v;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: inBetweenHeight,),
                      SizedBox(height: 50,),
                      Container(
                        width: textFormWidth+(40),
                        alignment: Alignment.center,
                        child: SaveBtn(ontap: (){
                          if(title.text.isEmpty){setState(() {validationList[0]=true;});}
                          else{setState(() {validationList[0]=false;});}

                          if(selectedCategory.isEmpty){setState(() {validationList[1]=true;});}
                          else{setState(() {validationList[1]=false;});}

                          if(selectedNullImage.isEmpty){setState(() {validationList[2]=true;});}
                          else{setState(() {validationList[2]=false;});}

                          int length=validationList.where((element) => element==false).toList().length;
                          if(length==validationList.length){
                            pn.addCategory(title.text, selectedCategory);

                            Navigator.pop(context);
                          }


                        }),
                      ),
                      SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
              Container(
                height: iconOpen?SizeConfig.screenHeight:0,
                width: SizeConfig.screenWidth,
                color: Colors.black54,
              ),
              AnimatedContainer(
                duration: animeDuration,
                curve: animeCurve,
                height: SizeConfig.screenHeight,
                width: 400,
                transform: Matrix4.translationValues(iconOpen?SizeConfig.screenWidth!-400:SizeConfig.screenWidth!, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(7),bottomLeft: Radius.circular(7),),
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Row(
                        children: [
                          Text("Choose Category Icon",style: ts18(grey1,fontsize: 22),),
                          Spacer(),
                          AddBtn(
                              ontap: (){
                                setState(() {
                                  iconOpen=false;
                                });
                              },
                              color: Colors.red,
                              margin: paddTextFieldHeader2,
                              widget: Icon(Icons.clear,color: Colors.white,),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: SizeConfig.screenHeight!-160,
                      child: SingleChildScrollView(
                        child: Wrap(
                          runSpacing: 20,
                          spacing: 15,
                          children: iconList.asMap().map((key, value) => MapEntry(
                                  key, GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          selectedNullImage="assets/images/image.png";
                                          iconOpen=false;
                                        });
                                      },
                                      child: Circle(
                                          hei: 80,
                                          color: bgColor,

                                          widget: Center(
                                              child: Image.asset("assets/images/image.png",height: 40,)
                                          ),
                                      )
                              )
                            )
                          ).values.toList(),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: th.primaryColor4,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 7),
                            color: th.primaryColor4.withOpacity(0.5),
                            blurRadius: 15
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("More icon",style: ts16(Colors.white),),
                          SizedBox(width: 10,),
                          Icon(Icons.call,color: Colors.white,size: 20,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
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
