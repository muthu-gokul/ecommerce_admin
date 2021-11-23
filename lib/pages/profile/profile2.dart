import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/circleProfile.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  _ProfileState2 createState() => _ProfileState2();
}

class _ProfileState2 extends State<Profile2> {
  late double width,tabWidth,leftPos,middleWidth;

  int selectedTab=1;

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
    tabWidth=drawerOpen?width*0.54:width*0.67;
    middleWidth=tabWidth-(tabWidth*0.3)-300;
    if(selectedTab==1){
      leftPos=5;
    }
    else if(selectedTab==2){
      //leftPos=(width2*0.5)+150;
      leftPos=((tabWidth*0.25)*1)+5;
    }
    else if(selectedTab==3){
      //leftPos=(width2*0.5)+150;
      leftPos=((tabWidth*0.25)*2)+5;
    }
    else if(selectedTab==4){
      //leftPos=(width2*0.5)+150;
      leftPos=((tabWidth*0.25)*3)+5;
    }
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: width*0.32,
                  height: SizeConfig.screenHeight!-100,
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
                      ),
                      Text("Mr.Ramesh",style: TextStyle(fontFamily: 'RR',color: grey3,fontSize: 16,letterSpacing: 0.2),),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                        margin: EdgeInsets.only(top: 5,bottom: 20),
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        alignment: Alignment.center,
                        child: Text("Admin",style: ts14(Colors.red,fontfamily: 'RM'),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          activeDays(Colors.green, Icon(Icons.done,color: Colors.green[800],), 365, "Active days"),
                          activeDays(th.primaryColor3, Icon(Icons.card_travel,color: th.primaryColor2,), 4343, "Products"),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 15),
                        padding: EdgeInsets.only(bottom: 5),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: grey4))
                        ),
                        child: Text("Details",style: ts16(grey1),),
                      ),
                      detailView("Pan Number",34343434 ),
                      detailView("GSTIN",4343434434 ),
                      detailView("Email","rameshjune28@gmail.com" ),
                      detailView("Phone Number",8787877878 ),
                      detailView("Alternative Number",8787877878 ),
                      detailView("Address","No:4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai-600095." ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                              color: th.primaryColor2,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            alignment: Alignment.center,
                            child: Text("Edit",style: ts16(Colors.white),),
                          ),
                          Container(
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.red)
                            ),
                            alignment: Alignment.center,
                            child: Text("Suspender",style: ts16(Colors.red),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: drawerOpen?width*0.54:width*0.67,
                  height: SizeConfig.screenHeight!-100,
                  /*decoration: BoxDecoration(
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
                  ),*/
                  child: Column(
                    children: [
                      //TabBar
                      Container(

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: tabWidth,
                              height: 50,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 2,
                                    child: Container(
                                        height: 1,
                                        width: tabWidth,
                                        color: grey4
                                    ),
                                  ),
                                  AnimatedPositioned(
                                    duration: animeDuration,
                                    curve: animeCurve,
                                    bottom: 0,
                                    left: leftPos,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      width: tabWidth*0.25,
                                      child: Container(
                                        height: 5,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: th.primaryColor4,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: th.primaryColor4.withOpacity(0.45),
                                                  blurRadius: 5,
                                                  spreadRadius: 0,
                                                  offset: Offset(0,2)
                                              )
                                            ]
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,

                                    child: Container(
                                      width: tabWidth,
                                      child: Row(
                                        children: [
                                        //  SizedBox(width: tabWidth*0.15,),
                                          tab(1, selectedTab==1, "PLAN DETAILS", Icons.card_travel),
                                          tab(2, selectedTab==2, "BANKING", Icons.card_travel),
                                          tab(3, selectedTab==3, "NOTIFICATIONS", Icons.card_travel),
                                          tab(4, selectedTab==4, "CONNECTIONS", Icons.card_travel),
                                         /* GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                selectedTab=1;
                                              });
                                            },
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              width: tabWidth*0.25,
                                              child: Container(
                                                height: 30,
                                                width: 150,
                                                color: Colors.transparent,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.card_travel,color: selectedTab==1?th.primaryColor3:grey3,),
                                                    SizedBox(width: 10,),
                                                    Text("PLAN DETAILS",style: TextStyle(fontFamily: 'RR',color: selectedTab==1?th.primaryColor4:grey3,fontSize: 14,letterSpacing: 0.2),)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),*/
                                        //  Spacer(),

                                      //    SizedBox(width: tabWidth*0.15,),
                                         // Spacer(),


                                        //  SizedBox(width: tabWidth*0.15,),
                                        ],
                                      ),
                                    ),
                                  )

                                ],
                              ),

                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10,),

                      //Body
                      selectedTab==1?Container(
                        color: Colors.red,
                        height: SizeConfig.screenHeight!-160,
                      ): selectedTab==2?Container(
                        color: Colors.blue,
                        height: SizeConfig.screenHeight!-160,
                      ): selectedTab==3?Container(
                        color: Colors.green,
                        height: SizeConfig.screenHeight!-160,
                      ):
                          Container(
                            height: SizeConfig.screenHeight!-160,
                            color: Colors.black54,
                          )
                    ],
                  ),

                ),

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

  activeDays(Color color,Widget icon,dynamic title,dynamic value){
    return Container(
      height: 34,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: icon,
          ),
          SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$title",style: ts16(grey3,fontfamily: 'RM'),),
              SizedBox(height: 1,),
              Text("$value",style: ts12(grey3.withOpacity(0.7)),),
            ],
          )
        ],
      ),
    );
  }
  detailView(String title,dynamic value){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 7,bottom: 7),
      //alignment: Alignment.centerLeft,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:((width*0.32)-40)*0.5,
            alignment: Alignment.centerLeft,
            child: Text("$title",style: ts16(grey1),),
          ),
          Container(
            width:((width*0.32)-40)*0.5,
            alignment: Alignment.centerLeft,
            child: Text("$value",style: ts15(grey3),),
          ),
        ],
      ),
    );
  }

  tab(int i,bool isSelect,String title,IconData iconData){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedTab=i;
        });
      },
      child: Container(
        alignment: Alignment.centerLeft,
        width: tabWidth*0.25,
        child: Container(
          height: 30,
          width: 150,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData,color: isSelect?Provider.of<ThemeNotifier>(context,listen: false).primaryColor3:grey3,),
              SizedBox(width: 10,),
              Text(title,style: TextStyle(fontFamily: 'RR',color: isSelect?Provider.of<ThemeNotifier>(context,listen: false).primaryColor4:grey3,fontSize: 14,letterSpacing: 0.2),)
            ],
          ),
        ),
      ),
    );
  }

}
