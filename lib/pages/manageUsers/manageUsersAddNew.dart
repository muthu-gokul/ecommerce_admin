import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandGrid.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/pages/profile.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/circleProfile.dart';
import 'package:ecommerce_admin/widgets/customAppBar.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/multiTags.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

class ManageUsersAddNew extends StatefulWidget {
  @override
  State<ManageUsersAddNew> createState() => _ManageUsersAddNewState();
}

class _ManageUsersAddNewState extends State<ManageUsersAddNew> {
  TextEditingController key=new TextEditingController();
  TextEditingController dummyTextController=new TextEditingController();
  TextEditingController secret=new TextEditingController();

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  bool showProductDropDown=false;
  String selectedProduct="";

  bool showRegionDropDown=false;
  String selectedRegion="";
  List<String> region=["Chennai","Bangalore","AAvadi"];


  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    return Scaffold(

      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                color:th.addNewBodyColor,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: cA1,
                    children: [
                      CustomAppBarAddNew(
                        title: "Add New Manage Users",
                      ),
                      SizedBox(height: 20,),
                      ProfilePic(
                        alignment: Alignment.center,
                      ),
                      SizedBox(height: 20,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "First Name",
                        validation: validationList[1],
                        onComplete: (){
                          node.unfocus();
                        },

                      ),
                      SizedBox(height: 20,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Last Name",
                        validation: validationList[1],
                        onComplete: (){
                          node.unfocus();
                        },

                      ),
                      SizedBox(height: 20,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Contact Number",
                        validation: validationList[1],

                        onComplete: (){
                          node.unfocus();
                        },
                      ),
                      SizedBox(height: 20,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Email",
                        validation: validationList[1],
                        onComplete: (){
                          node.unfocus();
                        },
                      ),
                      SizedBox(height: 20,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "User Group",
                        validation: validationList[1],
                       // textEditingController: role,
                        onComplete: (){},
                        isTextField: false,
                        widget:CustomPopup(
                          hintText: "Select User Group",
                          data:["Super Admin","Admin","General User"],
                          selectedValue: selectedProduct,
                          width:textFormWidth ,
                          leftMargin: 0,
                          edgeInsets: EdgeInsets.only(left: 0),
                          onSelect: (v){
                            setState(() {
                              selectedProduct=v;
                            });
                          },
                        ),

                      ),
                      SizedBox(height: 20,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Region",
                        validation: validationList[1],
                       // textEditingController: role,
                        onComplete: (){},
                        isTextField: false,
                        widget:CustomPopup(
                          hintText: "Select Region",
                          data:region,
                          selectedValue: selectedRegion,
                          width:textFormWidth ,
                          leftMargin: 0,
                          edgeInsets: EdgeInsets.only(left: 0),
                          onSelect: (v){
                            setState(() {
                              selectedRegion=v;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        width: textFormWidth+(40),
                        alignment: Alignment.center,
                        child: SaveBtn(ontap: (){



                        }),
                      ),

                      SizedBox(height: 100,),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

