import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customAppBar.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';

class BranchAddNew extends StatefulWidget {
  const BranchAddNew({Key? key}) : super(key: key);

  @override
  _BranchAddNewState createState() => _BranchAddNewState();
}

class _BranchAddNewState extends State<BranchAddNew> {


  List<XFile>? productImages=[];
  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);


  List<FilterModel> filters=[];


  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    return Scaffold(

      body: Stack(
        children: [
          Consumer<ThemeNotifier>(
            builder: (context,th,child)=>  Consumer<ProductNotifier>(
              builder: (context,pn,child)=> Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                color:th.addNewBodyColor,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: cA1,
                    children: [
                      CustomAppBarAddNew(
                        title: "Add New Branch",
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Branch Code",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "GST Number",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Address",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Coordinates",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Locality",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "District",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Region",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "State",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Pin Code",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Contact Number",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Email",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Search & add a pin to set address",
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
          ),
        ],
      )
    );
  }
}

class FilterModel{
  TextEditingController title;
  List<dynamic> data;
  FilterModel({required this.title,required this.data});
}
