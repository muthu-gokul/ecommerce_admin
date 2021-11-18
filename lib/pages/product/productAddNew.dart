import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandGrid.dart';
import 'package:ecommerce_admin/widgets/addMoreTextFieldAnimation.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customAppBar.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/multiTags.dart';
import 'package:ecommerce_admin/widgets/overlayContainer.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover_direction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:scutiwidgets/size.dart';
class ProductAddNew extends StatefulWidget {
  @override
  State<ProductAddNew> createState() => _ProductAddNewState();
}

class _ProductAddNewState extends State<ProductAddNew> {

  late double width1;

  TextEditingController pName=new TextEditingController();//pName=productName
  TextEditingController pslug=new TextEditingController();
  TextEditingController dummyTextController=new TextEditingController();
  String selectedBrand="";
  String selectedCategory="";
  String selectedSubCategory="";

  TextEditingController pStock=new TextEditingController();
  TextEditingController pAlertStock=new TextEditingController();
  TextEditingController pActualPrice=new TextEditingController();
  TextEditingController pOfferPrice=new TextEditingController();
  TextEditingController pShippingPrice=new TextEditingController();
  TextEditingController pPincode=new TextEditingController();
  TextEditingController pCashBack=new TextEditingController();

  String selectedUnit="";
  TextEditingController pWebsiteUrl=new TextEditingController();
  TextEditingController pYouTubeUrl=new TextEditingController();



  TextEditingController pDescription=new TextEditingController();
  List<String> tagsList=[];
  List<String> seoKeyWordsList=[];
  List<String> seoTitlesList=[];

  //Add Values
  int selectedHeading=-1;
  bool isAddValueClick=false;
  List<SubAddValues> tempSubAddValues=[];
  List<AddValues> tempAddValues=[];


  bool isProductAvailable=false;
  bool hideProduct=false;
  int priceApi=1;

  List<dynamic> highLightsList=[];

