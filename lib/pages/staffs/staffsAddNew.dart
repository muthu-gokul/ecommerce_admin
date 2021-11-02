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

class StaffsAdd extends StatefulWidget {
  const StaffsAdd({Key? key}) : super(key: key);

  @override
  _StaffsAddState createState() => _StaffsAddState();
}

class _StaffsAddState extends State<StaffsAdd> {
  TextEditingController name=new TextEditingController();
  TextEditingController idno=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController phno=new TextEditingController();
  TextEditingController role=new TextEditingController();

  String selectedProduct="";

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  bool showProductDropDown=false;

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
              Text("Staffs / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                      title: "Name",
                      validation: validationList[1],
                      textEditingController: name,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Id Number",
                      validation: validationList[1],
                      textEditingController: idno,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Email",
                      validation: validationList[1],
                      textEditingController: email,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Phone Number",
                      validation: validationList[1],
                      textEditingController: phno,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth+20,
                      title: "Address",
                      validation: validationList[1],
                      textEditingController: phno,
                      onComplete: (){
                        node.unfocus();
                      },maxlines: 3,
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                    width: textFormWidth,
                    title: "Role",
                    validation: validationList[1],
                    textEditingController: role,
                    onComplete: (){},
                    isTextField: false,
                    widget: OverLayPopUp(
                      ontap: (){
                        setState(() {
                          showProductDropDown=!showProductDropDown;
                        });
                      },
                      width: textFormWidth,
                      hinttext: "Select Role",
                      selectedValue: selectedProduct,
                      showPopUp: showProductDropDown,
                      data: pn.categoryDropDownList,
                      onitemTap: (i){
                        setState(() {
                          showProductDropDown=false;
                          selectedProduct=pn.categoryDropDownList[i];
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
