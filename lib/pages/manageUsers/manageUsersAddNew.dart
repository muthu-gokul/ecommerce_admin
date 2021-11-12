import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandGrid.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
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
              Text("Manage Users / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
            ],
          ),
        ),
      ),
      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Stack(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              margin: EdgeInsets.only(left: 150),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: th.primaryColor3,width: 3.5),
                                  //  color: AppTheme.yellowColor,
                                  boxShadow: [
                                    // BoxShadow(
                                    //   color: AppTheme.yellowColor.withOpacity(0.4),
                                    //   spreadRadius: 1,
                                    //   blurRadius: 5,
                                    //   offset: Offset(1, 8), // changes position of shadow
                                    // ),
                                  ]
                              ),
                              child:Image.asset("assets/images/avatar.png",fit: BoxFit.cover,),
                            ),
                            Positioned(
                                bottom: 0,
                                right:15,
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.cyanAccent
                                    ),
                                    child: Icon(Icons.edit_outlined,color: Colors.black,size: 20,)
                                )
                            )
                          ],
                        ),
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
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showProductDropDown=!showProductDropDown;
                            });
                          },
                          width: textFormWidth,
                          hinttext: "Select User Group",
                          selectedValue: selectedProduct,
                          showPopUp: showProductDropDown,
                          data: ["Super Admin","Admin","General User"],
                          onitemTap: (i){
                            setState(() {
                              showProductDropDown=false;
                              if(i==0){
                                selectedProduct="Super Admin";
                              }
                              else if(i==1){
                                selectedProduct="Admin";
                              }
                              else{
                                selectedProduct="General User";
                              }
                            });
                          },
                          isToJson: false,
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
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showRegionDropDown=!showRegionDropDown;
                            });
                          },
                          width: textFormWidth,
                          hinttext: "Select Region",
                          selectedValue: selectedRegion,
                          showPopUp: showRegionDropDown,
                          data: region,
                          onitemTap: (i){
                            setState(() {
                              showRegionDropDown=false;
                              selectedRegion=region[i];
                            });
                          },
                          isToJson: false,
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

