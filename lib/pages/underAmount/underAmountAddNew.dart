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

class UnderAmountAdd extends StatefulWidget {
  const UnderAmountAdd({Key? key}) : super(key: key);

  @override
  _UnderAmountAddState createState() => _UnderAmountAddState();
}

class _UnderAmountAddState extends State<UnderAmountAdd> {
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
              Text("Under Amount / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                crossAxisAlignment: cA1,
                children: [
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Enter Amount",
                      validation: validationList[1],
                      textEditingController: enterAmt,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Sort Order",
                      validation: validationList[1],
                      textEditingController: sortOrder,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: inBetweenHeight+10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Select Slider",
                      validation: validationList[1],
                      isTextField: false,
                      onComplete: (){
                        node.unfocus();
                      },
                      crossAxisAlignment: imageUploadCA,
                      widget: PickImage(image: image, title: "Select Slider",cb: (v){
                        setState(() {
                          image=v;
                        });
                      },),
                  ),

                  SizedBox(height: 50,),
                  Container(
                    alignment:Alignment.center,
                    child: SaveBtn(
                      ontap: (){},
                    ),
                  ),

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
