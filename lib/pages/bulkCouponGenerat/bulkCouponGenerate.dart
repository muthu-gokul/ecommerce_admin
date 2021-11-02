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

class BulkCouponGenerate extends StatefulWidget {
  const BulkCouponGenerate({Key? key}) : super(key: key);

  @override
  _BulkCouponGenerateState createState() => _BulkCouponGenerateState();
}

class _BulkCouponGenerateState extends State<BulkCouponGenerate> {
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
  TextEditingController dummyTextController=new TextEditingController();



  TextEditingController SCatg=new TextEditingController();
  TextEditingController items=new TextEditingController();
  TextEditingController status=new TextEditingController();
  TextEditingController regdate=new TextEditingController();

  bool check=false;

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

  // bool _keyboardVisible = false;
  // Color headerClr=Color(0xFF505050);
  TextStyle headerTs=TextStyle(fontFamily: 'RR',fontSize: 18,color: Color(0xFF505050));
  List<String> advertiserTypeList=[
    "Add to store",
    "Export to CSV",
    "Email to recipients",
  ];
  int selectedAdType=-1;
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Container(
                      padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text("Actions:",style: ts18(grey1,fontsize: 30),)
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "No of coupons generated",
                      validation: validationList[1],
                      textEditingController: vendorName,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: paddTextFieldHeader,
                    child: Text("Generate Coupons",style: headerTs),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: advertiserTypeList.length*50.0,
                    child: Theme(
                      data: glowTransparent(context),
                      child: ListView.builder(
                        itemCount: advertiserTypeList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx,i){
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedAdType=i;
                              });

                            },
                            child: Container(
                              height: 50,
                              alignment: Alignment.centerLeft,
                              padding:  EdgeInsets.only(left: SizeConfig.width20!),
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
                                        color: selectedAdType==i?th.loginBtn:Color(0xFFBABABA),
                                        shape: BoxShape.circle,
                                        border: Border.all(color: selectedAdType==i?th.primaryColor2:Color(0xFFDADADA),width: 7)
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("${advertiserTypeList[i]}",
                                    style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 18,fontFamily: 'RL'),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  validationList[1]?ValidationErrorText(title: validationText,):Container(),
                  SizedBox(height: 15,),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth+20,
                      title: "Coupon Description:",
                      validation: validationList[1],
                      onComplete: (){
                        node.unfocus();
                      },maxlines: 3,
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Coupon offer",
                      validation: validationList[1],
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth+400,
                    title: "Allow free shipping",
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
                                check=!check;
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
                                        color: check?th.loginBtn:Color(0xFFBABABA),
                                        shape: BoxShape.circle,
                                        border: Border.all(color:check?th.primaryColor2:Color(0xFFDADADA),width: 7)
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("Check this box if the coupons is valid. Free shipping is must be enabled on the shipping cart.  ",
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
                    width: textFormWidth,
                    title: "Coupon Type",
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
                      width: textFormWidth,
                      hinttext: "Select Coupon Type",
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
                    title: " Coupon Valid to:",
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
                      hinttext: "Select  Coupon Valid to",
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
                      title: "Coupon Start From",
                      validation: validationList[1],
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth+20,
                      title: "Office Address",
                      validation: validationList[1],
                      textEditingController: address,
                      onComplete: (){
                        node.unfocus();
                      },
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth+20,
                    title: "Coupon End From",
                    validation: validationList[1],
                    textEditingController: district,
                    onComplete: (){
                      node.unfocus();
                    }
                  ),
                  SizedBox(height: 10,),
                  Container(
                      padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text("Coupon Code Format:",style: ts18(grey1,fontsize: 30),)
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      ProductTextField(
                          width: textFormWidth-20,
                          title: "Prefix ",
                          validation: validationList[1],

                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      ProductTextField(
                          width: textFormWidth-20,
                          title: "Coupon_ Code",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: 10,),
                      ProductTextField(
                          width: textFormWidth-20,
                          title: "Suffix ",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
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
      );
  }
}

class FilterModel{
  TextEditingController title;
  List<dynamic> data;
  FilterModel({required this.title,required this.data});
}
