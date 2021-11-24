import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/circle.dart';
import 'package:ecommerce_admin/widgets/circleProfile.dart';
import 'package:ecommerce_admin/widgets/customCheckBox.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/linearProgressBar.dart';
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

  int selectedPlan=-1;
  int isselect=-1;

  List<GridHeaderModel> gridHeaderList=[
    GridHeaderModel(columnName: "Date",),
    GridHeaderModel(columnName: "Time",),
    GridHeaderModel(columnName: "Amount",),
    GridHeaderModel(columnName: "Plan",),
    GridHeaderModel(columnName: "Transection ID",),
  ];

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
        builder: (context,th,child)=>Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Container(
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
                            // color: Colors.green,
                            height: SizeConfig.screenHeight!-160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    planUpgradeBox(1, selectedPlan==1,"Upgrade"),
                                    planUpgradeBox(2, selectedPlan==2,"Paid"),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Billing History',style: ts18(Color(0XFF5B5B5B),fontfamily: 'RB'),),
                                ),
                                GridWithWidgetParam(
                                    headerHeight: headerHeight,
                                    headerWidth: 800,
                                    gridHeaderList: gridHeaderList,
                                    showAdd: false,
                                    showFilter: false,
                                    showSearchAll: false,
                                    showExport: false,
                                    addBtnTap: (){},
                                    filterOnTap: (i){
                                      setState(() {
                                        gridHeaderList[i].isActive=!gridHeaderList[i].isActive;
                                      });
                                    },
                                    searchFunc: (v){
                                      pn.searchCustomer(v);
                                    },
                                    headerWidget: Padding(
                                      padding:  EdgeInsets.only(top: 15),
                                      child: Row(
                                          children: [

                                            for(int i=0;i<gridHeaderList.length;i++)
                                              gridHeaderList[i].isActive? GridHeader(
                                                width: gridHeaderList[i].width,
                                                title: gridHeaderList[i].columnName,
                                                alignment: gridHeaderList[i].alignment,
                                                textAlign: gridHeaderList[i].textAlign,
                                              ):Container(),
                                          ]
                                      ),
                                    ),
                                    bodyHeight: SizeConfig.screenHeight!-510,
                                    bodyWidth: 800,
                                    bodyWidget: Padding(
                                      padding:EdgeInsets.only(top: 15),
                                      child: Column(
                                        children: pn.planDetail.asMap().map((key, value) => MapEntry(key,
                                            Container(
                                              //width: width,
                                              padding: bodyPadd,
                                              margin: bodyMargin,
                                              decoration: bodyDecoration,
                                              constraints: bodyConstraints,
                                              child: Row(
                                                children: [

                                                  gridHeaderList[0].isActive?GridContent(
                                                    width:gridHeaderList[0].width ,
                                                    alignment: gridHeaderList[0].alignment,
                                                    title: value.date,
                                                  ):Container(),
                                                  gridHeaderList[1].isActive?GridContent(
                                                    width:gridHeaderList[1].width ,
                                                    alignment: gridHeaderList[1].alignment,
                                                    title: value.time,
                                                  ):Container(),
                                                  gridHeaderList[2].isActive?GridContent(
                                                    width:gridHeaderList[2].width ,
                                                    alignment: gridHeaderList[2].alignment,
                                                    title: value.amount,
                                                  ):Container(),
                                                  gridHeaderList[3].isActive?GridContent(
                                                    width:gridHeaderList[3].width ,
                                                    alignment: gridHeaderList[3].alignment,
                                                    title: value.plan,
                                                  ):Container(),
                                                  gridHeaderList[4].isActive?GridContent(
                                                    width:gridHeaderList[4].width ,
                                                    alignment: gridHeaderList[4].alignment,
                                                    title: value.transcId,
                                                  ):Container(),
                                                  // gridHeaderList[3].isActive?Container(
                                                  //   width:gridHeaderList[3].width ,
                                                  //   alignment: gridHeaderList[3].alignment,
                                                  //   child: Row(
                                                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  //     children: [
                                                  //
                                                  //       ActionIcon(ontap: (){
                                                  //       }, imgColor: grey1, img: "assets/icons/edit.svg"),
                                                  //       ActionIcon(ontap: (){
                                                  //       }, imgColor: Colors.red, img: "assets/icons/delete.svg"),
                                                  //     ],
                                                  //   ),
                                                  // ):Container(),
                                                ],
                                              ),
                                            )
                                        )
                                        ).values.toList(),
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ): selectedTab==2?Container(
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset("assets/images/cardft.png",width:350,fit: BoxFit.cover,),
                                    Image.asset("assets/images/cardbk.png",width:350,fit: BoxFit.cover,),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                bankingdetail('Account Name', 'Ramesh'),
                                bankingdetail('Account Number', '21345678976'),
                                bankingdetail('Account Type', 'Current'),
                                bankingdetail('Bank Name', 'ICICI'),
                                bankingdetail('IFSC Code', 'ICICI01235'),
                                bankingdetail('Branch', 'Porur'),
                                SizedBox(height: 30,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
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
                                    SizedBox(width: 10,),
                                    Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: Colors.red)
                                      ),
                                      alignment: Alignment.center,
                                      child: Text("Delete",style: ts16(Colors.red),),
                                    ),
                                  ],
                                ),

                              ],
                            ) ,
                            height: SizeConfig.screenHeight!-160,
                          ): selectedTab==3?Container(
                            height: SizeConfig.screenHeight!-160,
                            child: Column(
                              children: [
                                Container(
                                  width:tabWidth*1,
                                  height: 500,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 15.0, // soften the shadow
                                        spreadRadius: 0.0, //extend the shadow
                                        offset: Offset(
                                          0.0, // Move to right 10  horizontally
                                          0.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:tabWidth*1,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(color: Color(0XFFEFEFEF)),
                                          ),
                                        ),
                                        padding: EdgeInsets.only(left: 20),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('Notifications',style: ts16(Color(0XFF7D7885),fontfamily: 'RB'),),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:tabWidth*1,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(color: Color(0XFFEFEFEF)),
                                          ),
                                        ),
                                        padding: EdgeInsets.only(left: 20),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('You will receive notification for the below selected items',style: ts14(Color(0XFF7D7885).withOpacity(0.7),fontfamily: 'RB'),),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:tabWidth*1,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(color: Color(0XFFEFEFEF)),
                                            ),
                                            color: Color(0XFFEFEFEF)
                                        ),
                                        padding: EdgeInsets.only(left: 20),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                width:tabWidth*0.30,
                                                child: Text('Type',style: ts14(Color(0XFF7D7885),fontfamily: 'RB'),)
                                            ),
                                            Container(
                                                alignment: Alignment.center,
                                                width:tabWidth*0.20,
                                                child: Text('Email',style: ts14(Color(0XFF7D7885),fontfamily: 'RB'),)
                                            ),
                                            Container(
                                                alignment: Alignment.center,
                                                width:tabWidth*0.20,
                                                child: Text('Browser',style: ts14(Color(0XFF7D7885),fontfamily: 'RB'),)
                                            ),
                                            Container(
                                                alignment: Alignment.center,
                                                width:tabWidth*0.20,
                                                child: Text('App',style: ts14(Color(0XFF7D7885),fontfamily: 'RB'),)
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:tabWidth*1,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(color: Color(0XFFEFEFEF)),
                                          ),
                                        ),
                                        padding: EdgeInsets.only(left: 20),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                width:tabWidth*0.30,
                                                child: Text('New for you',style: ts14(Color(0XFF7D7885).withOpacity(0.7),fontfamily: 'RB'),)
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width:tabWidth*0.20,
                                              child: CustomCheckBox(show: true, ontap: (){}),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width:tabWidth*0.20,
                                              child: CustomCheckBox(show: true, ontap: (){}),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width:tabWidth*0.20,
                                              child: CustomCheckBox(show: true, ontap: (){}),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: th.primaryColor2,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      alignment: Alignment.center,
                                      child: Text("Save Changes",style: ts16(Colors.white),),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: Colors.red)
                                      ),
                                      alignment: Alignment.center,
                                      child: Text("Discard",style: ts16(Colors.red),),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ):
                          Container(
                            height: SizeConfig.screenHeight!-160,
                            color: Colors.black54,
                          ),


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
        )
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

  planDetailsView(String title){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Circle(
          hei: 8,color: Colors.grey,
        ),
        Container(
          child: Text(' $title', style:ts14(Color(0XFfA19FA6))),
        )
      ],
    );
  }

  bankingdetail(String tname, String dname){
    return Container(
      width: tabWidth*0.48,
      height: 50,
      margin: EdgeInsets.only(left: 13,bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.only(left: 30),
              width: tabWidth*0.28,
              // alignment: Alignment.center,
              child: Text('$tname',style: ts18(Color(0XFF5B5B5B),fontfamily: 'RB'),)
          ),
          Container(
              width: tabWidth*0.20,
              // alignment: Alignment.center,
              child: Text('$dname',style: ts18(Color(0XFF5B5B5B),fontfamily: 'RR'),)
          ),
        ],
      ),
    );
  }

  planUpgradeBox(int i,bool isSelect ,String btnText){
    return   GestureDetector(
      onTap: (){
        setState(() {
          selectedPlan=i;
        });
      },
      child: Container(
        height: 250,
        width: tabWidth*0.48,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color:isSelect?Color(0XFF9055FD):Color(0XFFE7E7E7)),
          color:Colors.white,
        ),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment:CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color:Color(0XFFF2EAFE),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: 5.0,right: 5.0,top: 2,bottom: 2),
                    child: Text("Standard", style: TextStyle(color: Color(0XFF9055FD),fontSize: 10)),
                  ),
                ),
                Container(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.grey,),
                      children: <TextSpan>[
                        TextSpan(text: '₹ ', style: TextStyle(color: Color(0XFF9055FD),fontSize: 26)),
                        TextSpan(text: '2000 ',style: TextStyle(color: Color(0XFF9055FD),fontSize: 36)),
                        TextSpan(text: '/ month', style: TextStyle( fontSize: 26))
                      ],
                    ),
                    textScaleFactor: 0.5,
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            planDetailsView('10 Users'),
            SizedBox(height: 5,),
            planDetailsView('Up to 10GB Storage'),
            SizedBox(height: 5,),
            planDetailsView('Basic Support'),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text('Days',style: ts14(Color(0XFF908D98),fontfamily: 'RB'),),
                ),
                Container(
                  child: Text('26 of 30 Days',style: ts14(Color(0XFF908D98),fontfamily: 'RB'),),
                )
              ],
            ),
            SizedBox(height: 10,),
            LinearPercentIndicator(
              trailing: Container(),
              leading: Container(),
              animation: true,
              percent: 0.7,
              backgroundColor:Provider.of<ThemeNotifier>(context,listen: false).
              primaryColor2.withOpacity(0.2),
              progressColor: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
              padding: EdgeInsets.only(left: 0),
              lineHeight: 7,
            ),
            SizedBox(height: 10,),
            Container(
              child: Text('4 days remaining',style: ts14(Color(0XFF908D98),fontfamily: 'RB'),),
            ),
            SizedBox(height: 10,),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color:isSelect?Provider.of<ThemeNotifier>(context,listen: false).primaryColor2:Color(0XFFE7E7E7),
              ),
              alignment: Alignment.center,
              child: Text("$btnText", style: ts14(isSelect?Color(0XFFFFFFFF):Color(0XFF6B6B6B),fontfamily: 'RB')),
            ),
          ],
        ),
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
