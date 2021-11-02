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

class ProductStockAdd extends StatefulWidget {
  const ProductStockAdd({Key? key}) : super(key: key);

  @override
  _ProductStockAddState createState() => _ProductStockAddState();
}

class _ProductStockAddState extends State<ProductStockAdd> {
  TextEditingController pdName=new TextEditingController();
  TextEditingController category=new TextEditingController();
  TextEditingController stock=new TextEditingController();
  TextEditingController status=new TextEditingController();


  String selectedCategory="";

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  bool showCategoryDropDown=false;


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
              Text("Product Stock / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                      title: "Product Name",
                      validation: validationList[1],
                      textEditingController: pdName,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  PickImage(image: image, title: "Image",cb: (v){
                    setState(() {
                      image=v;
                    });
                  },),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Category",
                      validation: validationList[1],
                      textEditingController: category,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Stock",
                      validation: validationList[1],
                      textEditingController: stock,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Status",
                    validation: validationList[1],
                    textEditingController: status,
                    onComplete: (){},
                    isTextField: false,
                    widget: OverLayPopUp(
                      ontap: (){
                        setState(() {
                          showCategoryDropDown=!showCategoryDropDown;
                        });
                      },
                      width: textFormWidth,
                      hinttext: "Select Status",
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