  String selectedImage="";
  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);


  bool showBrandDropDown=false;
  bool showCategoryDropDown=false;
  bool showSubCategoryDropDown=false;
  bool showUnitDropDown=false;

  void addTempSubValues(int i){
      setState(() {
        tempAddValues[i].subAddValuesList.add(
          SubAddValues(
              heading: TextEditingController(),
              title: TextEditingController(),
              value: TextEditingController()
          )
        );
      });
  }
  void addTempValues(){
    setState(() {
      tempAddValues.add(
          AddValues(
              title: TextEditingController(),
              selectedHeading: -1,
              subAddValuesList: []
          )
      );
    });
  }

  addHighlights(){
    setState(() {
      highLightsList.add(TextEditingController());
    });
  }

  @override
  void initState() {
   addHighlights();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final node=FocusScope.of(context);
    width1=SizeConfig.screenWidth!-40;
    return Scaffold(

      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                color: th.addNewBodyColor,
                padding: EdgeInsets.only(top: 0,left: 0,bottom: 10),
                child: Column(
                  children: [
                    CustomAppBarAddNew(
                      title: "Add New Product",
                    ),
                    Theme(
                      data: glowTransparent(context),
                      child: Container(
                        height: SizeConfig.screenHeight!-80,
                        width: SizeConfig.screenWidth,
                        child: SingleChildScrollView(
                          child: Wrap(
                            runSpacing: 20,
                            spacing: 0,
                            children: [
                             // SizedBox(height: 20,),
                              ProductTextField(
                                  width: textFormWidth,
                                  title: "Product Name",
                                  validation: validationList[0],
                                  textEditingController: pName,
                                  onComplete: (){
                                    node.unfocus();
                                    setState(() {
                                      pslug.text=pName.text.replaceAll(" ", "-").replaceAll(",", "");
                                    });
                                  }
                              ),
                              ProductTextField(
                                  width: textFormWidth,
                                  title: "URL Slug",
                                  validation: validationList[1],
                                  textEditingController: pslug,
                                  onComplete: (){
                                    node.unfocus();
                                  }
                              ),
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

                              ProductTextField(
                                  width: textFormWidth,
                                  title: "Product Stock",
                                  validation: validationList[0],
                                  textEditingController: pStock,
                                  textInputType: TextInputType.number,
                                  onComplete: (){
                                    node.unfocus();
                                  }
                              ),
                              ProductTextField(
                                  width: textFormWidth,
                                  title: "Alert Stock",
                                  validation: validationList[0],
                                  textEditingController: pAlertStock,
                                  textInputType: TextInputType.number,
                                  onComplete: (){
                                    node.unfocus();
                                  }
                              ),
                              ProductTextField(
                                  width: textFormWidth,
                                  title: "Actual Price",
                                  validation: validationList[0],
                                  textEditingController: pActualPrice,
                                  textInputType: TextInputType.number,
                                  onComplete: (){
                                    node.unfocus();
                                  }
                              ),
                              ProductTextField(
                                  width: textFormWidth,
                                  title: "Offer Price",
                                  validation: validationList[0],
                                  textEditingController: pOfferPrice,
                                  textInputType: TextInputType.number,
                                  onComplete: (){
                                    node.unfocus();
                                  }
                              ),
                              ProductTextField(
                                  width: textFormWidth,
                                  title: "Shipping Price",
                                  validation: validationList[0],
                                  textEditingController: pShippingPrice,
                                  textInputType: TextInputType.number,
                                  onComplete: (){
                                    node.unfocus();
                                  }
                              ),
                              ProductTextField(
                                  width: textFormWidth,
                                  title: "Pincode",
                                  validation: validationList[0],
                                  textEditingController: pPincode,
                                  textInputType: TextInputType.number,
                                  regExp: digitRegEx,
                                  textLength: zipcodeLength,
                                  onComplete: (){
                                    node.unfocus();
                                  }
                              ),
                              ProductTextField(
                                  width: textFormWidth,
                                  title: "CashBack",
                                  validation: validationList[0],
                                  textEditingController: pCashBack,
                                  textInputType: TextInputType.number,
                                  onComplete: (){
                                    node.unfocus();
                                  }
                              ),

                              ProductTextField(
                                width: textFormWidth,
                                title: "Select Unit",
                                validation: validationList[2],
                                textEditingController: dummyTextController,
                                onComplete: (){},
                                isTextField: false,
                                widget: OverLayPopUp(
                                  ontap: (){
                                    setState(() {
                                      showUnitDropDown=!showUnitDropDown;
                                    });
                                  },
                                  width: textFormWidth,
                                  hinttext: "Select Unit",
                                  selectedValue: selectedUnit,
                                  showPopUp: showUnitDropDown,
                                  data: pn.units,
                                  onitemTap: (i){
                                    setState(() {
                                      showUnitDropDown=false;
                                      selectedUnit=pn.units[i];
                                    });
                                  },
                                  isToJson: false,
                                ),
                              ),
                              ProductTextField(
                                  width: textFormWidth,
                                  title: "Website URL",
                                  validation: validationList[0],
                                  textEditingController: pWebsiteUrl,
                                  onComplete: (){
                                    node.unfocus();
                                  }
                              ),
                              ProductTextField(
                                  width: textFormWidth,
                                  title: "Embedded You tube URL",
                                  validation: validationList[0],
                                  textEditingController: pYouTubeUrl,
                                  onComplete: (){
                                    node.unfocus();
                                  }
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 20,top: 20),
                                width: textFormWidth-20,
                                height: 50,
                                child: Row(
                                  children: [
                                    Text("Product Availability in Stock",
                                      style: TextStyle(fontFamily: 'RR',fontSize: 20,color: Color(0xFF505050)),
                                    ),
                                    Spacer(),
                                    CustomSwitch(
                                        value: isProductAvailable,
                                        onchange: (v){
                                          setState(() {
                                            isProductAvailable=v;
                                          });
                                        },
                                    ),

                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20,top: 20),
                                width: textFormWidth-20,
                                height: 50,
                                child: Row(
                                  children: [
                                    Text("Hide the Product",
                                      style: TextStyle(fontFamily: 'RR',fontSize: 20,color: Color(0xFF505050)),
                                    ),
                                    Spacer(),
                                    CustomSwitch(
                                        value: hideProduct,
                                        onchange: (v){
                                          setState(() {
                                            hideProduct=v;
                                          });
                                        },
                                    ),
                                  ],
                                ),
                              ),
                              ProductTextField(
                                  width: textFormWidth,
                                  title: "Price API",
                                  validation: validationList[0],
                                  textEditingController: dummyTextController,
                                  onComplete: (){
                                    node.unfocus();
                                  },
                                  isTextField: false,
                                  widget: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              priceApi=1;
                                            });

                                          },
                                          child: Container(
                                            height: 50,
                                            alignment: Alignment.centerLeft,
                                           // padding:  EdgeInsets.only(left: SizeConfig.width20!),
                                            color: Colors.transparent,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                AnimatedContainer(
                                                  duration: animeDuration,
                                                  curve: animeCurve,
                                                  height: 25,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: priceApi==1?th.loginBtn:Color(0xFFBABABA),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(color: priceApi==1?th.primaryColor2:Color(0xFFDADADA),width: 7)
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Text("FP",
                                                  style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 18,fontFamily: 'RR'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              priceApi=2;
                                            });

                                          },
                                          child: Container(
                                            height: 50,
                                            alignment: Alignment.centerLeft,
                                           // padding:  EdgeInsets.only(left: SizeConfig.width20!),
                                            color: Colors.transparent,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                AnimatedContainer(
                                                  duration: animeDuration,
                                                  curve: animeCurve,
                                                  height: 25,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: priceApi==2?th.loginBtn:Color(0xFFBABABA),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(color: priceApi==2?th.primaryColor2:Color(0xFFDADADA),width: 7)
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Text("GOP",
                                                  style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 18,fontFamily: 'RR'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ),

                              ProductTextField(
                                  width: SizeConfig.screenWidth!,
                                  title: "Description",
                                  validation: validationList[0],
                                  textEditingController: pDescription,
                                  maxlines: 3,
                                  onComplete: (){
                                    node.unfocus();
                                  },
                              ),
                              ProductTextField(
                                width: SizeConfig.screenWidth!,
                                title: "Enter Tags",
                                validation: validationList[2],
                                textEditingController: dummyTextController,
                                onComplete: (){},
                                isTextField: false,
                                widget: MultiTags(
                                  hintText: 'Enter Tags',
                                  data: tagsList,
                                  textFieldWidth: 180,
                                  width: SizeConfig.screenWidth!,
                                ),
                              ),
                              ProductTextField(
                                width: SizeConfig.screenWidth!,
                                title: "SEO KeyWords",
                                validation: validationList[2],
                                textEditingController: dummyTextController,
                                onComplete: (){},
                                isTextField: false,
                                widget: MultiTags(
                                  hintText: 'Enter SEO KeyWords',
                                  data: seoKeyWordsList,
                                  textFieldWidth: 180,
                                  width: SizeConfig.screenWidth!,
                                ),
                              ),
                              ProductTextField(
                                width: SizeConfig.screenWidth!,
                                title: "SEO Titles",
                                validation: validationList[2],
                                textEditingController: dummyTextController,
                                onComplete: (){},
                                isTextField: false,
                                widget: MultiTags(
                                  hintText: 'Enter SEO Title',
                                  data: seoTitlesList,
                                  textFieldWidth: 180,
                                  width: SizeConfig.screenWidth!,
                                ),
                              ),

                              ProductTextField(
                                  width: SizeConfig.screenWidth!*0.5+170,
                                  title: "Highlights",
                                  validation: validationList[0],
                                  textEditingController: dummyTextController,
                                  onComplete: (){
                                    node.unfocus();
                                  },
                                  isTextField: false,
                                  widget: AddMoreTextFieldAnimation(
                                      data: highLightsList,
                                      hintText: "Highlights",
                                      addCB: addHighlights,
                                      deleteCB: (i){
                                        setState(() {
                                          highLightsList.removeAt(i);
                                        });
                                      }
                                  )
                              ),

                              //Add values
                              GestureDetector(
                                onTap: (){
                                  addTempValues();
                                  // setState(() {
                                  //   isAddValueClick=true;
                                  //   tempSubAddValues.clear();
                                  //   selectedHeading=-1;
                                  // });
                                },
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  alignment: Alignment.centerLeft,
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
                              ),
                             for(int i=0;i<tempAddValues.length;i++)
                               Container(
                                 padding: EdgeInsets.all(15),
                                 margin: EdgeInsets.only(left: 20,right: 20),
                                 width: width1,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(5),
                                     border: Border.all(color: addNewTextFieldBorder),
                                     color: Colors.white
                                 ),
                                 constraints: BoxConstraints(
                                     minHeight: 100
                                 ),
                                 child: Column(
                                   children: [
                                     Row(
                                       children: [
                                         AddNewLabelTextField(
                                           margin: EdgeInsets.only(left: 0),
                                           width: width1*0.5,
                                           hintText: "Enter Title",
                                           textEditingController: tempAddValues[i].title,
                                           onEditComplete: (){
                                             node.unfocus();
                                           },
                                           onChange: (v){},
                                         ),
                                         Spacer(),
                                         GestureDetector(
                                           onTap: (){
                                             if(tempAddValues[i].subAddValuesList.isEmpty){
                                               setState(() {
                                                 tempAddValues[i].selectedHeading=1;
                                                 addTempSubValues(i);
                                               });
                                             }

                                           },
                                           child: Container(
                                             height: 50,
                                             width: 130,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(5),
                                                 border: Border.all(color: addNewTextFieldBorder),
                                                 color:tempAddValues[i].selectedHeading==1?Colors.white: Colors.grey.withOpacity(0.25)
                                             ),
                                             alignment: Alignment.center,
                                             child: Text("With Heading",style: textFormTs1,),
                                           ),
                                         ),
                                         Spacer(),
                                         GestureDetector(
                                           onTap: (){
                                             if(tempAddValues[i].subAddValuesList.isEmpty){
                                               setState(() {
                                                 tempAddValues[i].selectedHeading=2;
                                                 addTempSubValues(i);
                                               });
                                             }
                                           },
                                           child: Container(
                                             height: 50,
                                             width: 130,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(5),
                                                 border: Border.all(color: addNewTextFieldBorder),
                                                 color: tempAddValues[i].selectedHeading==2?Colors.white:Colors.grey.withOpacity(0.25)
                                             ),
                                             alignment: Alignment.center,
                                             child: Text("Without Heading",style: textFormTs1,),
                                           ),
                                         ),
                                         Spacer(),
                                         AddBtn(ontap: (){
                                           setState(() {
                                             tempAddValues.removeAt(i);
                                           });
                                         },
                                           color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
                                           margin: EdgeInsets.only(left: 0),
                                           widget: Icon(Icons.clear,color: Colors.white,),
                                         ),
                                       ],
                                     ),
                                     SizedBox(height: 15,),
                                     for(int j=0;j<tempAddValues[i].subAddValuesList.length;j++)
                                       Column(
                                         children: [
                                           tempAddValues[i].selectedHeading==1? Align(
                                             alignment: Alignment.centerLeft,
                                             child: AddNewLabelTextField(
                                               margin: EdgeInsets.only(left: 0,top: 10),
                                               width: width1*0.5,
                                               hintText: "Enter Heading",
                                               textEditingController: tempAddValues[i].subAddValuesList[j].heading,
                                               onEditComplete: (){
                                                 node.unfocus();
                                               },
                                               onChange: (v){},
                                             ),
                                           ):Container(),
                                           SizedBox(height: 10,),
                                           Row(
                                             children: [
                                               AddNewLabelTextField(
                                                 margin: EdgeInsets.only(top: 0),
                                                 width: width1*0.4,
                                                 hintText: "Enter Title",
                                                 textEditingController: tempAddValues[i].subAddValuesList[j].title,
                                                 onEditComplete: (){
                                                   node.unfocus();
                                                 },
                                                 onChange: (v){},
                                               ),
                                               Spacer(),
                                               AddNewLabelTextField(
                                                 margin: EdgeInsets.only(left: 0),
                                                 width: width1*0.4,
                                                 hintText: "Enter Value",
                                                 textEditingController: tempAddValues[i].subAddValuesList[j].value,
                                                 onEditComplete: (){
                                                   node.unfocus();
                                                 },
                                                 onChange: (v){},
                                               ),
                                               Spacer(),
                                               AddBtn(ontap: (){
                                                 addTempSubValues(i);
                                               },
                                                 color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
                                                 margin: EdgeInsets.only(left: 0),
                                               ),
                                               Spacer(),
                                               AddBtn(ontap: (){
                                                 setState(() {
                                                   tempAddValues[i].subAddValuesList.removeAt(j);
                                                 });
                                               },
                                                 color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
                                                 margin: EdgeInsets.only(left: 0),
                                                 widget: Icon(Icons.clear,color: Colors.white,),
                                               ),
                                             ],
                                           )
                                         ],
                                       )


                                   ],
                                 ),
                               ),
                             /*isAddValueClick?Container(
                               padding: EdgeInsets.all(15),
                               margin: EdgeInsets.only(left: 20),
                               width: 600,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(5),
                                 border: Border.all(color: addNewTextFieldBorder),
                                 color: Colors.white
                               ),
                               constraints: BoxConstraints(
                                 minHeight: 100
                               ),
                               child: Column(
                                 children: [
                                   Row(
                                     children: [
                                       AddNewLabelTextField(
                                         margin: EdgeInsets.only(left: 0),
                                         width: 200,
                                         hintText: "Enter Title",
                                         onEditComplete: (){
                                           node.unfocus();
                                         },
                                         onChange: (v){},
                                       ),
                                       Spacer(),
                                       GestureDetector(
                                         onTap: (){
                                           if(tempSubAddValues.isEmpty){
                                             setState(() {
                                               selectedHeading=1;
                                               addTempSubValues();
                                             });
                                           }

                                         },
                                         child: Container(
                                           height: 50,
                                           width: 130,
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(5),
                                               border: Border.all(color: addNewTextFieldBorder),
                                               color:selectedHeading==1?Colors.white: Colors.grey.withOpacity(0.25)
                                           ),
                                           alignment: Alignment.center,
                                           child: Text("With Heading",style: textFormTs1,),
                                         ),
                                       ),
                                       Spacer(),
                                       GestureDetector(
                                         onTap: (){
                                           if(tempSubAddValues.isEmpty){
                                             setState(() {
                                               selectedHeading=2;
                                               addTempSubValues();
                                             });
                                           }
                                         },
                                         child: Container(
                                           height: 50,
                                           width: 130,
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(5),
                                               border: Border.all(color: addNewTextFieldBorder),
                                               color: selectedHeading==2?Colors.white:Colors.grey.withOpacity(0.25)
                                           ),
                                           alignment: Alignment.center,
                                           child: Text("Without Heading",style: textFormTs1,),
                                         ),
                                       ),
                                       Spacer(),
                                       AddBtn(ontap: (){
                                         setState(() {
                                           isAddValueClick=false;
                                           tempSubAddValues.clear();
                                         });
                                       },
                                       color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
                                         margin: EdgeInsets.only(left: 0),
                                         widget: Icon(Icons.clear,color: Colors.white,),
                                       ),
                                     ],
                                   ),
                                   for(int i=0;i<tempSubAddValues.length;i++)
                                     Column(
                                      children: [
                                       selectedHeading==1? Align(
                                          alignment: Alignment.centerLeft,
                                          child: AddNewLabelTextField(
                                            margin: EdgeInsets.only(left: 0,top: 10),
                                            width: 200,
                                            hintText: "Enter Heading",
                                            textEditingController: tempSubAddValues[i].heading,
                                            onEditComplete: (){
                                              node.unfocus();
                                            },
                                            onChange: (v){},
                                          ),
                                        ):Container(),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            AddNewLabelTextField(
                                              margin: EdgeInsets.only(top: 0),
                                              width: 200,
                                              hintText: "Enter Title",
                                              textEditingController: tempSubAddValues[i].title,
                                              onEditComplete: (){
                                                node.unfocus();
                                              },
                                              onChange: (v){},
                                            ),
                                            Spacer(),
                                            AddNewLabelTextField(
                                              margin: EdgeInsets.only(left: 0),
                                              width: 200,
                                              hintText: "Enter Value",
                                              textEditingController: tempSubAddValues[i].value,
                                              onEditComplete: (){
                                                node.unfocus();
                                              },
                                              onChange: (v){},
                                            ),
                                            Spacer(),
                                            AddBtn(ontap: (){
                                              addTempSubValues();
                                            },
                                              color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
                                              margin: EdgeInsets.only(left: 0),
                                            ),
                                            Spacer(),
                                            AddBtn(ontap: (){
                                              setState(() {
                                                tempSubAddValues.removeAt(i);
                                              });
                                            },
                                              color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
                                              margin: EdgeInsets.only(left: 0),
                                              widget: Icon(Icons.clear,color: Colors.white,),
                                            ),
                                          ],
                                        )
                                      ],
                                     )


                                 ],
                               ),
                             ):Container(),*/
                             // SizedBox(height: 50,),

                              PickImage(image: image, title: "Select Logo",cb: (v){
                                setState(() {
                                  image=v;
                                });
                              },),
                              ///   validationList[2]?ValidationErrorText(title: validationText,):Container(),

                              //  SizedBox(height: 50,),


                              Container(
                                width: SizeConfig.screenWidth,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(bottom: 50),
                                child: SaveBtn(ontap: (){

                                  if(pName.text.isEmpty){setState(() {validationList[0]=true;});}
                                  else{setState(() {validationList[0]=false;});}

                                  if(pslug.text.isEmpty){setState(() {validationList[1]=true;});}
                                  else{setState(() {validationList[1]=false;});}

                                  if(selectedCategory.isEmpty){setState(() {validationList[1]=true;});}
                                  else{setState(() {validationList[1]=false;});}

                                  if(image==null){setState(() {validationList[2]=true;});}
                                  else{setState(() {validationList[2]=false;});}

                                  int length=validationList.where((element) => element==false).toList().length;
                                  if(length==validationList.length){


                                    Navigator.pop(context);
                                  }


                                }),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    showBrandDropDown=false;
                    showCategoryDropDown=false;
                    showSubCategoryDropDown=false;
                    showUnitDropDown=false;
                  });
                },
                child: Container(
                  height:showBrandDropDown||showCategoryDropDown || showSubCategoryDropDown||showUnitDropDown? SizeConfig.screenHeight:0,
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



/*class ProductTextField extends StatelessWidget {
  double width;
  String title;
  Color titleColor;
  String regExp;
  bool validation;
  TextEditingController? textEditingController;
  VoidCallback onComplete;
  bool isTextField;
  Widget? widget;
  double leftPadding;
  TextInputType textInputType;
  int? textLength;
  int? maxlines;
  Widget? suffixIcon;
  bool isEnable;
  ProductTextField({required this.width,required this.title,required this.validation, this.textEditingController,
  required this.onComplete,this.isTextField=true,this.widget,this.leftPadding=20,this.regExp='[A-Za-z0-9@., ]',this.textInputType=TextInputType.emailAddress,
  this.textLength=null,this.maxlines=1,this.titleColor=const Color(0xFF505050),this.suffixIcon,this.isEnable=true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(left: leftPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldHeader(
            title: title,
            padd: paddTextFieldHeader2,
            textColor: titleColor,
          ),
          isTextField?AddNewLabelTextField(
            margin:maxlines==null ?EdgeInsets.only(right: 20,top: 10):maxlines!>1?EdgeInsets.only(right: 20,top: 10): marginAddNewTextField2,
            width: width,
            textEditingController: textEditingController,
            hintText: title,
            regExp: regExp,
            textInputType: textInputType,
            textLength: textLength,
            maxlines: maxlines,
            suffixIcon: suffixIcon,
            isEnabled: isEnable,
            ontap: (){

            },
            onChange: (v){

            },
            onEditComplete:onComplete,
          ):widget!,
          validation?ValidationErrorText(title: validationText,padd: paddTextFieldHeader2,):Container(),
        ],
      ),
    );
  }
}*/
class ProductTextField extends StatelessWidget {
  double width;
  double titleWidth;
  String title;
  Color titleColor;
  String regExp;
  bool validation;
  TextEditingController? textEditingController;
  VoidCallback onComplete;
  bool isTextField;
  Widget? widget;
  double leftPadding;
  TextInputType textInputType;
  int? textLength;
  int? maxlines;
  Widget? suffixIcon;
  bool isEnable;
  CrossAxisAlignment crossAxisAlignment;
  bool showValidation;
  EdgeInsets paddTextFieldHeader2;
  ProductTextField({required this.width,this.titleWidth=250,required this.title,required this.validation, this.textEditingController,
  required this.onComplete,this.isTextField=true,this.widget,this.leftPadding=20,this.regExp='[A-Za-z0-9@., ]',this.textInputType=TextInputType.emailAddress,
  this.textLength=null,this.maxlines=1,this.titleColor=const Color(0xFF505050),this.suffixIcon,this.isEnable=true,
  this.crossAxisAlignment=CrossAxisAlignment.center,this.showValidation=true,this.paddTextFieldHeader2=const EdgeInsets.only(left: 0)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: titleWidth+width+leftPadding,
      padding: EdgeInsets.only(left: leftPadding),
      //color: Colors.red,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          TextFieldHeader(
            title: title,
            padd: paddTextFieldHeader2,
            textColor: titleColor,
            width: titleWidth,
          ),
          showValidation?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isTextField?AddNewLabelTextField(
                margin:maxlines==null ?EdgeInsets.only(right: 20,top: 10):maxlines!>1?EdgeInsets.only(right: 0,top: 10): marginAddNewTextField2,
                width: width,
                textEditingController: textEditingController,
                hintText: title,
                regExp: regExp,
                textInputType: textInputType,
                textLength: textLength,
                maxlines: maxlines,
                suffixIcon: suffixIcon,
                isEnabled: isEnable,
                ontap: (){

                },
                onChange: (v){

                },
                onEditComplete:onComplete,
              ):widget!,
              validation?ValidationErrorText(title: validationText,padd: paddTextFieldHeader2,):Container(),
            ],
          ):isTextField?AddNewLabelTextField(
            margin:maxlines==null ?EdgeInsets.only(right: 20,top: 10):maxlines!>1?EdgeInsets.only(right: 20,top: 10): marginAddNewTextField2,
            width: width,
            textEditingController: textEditingController,
            hintText: title,
            regExp: regExp,
            textInputType: textInputType,
            textLength: textLength,
            maxlines: maxlines,
            suffixIcon: suffixIcon,
            isEnabled: isEnable,
            ontap: (){

            },
            onChange: (v){

            },
            onEditComplete:onComplete,
          ):widget!,

        ],
      ),
    );
  }
}




class AddValues{
  TextEditingController title;
  int selectedHeading;
  List<SubAddValues> subAddValuesList;
  AddValues({required this.title,required this.selectedHeading,required this.subAddValuesList});
}
class SubAddValues{
  TextEditingController heading;
  TextEditingController title;
  TextEditingController value;
  SubAddValues({required this.heading,required this.title,required this.value});
}

