import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/arrowAnimation.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/expandedSection.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';

class DeliveryBoysAdd extends StatefulWidget {
  const DeliveryBoysAdd({Key? key}) : super(key: key);

  @override
  _DeliveryBoysAddState createState() => _DeliveryBoysAddState();
}

class _DeliveryBoysAddState extends State<DeliveryBoysAdd> with TickerProviderStateMixin{
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
  bool deliveryInfoOpen=false;
  bool deliveryBankInfoOpen=false;
  bool deliveryNotiInfoOpen=false;
  bool deliveryCongigInfoOpen=false;

  bool monthlySalaryInfoOpen=false;
  bool perOrderCommissionInfoOpen=false;


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
              Text("Delivery Boys / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                  Container(
                      padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text("Delivery Boy Information",style: ts18(grey1,fontsize: 20),)
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      ProductTextField(
                          width: textFormWidth+20,
                          title: "Name  ",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: 10,),
                      ProductTextField(
                          width: textFormWidth+20,
                          title: "Email Id",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: 10,),
                      ProductTextField(
                          width: textFormWidth+20,
                          title: "Mobile Number",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: 10,),
                      ProductTextField(
                        width: textFormWidth+20,
                        textEditingController: cmpyName,
                        title: "Country:",
                        validation: validationList[1],
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
                        width: textFormWidth+20,
                        textEditingController: city,
                        title: "City:",
                        validation: validationList[1],
                        onComplete: (){},
                        isTextField: false,
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showSubCategoryDropDown=!showSubCategoryDropDown;
                            });
                          },
                          width: textFormWidth+20,
                          hinttext: "Select City",
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
                      PickImage(image: image, title: "Choose File",cb: (v){
                        setState(() {
                          image=v;
                        });
                      },),
                      SizedBox(height: 10,),
                      ProductTextField(
                        width: textFormWidth+40,
                        title: "Address",
                        validation: validationList[1],
                        onComplete: (){
                          node.unfocus();
                        },maxlines: 3,
                      ),
                      SizedBox(height: 10,),
                      ProductTextField(
                          width: textFormWidth+20,
                          title: "Vehicle No",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: 10,),
                      ProductTextField(
                        width: textFormWidth+20,
                        title: "Licence No",
                        validation: validationList[1],
                        onComplete: (){
                          node.unfocus();
                        },
                      ),
                      SizedBox(height: 10,),
                      PickImage(image: image, title: "Licence",cb: (v){
                        setState(() {
                          image=v;
                        });
                      },),
                      SizedBox(height: 10,),
                      ProductTextField(
                        width: textFormWidth+20,
                        title: "RC No",
                        validation: validationList[1],
                        onComplete: (){
                          node.unfocus();
                        },
                      ),
                      SizedBox(height: 10,),
                      PickImage(image: image, title: "Rc Image",cb: (v){
                        setState(() {
                          image=v;
                        });
                      },),
                      SizedBox(height: 10,),
                      SizedBox(height: 10,),
                      ProductTextField(
                        width: textFormWidth+20,
                        title: "Insurance No",
                        validation: validationList[1],
                        onComplete: (){
                          node.unfocus();
                        },
                      ),
                      SizedBox(height: 10,),
                      PickImage(image: image, title: "Insurance",cb: (v){
                        setState(() {
                          image=v;
                        });
                      },),
                      SizedBox(height: 10,),
                      ProductTextField(
                          width: textFormWidth+20,
                          title: "Qualification",
                          validation: validationList[1],

                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        deliveryBankInfoOpen=!deliveryBankInfoOpen;
                      });
                    },
                    child: Container(
                      width: textFormWidth,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                              alignment: Alignment.centerLeft,
                              child: Text("Bank Information",style: ts18(grey1,fontsize: 20),)
                          ),
                          Arrow(isOpen: deliveryBankInfoOpen),

                        ],
                      ),
                    ),
                  ),


                  CustomExpansionTile(
                    expand: deliveryBankInfoOpen,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductTextField(
                            width: textFormWidth+20,
                            title: "Bank Name",
                            validation: validationList[1],

                            onComplete: (){
                              node.unfocus();
                            }
                        ),
                        SizedBox(height: 10,),
                        ProductTextField(
                            width: textFormWidth+20,
                            title: "Account Name",
                            validation: validationList[1],
                            onComplete: (){
                              node.unfocus();
                            }
                        ),
                        SizedBox(height: 10,),
                        ProductTextField(
                            width: textFormWidth+20,
                            title: "Bank Account No",
                            validation: validationList[1],
                            onComplete: (){
                              node.unfocus();
                            }
                        ),
                        SizedBox(height: 10,),
                        ProductTextField(
                            width: textFormWidth+20,
                            title: "IFSC Code",
                            validation: validationList[1],
                            onComplete: (){
                              node.unfocus();
                            }
                        ),
                        SizedBox(height: 10,),
                        ProductTextField(
                            width: textFormWidth+20,
                            title: "Bank Branch",
                            validation: validationList[1],
                            onComplete: (){
                              node.unfocus();
                            }
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        deliveryCongigInfoOpen=!deliveryCongigInfoOpen;
                      });
                    },
                    child: Container(
                      width: textFormWidth,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                              alignment: Alignment.centerLeft,
                              child: Text("Delivery Configuration",style: ts18(grey1,fontsize: 20),)
                          ),
                          Arrow(isOpen: deliveryCongigInfoOpen),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomExpansionTile(
                    expand: deliveryCongigInfoOpen,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: textFormWidth+20,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 20,),
                              TextFieldHeader(
                                title: "Monthly Salary",
                                padd: paddTextFieldHeader2,
                              ),
                              Spacer(),
                              CustomSwitch(value: monthlySalaryInfoOpen, onchange: (v){
                                setState(() {
                                  monthlySalaryInfoOpen=!monthlySalaryInfoOpen;
                                  perOrderCommissionInfoOpen=false;
                                });
                              })
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                       CustomExpansionTile(
                         expand: monthlySalaryInfoOpen,
                         child: ProductTextField(
                             width: textFormWidth+20,
                             title: "Salary Amount",
                             validation: validationList[1],

                             onComplete: (){
                               node.unfocus();
                             },
                           suffixIcon: Padding(
                             padding:  EdgeInsets.only(top: 12.0),
                             child: Text('₹',style: ts18(grey1,fontsize: 20),),
                           ),
                         ),
                       ),
                        SizedBox(height: 10,),
                        Container(
                          width: textFormWidth+20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 20,),
                              TextFieldHeader(
                                title: "Per Order Commission",
                                padd: paddTextFieldHeader2,
                              ),
                              Spacer(),
                              CustomSwitch(value: perOrderCommissionInfoOpen, onchange: (v){
                                setState(() {
                                  perOrderCommissionInfoOpen=!perOrderCommissionInfoOpen;
                                  monthlySalaryInfoOpen=false;
                                });
                              })
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        CustomExpansionTile(
                          expand: perOrderCommissionInfoOpen,
                          child: ProductTextField(
                              width: textFormWidth+20,
                              title: "Commission Rate",
                              validation: validationList[1],

                              onComplete: (){
                                node.unfocus();
                              },
                              suffixIcon: Padding(
                                padding:  EdgeInsets.only(top: 12.0),
                                   child: Text('₹  %',style: ts18(grey1,fontsize: 20),),
                              ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        deliveryNotiInfoOpen=!deliveryNotiInfoOpen;
                      });
                    },
                    child: Container(
                      width: textFormWidth,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                              alignment: Alignment.centerLeft,
                              child: Text("Notification Configuration",style: ts18(grey1,fontsize: 20),)
                          ),
                          Arrow(isOpen: deliveryNotiInfoOpen),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomExpansionTile(
                    expand: deliveryNotiInfoOpen,
                    child: Column(
                      children: [
                        Container(
                          width: textFormWidth+20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 20,),
                              TextFieldHeader(
                                title: "Send Mail",
                                padd: paddTextFieldHeader2,
                              ),
                              Spacer(),
                              CustomSwitch(value: true, onchange: (v){

                              })
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: textFormWidth+20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 20,),
                              TextFieldHeader(
                                title: "Send OTP",
                                padd: paddTextFieldHeader2,
                              ),
                              Spacer(),
                              CustomSwitch(value: true, onchange: (v){

                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
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



