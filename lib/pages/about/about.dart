import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
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

class AboutWebAdd extends StatefulWidget {
  const AboutWebAdd({Key? key}) : super(key: key);

  @override
  _AboutWebAddState createState() => _AboutWebAddState();
}

class _AboutWebAddState extends State<AboutWebAdd> {
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
  List<XFile>? productImages=[];
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
            height: SizeConfig.screenHeight!-appBarHei,
            width: SizeConfig.screenWidth!-100,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: cA1,
                children: [
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Heading",
                      validation: validationList[1],
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
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
                      title: "Detail Description",
                      validation: validationList[1],
                      onComplete: (){
                        node.unfocus();
                      },maxlines: 3,
                  ),
                  ProductTextField(
                    width: textFormWidth+20,
                    leftPadding: 40,
                    title: "Upload Product Image",
                    validation: validationList[1],
                    onComplete: (){
                      node.unfocus();
                    },
                    isTextField: false,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You can upload multiple images",style: ts18(grey1,fontfamily: 'RL'),),
                        SizedBox(height: 10,),
                        PickMultiImage(
                            images: productImages??[],
                            title: "Upload Product",
                            cb: (c){
                              setState(() {
                                productImages=c;
                              });
                            },
                            deleteCb: (i){
                              if(productImages!=null){
                                setState(() {
                                  productImages!.removeAt(i);
                                });
                              }
                            },
                            wid: textFormWidth+20
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: inBetweenHeight,),
                  Container(
                      padding:  EdgeInsets.only(left: 10,bottom: 10,top: 10),
                      //alignment: Alignment.centerLeft,
                      child: Text("Counter",style: ts18(grey1,fontsize: 30),)
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Happy Customers",
                      validation: validationList[1],
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Products Sales",
                      validation: validationList[1],
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Our Services",
                      validation: validationList[1],
                      onComplete: (){
                        node.unfocus();
                      },
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Daily Page Visit",
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
      );
  }
}

class FilterModel{
  TextEditingController title;
  List<dynamic> data;
  FilterModel({required this.title,required this.data});
}
