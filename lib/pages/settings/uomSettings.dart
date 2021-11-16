import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';
class UOMSettings extends StatefulWidget {
  const UOMSettings({Key? key}) : super(key: key);

  @override
  _UOMSettingsState createState() => _UOMSettingsState();
}

class _UOMSettingsState extends State<UOMSettings> {
  late double width,tabWidth,hei=60;
  double position=0;
  int selectedTab=0;


  void updateSelectedTab(int value){
    selectedTab=value;
    if(value==0){
      setState(() {
        position=0;
      });

    }else if(value==1){
      setState(() {
        position=tabWidth*0.33;
      });

    }else if(value==2){
      setState(() {
        position=(tabWidth*0.33)*2;
      });

    }
  }

  List<String> units=["BT","CS","LI","KG"];
  String selectedFromUnit="";
  String selectedToUnit="";


  List<GridHeaderModel> gridHeaderList=[
    GridHeaderModel(columnName: "Mnemonic",),
    GridHeaderModel(columnName: "Description",width: 200),
    GridHeaderModel(columnName: "Actions",width: 100),
  ];

  List<GridHeaderModel> gridHeaderList2=[
    GridHeaderModel(columnName: "Unit Name",),
    GridHeaderModel(columnName: "From Unit",),
    GridHeaderModel(columnName: "To Unit",),
    GridHeaderModel(columnName: "Actions",width: 100),
  ];



