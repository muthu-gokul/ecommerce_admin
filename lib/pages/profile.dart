import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/circleProfile.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customSearchPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../constants.dart';
import 'product/productAddNew.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late double width;
  bool showProductDropDown=false;
  String selectedProduct="";

  bool showRegionDropDown=false;
  String selectedRegion="";
  List<String> region=["Chennai","Bangalore","AAvadi"];

  bool isEdit=false;
  List<bool> validationList= List<bool>.generate(3, (i) => false);
  @override
  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-140;
    final node=FocusScope.of(context);
    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=> Container(
        height: SizeConfig.screenHeight!-appBarHei,
        width: SizeConfig.screenWidth!-100,
        color: bgColor,
        padding: EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !isEdit?Container(
                  width: width*0.32,
                  height: SizeConfig.screenHeight!-300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(0,0)
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        height: 80,
                        width: 80,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: th.primaryColor3.withOpacity(0.1),
                        ),
                        child: Image.asset("assets/images/avatar.png"),
                      ),
                      Text("Mr.Ramesh",style: TextStyle(fontFamily: 'RR',color: grey3,fontSize: 16,letterSpacing: 0.2),),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                        margin: EdgeInsets.only(top: 5,bottom: 20),
                        width: 60,
                        decoration: BoxDecoration(
                          color: th.primaryColor4.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        alignment: Alignment.center,
                        child: Text("Admin",style: ts14(th.primaryColor4,fontfamily: 'RM'),),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 15),
                        padding: EdgeInsets.only(bottom: 5),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: grey4))
                        ),
                        child: Text("Details",style: ts16(grey1,fontfamily: 'RM'),),
                      ),
                      detailView(Icons.call,"8787877878" ),
                      detailView(Icons.mail,"rameshjune28@gmail.com"  ),
                      detailView(Icons.location_on_sharp,"Chennai"  ),


                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap:(){
                              setState(() {
                                isEdit=true;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 130,
                              decoration: BoxDecoration(
                                color: th.primaryColor2,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              alignment: Alignment.center,
                              child: Text("Edit",style: ts16(Colors.white),),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ):
                Container(
                  width: width*0.32,
                  height: SizeConfig.screenHeight!-180,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(0,0)
                        )
                      ]
                  ),
                  child: Theme(
                    data: glowTransparent(context),
                    child: ListView(
                      children: [
                        SizedBox(height: 20,),
                        Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: th.primaryColor3.withOpacity(0.1),
                          ),
                          child: Image.asset("assets/images/avatar.png"),
                        ),


                        AddNewLabelTextField(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            hintText: "First Name",
                        ),
                        AddNewLabelTextField(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                          hintText: "Last Name",
                        ),
                        AddNewLabelTextField(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                          hintText: "Contact Number",
                        ),
                        AddNewLabelTextField(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                          hintText: "Email",
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.center,
                          child: CustomSearchPopUp(
                              width: width*0.32-40,
                              hintText: "Select User Group",
                              data: ["Super Admin","Admin","General User"],
                              onTap: (v){
                                setState(() {
                                  selectedProduct=v;
                                });
                              },
                              selectedValue: selectedProduct
                          ),
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.center,
                          child: CustomSearchPopUp(
                              width: width*0.32-40,
                              hintText: "Select Region",
                              data: region,
                              onTap: (v){
                                setState(() {
                                  selectedRegion=v;
                                });
                              },
                              selectedValue: selectedRegion
                          ),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap:(){
                                setState(() {
                                  isEdit=false;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Color(0xffDFDFE0),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                alignment: Alignment.center,
                                child: Text("Cancel",style: ts16(grey1),),
                              ),
                            ),
                            GestureDetector(
                              onTap:(){
                                setState(() {
                                  isEdit=false;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: th.primaryColor2,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                alignment: Alignment.center,
                                child: Text("Save",style: ts16(Colors.white),),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),



                /*Container(
                  width: 700,
                  height: SizeConfig.screenHeight!-70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(0,0)
                        )
                      ]
                  ),
                  child: Theme(
                    data: glowTransparent(context),
                    child: ListView(
                      children: [
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                isEdit=!isEdit;
                              });
                            },
                            child: Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: th.primaryColor2
                                ),
                                child: Icon(
                                  isEdit?Icons.clear:Icons.edit_outlined,
                                  color: Colors.white,size: 25,
                                )
                            ),
                          ),
                        ),

                        ProfilePic(
                          margin: EdgeInsets.only(left: 0),
                          alignment: Alignment.topCenter,
                        ),

                        ProductTextField(
                          width: textFormWidth,
                          title: "First Name",
                          validation: validationList[1],
                          isEnable: isEdit,
                          onComplete: (){
                            node.unfocus();
                          },

                        ),
                        SizedBox(height: 20,),
                        ProductTextField(
                          width: textFormWidth,
                          title: "Last Name",
                          isEnable: isEdit,
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
                          isEnable: isEdit,
                          onComplete: (){
                            node.unfocus();
                          },
                        ),
                        SizedBox(height: 20,),
                        ProductTextField(
                          width: textFormWidth,
                          title: "Email",
                          isEnable: isEdit,
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
                              if(isEdit){
                                setState(() {
                                  showProductDropDown=!showProductDropDown;
                                });
                              }

                            },
                            isEnable: isEdit,
                            width: textFormWidth+20,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              if(isEdit){
                                setState(() {
                                  showRegionDropDown=!showRegionDropDown;
                                });
                              }

                            },
                            width: textFormWidth+20,
                            isEnable: isEdit,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                        isEdit?Container(
                          width:(textFormWidth+(40)),
                          alignment: Alignment.center,
                          child: SaveBtn(ontap: (){
                            setState(() {
                              isEdit=false;
                            });
                          }),
                        ):Container(),
                        SizedBox(height: 50,),
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  showRegionDropDown =false;
                  showProductDropDown =false;

                });
              },
              child: Container(
                height:showRegionDropDown||showProductDropDown? SizeConfig.screenHeight:0,
                width: SizeConfig.screenWidth,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }


  detailView(IconData icon,dynamic value){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 7,bottom: 7),
      //alignment: Alignment.centerLeft,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width:35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor4.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Icon(icon,color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor4,),
          ),
          SizedBox(width: 10,),
          Container(
            width:((width*0.32)-100),
            alignment: Alignment.centerLeft,
            child: Text("$value",style: ts15(grey3),),
          ),
        ],
      ),
    );
  }
}
