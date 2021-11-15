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

class CompanySettings extends StatefulWidget {
  const CompanySettings({Key? key}) : super(key: key);

  @override
  _CompanySettingsState createState() => _CompanySettingsState();
}

class _CompanySettingsState extends State<CompanySettings> {
  TextEditingController vendorName=new TextEditingController();
  TextEditingController vendorType=new TextEditingController();
  TextEditingController cmpyName=new TextEditingController();
  TextEditingController gstNo=new TextEditingController();
  TextEditingController mail=new TextEditingController();
  TextEditingController mblNo=new TextEditingController();
  TextEditingController address=new TextEditingController();
  TextEditingController district=new TextEditingController();
  TextEditingController city=new TextEditingController();
  TextEditingController state=new TextEditingController();
  TextEditingController pincode=new TextEditingController();
  TextEditingController postOffice=new TextEditingController();
  TextEditingController wkHour=new TextEditingController();
  TextEditingController deliveryslot=new TextEditingController();
  TextEditingController spotdelivery=new TextEditingController();
  TextEditingController preparingDays=new TextEditingController();
  TextEditingController packingChrg=new TextEditingController();
  TextEditingController delvrymthd=new TextEditingController();
  TextEditingController delvrychrg=new TextEditingController();
  TextEditingController pickMthd=new TextEditingController();
  TextEditingController pickOffer=new TextEditingController();



  TextEditingController SCatg=new TextEditingController();
  TextEditingController items=new TextEditingController();
  TextEditingController status=new TextEditingController();
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
    SizeConfig().init(context);
    return Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Container(
            height: SizeConfig.screenHeight!-50,
            width: SizeConfig.screenWidth!-100,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: cA1,
                children: [
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Business Name  ",
                      validation: validationList[1],
                      textEditingController: vendorName,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Email Id",
                      validation: validationList[1],
                      textEditingController: mail,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Mobile Number",
                      validation: validationList[1],
                      textEditingController: mblNo,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Choose Advertise Type",
                    validation: validationList[1],
                    textEditingController: vendorType,
                    onComplete: (){},
                    isTextField: false,
                    widget: OverLayPopUp(
                      ontap: (){
                        setState(() {
                          showCategoryDropDown=!showCategoryDropDown;
                        });
                      },
                      width: textFormWidth+20,
                      hinttext: "Select Advertise Type",
                      crossAxisAlignment: cA2,
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
                    title: "Category Type:",
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
                      width: textFormWidth+20,
                      hinttext: "Select Category Type",
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
                  SizedBox(height: 10+10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Select Image:",
                    validation: validationList[1],
                    crossAxisAlignment: imageUploadCA,
                    textEditingController: SCatg,
                    onComplete: (){},
                    isTextField: false,
                    widget: PickImage(image: image, title: "Brand Logo",cb: (v){
                      setState(() {
                        image=v;
                      });
                    },),
                  ),

                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "GST No",
                      validation: validationList[1],
                      textEditingController: gstNo,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Office Address",
                      validation: validationList[1],
                      textEditingController: address,
                      onComplete: (){
                        node.unfocus();
                      },maxlines: 3,
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Shipping Address",
                    validation: validationList[1],
                    textEditingController: district,
                    onComplete: (){
                      node.unfocus();
                    },maxlines: 3,
                  ),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Select Country:",
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
                      width: textFormWidth+20,
                      hinttext: "Select Country",
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
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Country Code:",
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
                      width: textFormWidth+20,
                      hinttext: "Select Country Code",
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
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Country Timing:",
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
                      width: textFormWidth+20,
                      crossAxisAlignment: cA2,
                      hinttext: "Select Country Timing",
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
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Country Currency:",
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
                      width: textFormWidth+20,
                      crossAxisAlignment: cA2,
                      hinttext: "Select Country Currency",
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
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "State",
                      validation: validationList[1],

                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "City",
                      validation: validationList[1],

                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Postal Code",
                      validation: validationList[1],

                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Description",
                      validation: validationList[1],

                      onComplete: (){
                        node.unfocus();
                      },maxlines: 3,

                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Copy Right",
                      validation: validationList[1],

                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  Container(
                      padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                      //alignment: Alignment.centerLeft,
                      child: Text("Bank Information",style: ts18(grey1,fontsize: 30),)
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Bank Name",
                      validation: validationList[1],

                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Account Name",
                      validation: validationList[1],
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Bank Account No",
                      validation: validationList[1],
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "IFSC Code",
                      validation: validationList[1],
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Bank Branch",
                      validation: validationList[1],
                      textEditingController: packingChrg,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Postal Code",
                      validation: validationList[1],
                      textEditingController: packingChrg,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  Container(
                      padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                   //   alignment: Alignment.centerLeft,
                      child: Text("Social Information",style: ts18(grey1,fontsize: 30),)
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Social Media Name",
                      validation: validationList[1],
                      textEditingController: packingChrg,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "URL Link",
                      validation: validationList[1],
                      textEditingController: packingChrg,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10+10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Select Social Logo:",
                    crossAxisAlignment: imageUploadCA,
                    validation: validationList[1],
                    textEditingController: SCatg,
                    onComplete: (){},
                    isTextField: false,
                    widget: PickImage(image: image, title: "Brand Logo",cb: (v){
                      setState(() {
                        image=v;
                      });
                    },),
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Enter Description",
                      validation: validationList[1],
                      textEditingController: packingChrg,
                      onComplete: (){
                        node.unfocus();
                      },maxlines: 3,
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
      );
  }
}

class FilterModel{
  TextEditingController title;
  List<dynamic> data;
  FilterModel({required this.title,required this.data});
}