  @override
  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-100;
    tabWidth=SizeConfig.screenWidth!-140;
    final node=FocusScope.of(context);
    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=>Consumer<ProductNotifier>(
        builder: (context,pn,child)=>  Stack(
          children: [
            Container(
              height: SizeConfig.screenHeight!-appBarHei,
              width: width,
              color: bgColor,
              padding: bodyPadding,
              child:Column(
                children: [
                  Container(

                    height: hei,
                    width: tabWidth*0.66,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Color(0xFFE6E6E6)
                    ),
                    child: Stack(
                      children: [

                        AnimatedPositioned(
                          left: position,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                          child: Container(
                            width: tabWidth*0.33,
                            height: hei,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: th.primaryColor3,
                              boxShadow: [
                                BoxShadow(
                                  color: th.primaryColor3.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 8), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),


                        Row(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap:(){
                               // epn.updatePageViewController(0);
                                updateSelectedTab(0);
                                //    epn.GetExcludeProductsDbHit(context, "Product");

                              },
                              child: Container(
                                width: tabWidth*0.33,
                                height: hei,
                                child: Center(

                                    child: Text("UOM",style: TextStyle(fontFamily: 'RR',fontSize: 20,color: selectedTab==0?Colors.white:Colors.grey),)

                                ),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap:(){

                                updateSelectedTab(1);

                              },
                              child: Container(
                                width: tabWidth*0.33,
                                height: hei,

                                child: Center(
                                    child: Text("Conversion",style: TextStyle(fontFamily: 'RR',fontSize: 20,color: selectedTab==1?Colors.white:Colors.grey),)
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  selectedTab==0?Container(
                   margin: EdgeInsets.only(top: 20,bottom: 50),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       AddNewLabelTextField(
                         width:250,
                         margin: EdgeInsets.only(left: 0),
                         hintText: "Mnemonic",
                         onChange: (v){},
                         onEditComplete: (){
                           node.unfocus();
                         },
                       ),
                       AddNewLabelTextField(
                         width:250,
                         margin: EdgeInsets.only(left: 40),
                         hintText: "Description",
                         onChange: (v){},
                         onEditComplete: (){
                           node.unfocus();
                         },
                       ),
                     ],
                   ),
                 ):
                  Column(

                    children: [
                      AddNewLabelTextField(
                        width:550,
                        margin: EdgeInsets.only(top: 40,bottom: 20),
                        hintText: "Unit Name",
                        onChange: (v){},
                        onEditComplete: (){
                          node.unfocus();
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomPopup(
                            data: units,
                            selectedValue: selectedFromUnit,
                            hintText: "Selct From Unit",
                            width: 170,
                            color: Colors.white,
                            onSelect: (v){
                              setState(() {
                                selectedFromUnit=v;
                              });
                            },
                           edgeInsets: EdgeInsets.only(left: 0),
                            leftMargin: 0,
                          ),
                          CustomPopup(
                            data: units,
                            selectedValue: selectedToUnit,
                            hintText: "Selct To Unit",
                            width: 170,
                            color: Colors.white,
                            onSelect: (v){
                              setState(() {
                                selectedToUnit=v;
                              });
                            },
                          ),
                          AddNewLabelTextField(
                            width:170,
                            margin: EdgeInsets.only(left: 20),
                            hintText: "",
                            onChange: (v){},
                            onEditComplete: (){
                              node.unfocus();
                            },
                            textInputType: TextInputType.number,
                            regExp: digitRegEx,
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Container(
                        width:550,
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: 'Result: ',
                            style: ts18(Colors.red),
                            children: <TextSpan>[
                              TextSpan(text: '1 Case = 12 Bottles', style: ts16(grey1)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                  selectedTab==1?GridWithWidgetParam(
                      headerHeight: headerHeight,
                      headerWidth: 600,
                      gridHeaderList: gridHeaderList2,
                      showAdd: false,
                      showFilter: false,
                      showExport: false,
                      addBtnTap: (){},
                      filterOnTap: (i){
                        setState(() {
                          gridHeaderList2[i].isActive=!gridHeaderList2[i].isActive;
                        });
                      },
                      searchFunc: (v){
                        pn.searchCustomer(v);
                      },
                      headerWidget: Padding(
                        padding:  EdgeInsets.only(top: 5),
                        child: Row(
                            children: [

                              for(int i=0;i<gridHeaderList2.length;i++)
                                gridHeaderList2[i].isActive? GridHeader(
                                  width: gridHeaderList2[i].width,
                                  title: gridHeaderList2[i].columnName,
                                  alignment: gridHeaderList2[i].alignment,
                                  textAlign: gridHeaderList2[i].textAlign,
                                ):Container(),
                            ]
                        ),
                      ),
                      bodyHeight: SizeConfig.screenHeight!-500,
                      bodyWidth: 600,
                      bodyWidget: Padding(
                        padding:EdgeInsets.only(top: 5),
                        child: Column(
                          children: pn.conversionList.asMap().map((key, value) => MapEntry(key,
                              Container(
                                //width: width,
                                padding: bodyPadd,
                                margin: bodyMargin,
                                decoration: bodyDecoration,
                                constraints: bodyConstraints,
                                child: Row(
                                  children: [

                                    gridHeaderList2[0].isActive?GridContent(
                                      width:gridHeaderList2[0].width ,
                                      alignment: gridHeaderList2[0].alignment,
                                      title: value.unitName,
                                    ):Container(),
                                    gridHeaderList2[1].isActive?GridContent(
                                      width:gridHeaderList2[1].width ,
                                      alignment: gridHeaderList2[1].alignment,
                                      title: value.fromUnit,
                                    ):Container(),
                                    gridHeaderList2[2].isActive?GridContent(
                                      width:gridHeaderList2[2].width ,
                                      alignment: gridHeaderList2[2].alignment,
                                      title: value.toUnit,
                                    ):Container(),

                                    gridHeaderList2[3].isActive?Container(
                                      width:gridHeaderList2[3].width ,
                                      alignment: gridHeaderList2[3].alignment,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [

                                          ActionIcon(ontap: (){
                                          }, imgColor: grey1, img: "assets/icons/edit.svg"),
                                          ActionIcon(ontap: (){
                                          }, imgColor: Colors.red, img: "assets/icons/delete.svg"),
                                        ],
                                      ),
                                    ):Container(),
                                  ],
                                ),
                              )
                          )
                          ).values.toList(),
                        ),
                      )
                  ):GridWithWidgetParam(
                      headerHeight: headerHeight,
                      headerWidth: 600,
                      gridHeaderList: gridHeaderList,
                      showAdd: false,
                      showFilter: false,
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
                      bodyHeight: SizeConfig.screenHeight!-400,
                      bodyWidth: 600,
                      bodyWidget: Padding(
                        padding:EdgeInsets.only(top: 15),
                        child: Column(
                          children: pn.uomList.asMap().map((key, value) => MapEntry(key,
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
                                      title: value.mnemonic,
                                    ):Container(),
                                    gridHeaderList[1].isActive?GridContent(
                                      width:gridHeaderList[1].width ,
                                      alignment: gridHeaderList[1].alignment,
                                      title: value.description,
                                    ):Container(),

                                    gridHeaderList[2].isActive?Container(
                                      width:gridHeaderList[2].width ,
                                      alignment: gridHeaderList[2].alignment,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [

                                          ActionIcon(ontap: (){
                                          }, imgColor: grey1, img: "assets/icons/edit.svg"),
                                          ActionIcon(ontap: (){
                                          }, imgColor: Colors.red, img: "assets/icons/delete.svg"),
                                        ],
                                      ),
                                    ):Container(),
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
            ),
          ],
        ),
      ),
    );
  }


}
