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

import '../../constants.dart';

class CardClassificationAdd extends StatefulWidget {
  const CardClassificationAdd({Key? key}) : super(key: key);

  @override
  _CardClassificationAddState createState() => _CardClassificationAddState();
}

class _CardClassificationAddState extends State<CardClassificationAdd> {
  TextEditingController enterAmt=TextEditingController();
  TextEditingController sortOrder=new TextEditingController();

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
              Text("Card Classification / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                      title: "Card Name",
                      validation: validationList[1],
                      textEditingController: enterAmt,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  // ProductTextField(
                  //   width: textFormWidth,
                  //   title: "Category Type:",
                  //   validation: validationList[1],
                  //   onComplete: (){},
                  //   isTextField: false,
                  //   widget: OverLayPopUp(
                  //     ontap: (){
                  //       setState(() {
                  //         showSubCategoryDropDown=!showSubCategoryDropDown;
                  //       });
                  //     },
                  //     width: textFormWidth,
                  //     hinttext: "Select Category Type",
                  //     selectedValue: selectedSubCategory,
                  //     showPopUp: showSubCategoryDropDown,
                  //     data: pn.categoryDropDownList,
                  //     onitemTap: (i){
                  //       setState(() {
                  //         showSubCategoryDropDown=false;
                  //         selectedSubCategory=pn.categoryDropDownList[i];
                  //       });
                  //     },
                  //     isToJson: false,
                  //   ),
                  // ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Bank Name",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),

                  PickImage(image: image, title: "Select Slider",cb: (v){
                    setState(() {
                      image=v;
                    });
                  },),
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
