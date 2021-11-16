import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';
class TaxesGroups extends StatefulWidget {
  const TaxesGroups({Key? key}) : super(key: key);

  @override
  _TaxesGroupsState createState() => _TaxesGroupsState();
}

class _TaxesGroupsState extends State<TaxesGroups> {
  late double width,tabWidth,hei=60;
  double position=0;
  int selectedTab=0;

  bool showTaxesDropDown=false;


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

  List<String> units=["GST(2.5%)","CGST(2.5%)","GST(2.5%)","CGST(2.5%)"];
  String selectedFromUnit="";
  String selectedToUnit="";


  List<GridHeaderModel> gridHeaderList=[
    GridHeaderModel(columnName: "S.no",),
    GridHeaderModel(columnName: "Taxes",width: 200),
    GridHeaderModel(columnName: "Percentage",width: 200),
    GridHeaderModel(columnName: "Actions",width: 100),
  ];

  List<GridHeaderModel> gridHeaderList2=[
    GridHeaderModel(columnName: "S.no",),
    GridHeaderModel(columnName: "Taxes",),
    GridHeaderModel(columnName: "Percentage",),
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

                                    child: Text("Taxes",style: TextStyle(fontFamily: 'RR',fontSize: 20,color: selectedTab==0?Colors.white:Colors.grey),)

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
                                    child: Text("Group Taxes",style: TextStyle(fontFamily: 'RR',fontSize: 20,color: selectedTab==1?Colors.white:Colors.grey),)
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
                          hintText: "Name",
                          onChange: (v){},
                          onEditComplete: (){
                            node.unfocus();
                          },
                        ),
                        AddNewLabelTextField(
                          width:250,
                          margin: EdgeInsets.only(left: 40),
                          hintText: "Percent",
                          onChange: (v){},
                          onEditComplete: (){
                            node.unfocus();
                          },
                        ),
                      ],
                    ),
                  ):
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddNewLabelTextField(
                        width:550,
                        margin: EdgeInsets.only(top: 40,bottom: 10),
                        hintText: "Name",
                        onChange: (v){},
                        onEditComplete: (){
                          node.unfocus();
                        },
                      ),
                      Container(
                        width:550,
                        alignment: Alignment.centerLeft,
                        child: OverLayPopUp(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          ontap: (){
                            setState(() {
                              showTaxesDropDown=!showTaxesDropDown;
                            });
                          },
                          width: 570,
                          hinttext: "Select Taxes",
                          selectedValue: selectedFromUnit,
                          showPopUp: showTaxesDropDown,
                          data: units,

                          onitemTap: (i){
                            setState(() {
                              showTaxesDropDown=false;
                              selectedFromUnit=units[i];
                            });
                          },
                          isToJson: false,
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
                      bodyHeight: SizeConfig.screenHeight!-470,
                      bodyWidth: 600,
                      bodyWidget: Padding(
                        padding:EdgeInsets.only(top: 5),
                        child: Column(
                          children: pn.groupTaxes.asMap().map((key, value) => MapEntry(key,
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
                                      title: value.sNo,
                                    ):Container(),
                                    gridHeaderList2[1].isActive?GridContent(
                                      width:gridHeaderList2[1].width ,
                                      alignment: gridHeaderList2[1].alignment,
                                      title: value.name,
                                    ):Container(),
                                    gridHeaderList2[2].isActive?GridContent(
                                      width:gridHeaderList2[2].width ,
                                      alignment: gridHeaderList2[2].alignment,
                                      title: value.percent,
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
                  ):
                  GridWithWidgetParam(
                      headerHeight: headerHeight,
                      headerWidth: 800,
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
                      bodyWidth: 800,
                      bodyWidget: Padding(
                        padding:EdgeInsets.only(top: 15),
                        child: Column(
                          children: pn.taxes.asMap().map((key, value) => MapEntry(key,
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
                                      title: value.sNo,
                                    ):Container(),
                                    gridHeaderList[1].isActive?GridContent(
                                      width:gridHeaderList[1].width ,
                                      alignment: gridHeaderList[1].alignment,
                                      title: value.name,
                                    ):Container(),
                                    gridHeaderList[2].isActive?GridContent(
                                      width:gridHeaderList[2].width ,
                                      alignment: gridHeaderList[2].alignment,
                                      title: value.percent,
                                    ):Container(),
                                    gridHeaderList[3].isActive?Container(
                                      width:gridHeaderList[3].width ,
                                      alignment: gridHeaderList[3].alignment,
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
