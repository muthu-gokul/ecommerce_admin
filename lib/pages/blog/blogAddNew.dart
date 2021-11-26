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

class BlogAddNew extends StatefulWidget {
  const BlogAddNew({Key? key}) : super(key: key);

  @override
  _BlogAddNewState createState() => _BlogAddNewState();
}

class _BlogAddNewState extends State<BlogAddNew> {


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
                        title: "Add New Blog",
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Like",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      PickImage(image: image, title: "Select Slider",cb: (v){
                        setState(() {
                          image=v;
                        });
                      },),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Title",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Details",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Date",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Time",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Author by",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Heading",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Author by",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Details",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Time",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
                      PickImage(image: image, title: "Select Slider",cb: (v){
                        setState(() {
                          image=v;
                        });
                      },),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Detail Description",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: inBetweenHeight,),
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
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Short Description",
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
