import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/pages/payment/paymentAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridFooter.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';
class PaymentGrid extends StatefulWidget {
  const PaymentGrid({Key? key}) : super(key: key);

  @override
  _PaymentGridState createState() => _PaymentGridState();
}

class _PaymentGridState extends State<PaymentGrid> {
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
      pageController.animateToPage(0, duration: animeDuration, curve: animeCurve);
    }
    else if(value==1){
      setState(() {
        position=tabWidth*0.33;
      });
      pageController.animateToPage(1, duration: animeDuration, curve: animeCurve);
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
    GridHeaderModel(columnName: "Payment No",),
    GridHeaderModel(columnName: "Received On",),
    GridHeaderModel(columnName: "Customer Name",width: 200),
    GridHeaderModel(columnName: "Gross Amount",),
    GridHeaderModel(columnName: "Received Amount",),
    GridHeaderModel(columnName: "Balance Amount",),
    GridHeaderModel(columnName: "Payment Status",width: 180),
    GridHeaderModel(columnName: "Actions",width: 100),
  ];

  List<GridHeaderModel> gridHeaderList2=[
    GridHeaderModel(columnName: "Payment No",),
    GridHeaderModel(columnName: "Received On",),
    GridHeaderModel(columnName: "Customer Name",width: 200),
    GridHeaderModel(columnName: "Gross Amount",),
    GridHeaderModel(columnName: "Paid Amount",),
    GridHeaderModel(columnName: "Balance Amount",),
    GridHeaderModel(columnName: "Payment Status",width: 180),
    GridHeaderModel(columnName: "Actions",width: 100),
  ];



  PageController pageController=new PageController(initialPage: 0);



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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

                                    child: Text("Receivable Payment",style: TextStyle(fontFamily: 'RR',fontSize: 20,color: selectedTab==0?Colors.white:Colors.grey),)

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
                                    child: Text("Payable Payment",style: TextStyle(fontFamily: 'RR',fontSize: 20,color: selectedTab==1?Colors.white:Colors.grey),)
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  /* selectedTab==0?GridWithWidgetParam(
                      headerHeight: headerHeight,
                      headerWidth: width,
                      gridHeaderList: gridHeaderList,
                      showAdd: true,
                      showFilter: true,
                      showExport: true,
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
                      bodyWidth: width,
                      bodyWidget: Padding(
                        padding:EdgeInsets.only(top: 15),
                        child: Column(
                          children: pn.recInv.asMap().map((key, value) => MapEntry(key,
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
                                      title: value.invNo,
                                    ):Container(),
                                    gridHeaderList[1].isActive?GridContent(
                                      width:gridHeaderList[1].width ,
                                      alignment: gridHeaderList[1].alignment,
                                      title: value.date,
                                    ):Container(),
                                    gridHeaderList[2].isActive?GridContent(
                                      width:gridHeaderList[2].width ,
                                      alignment: gridHeaderList[2].alignment,
                                      title: value.customerName,
                                    ):Container(),
                                    gridHeaderList[3].isActive?GridContent(
                                      width:gridHeaderList[3].width ,
                                      alignment: gridHeaderList[3].alignment,
                                      title: value.grossAmount,
                                    ):Container(),
                                    gridHeaderList[4].isActive?GridContent(
                                      width:gridHeaderList[4].width ,
                                      alignment: gridHeaderList[4].alignment,
                                      title: value.paymentStatus,
                                    ):Container(),
                                    gridHeaderList[5].isActive?Container(
                                      width:gridHeaderList[5].width ,
                                      alignment: gridHeaderList[5].alignment,
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
                      headerWidth: width,
                      gridHeaderList: gridHeaderList2,
                      showAdd: true,
                      showFilter: true,
                      showExport: true,
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
                        padding:  EdgeInsets.only(top: 15),
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
                      bodyHeight: SizeConfig.screenHeight!-400,
                      bodyWidth: width,
                      bodyWidget: Padding(
                        padding:EdgeInsets.only(top: 15),
                        child: Column(
                          children: pn.payInv.asMap().map((key, value) => MapEntry(key,
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
                                      title: value.invNo,
                                    ):Container(),
                                    gridHeaderList2[1].isActive?GridContent(
                                      width:gridHeaderList2[1].width ,
                                      alignment: gridHeaderList2[1].alignment,
                                      title: value.date,
                                    ):Container(),
                                    gridHeaderList2[2].isActive?GridContent(
                                      width:gridHeaderList2[2].width ,
                                      alignment: gridHeaderList2[2].alignment,
                                      title: value.customerName,
                                    ):Container(),
                                    gridHeaderList2[3].isActive?GridContent(
                                      width:gridHeaderList2[3].width ,
                                      alignment: gridHeaderList2[3].alignment,
                                      title: value.grossAmount,
                                    ):Container(),
                                    gridHeaderList2[4].isActive?GridContent(
                                      width:gridHeaderList2[4].width ,
                                      alignment: gridHeaderList2[4].alignment,
                                      title: value.paymentStatus,
                                    ):Container(),
                                    gridHeaderList2[5].isActive?Container(
                                      width:gridHeaderList2[5].width ,
                                      alignment: gridHeaderList2[5].alignment,
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
                  ),*/
                  Container(
                    height: (SizeConfig.screenHeight!-gridReduceHei-20),
                    width: width,
                    child: PageView(
                      controller: pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        AnimatedOpacity(
                            duration:Duration(milliseconds: 500),
                            opacity: 1,
                            child: GridWithWidgetParam(
                                headerHeight: headerHeight,
                                headerWidth: width,
                                gridHeaderList: gridHeaderList,
                                showAdd: true,
                                showFilter: true,
                                showExport: true,
                                addBtnTap: (){
                                  Navigator.push(context, pr.PageRoute().fade(PaymentAddNew(isPayable: false,)));
                                },
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
                                bodyWidth: width,
                                bodyWidget: Padding(
                                  padding:EdgeInsets.only(top: 15),
                                  child: Column(
                                    children: pn.revPayMent.asMap().map((key, value) => MapEntry(key,
                                        Container(
                                          //width: width,
                                          padding: bodyPadd,
                                          margin: bodyMargin,
                                          decoration: bodyDecoration,
                                          constraints: bodyConstraints,
                                          child: Row(
                                            children: [

                                              gridHeaderList[0].isActive?Container(
                                                width:gridHeaderList[0].width ,
                                                alignment: gridHeaderList[0].alignment,
                                                // margin:  EdgeInsets.only(left: 10),
                                                padding:  EdgeInsets.only(left: 10),

                                                child: Container(
                                                    padding:  EdgeInsets.only(left: 12,right: 12,top: 3,bottom: 3),
                                                    decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius: BorderRadius.circular(50),
                                                    ),
                                                    child: Text("${value.payNo}",style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: 'RR'),)
                                                ),
                                              ):Container(),
                                              gridHeaderList[1].isActive?GridContent(
                                                width:gridHeaderList[1].width ,
                                                alignment: gridHeaderList[1].alignment,
                                                title: value.date,
                                              ):Container(),
                                              gridHeaderList[2].isActive?GridContent(
                                                width:gridHeaderList[2].width ,
                                                alignment: gridHeaderList[2].alignment,
                                                title: value.customerName,
                                              ):Container(),
                                              gridHeaderList[3].isActive?GridContent(
                                                width:gridHeaderList[3].width ,
                                                alignment: gridHeaderList[3].alignment,
                                                title: value.grossAmount,
                                              ):Container(),
                                              gridHeaderList[4].isActive?GridContent(
                                                width:gridHeaderList[4].width ,
                                                alignment: gridHeaderList[4].alignment,
                                                title: value.receivedOrPaidAmount,
                                              ):Container(),
                                              gridHeaderList[5].isActive?GridContent(
                                                width:gridHeaderList[5].width ,
                                                alignment: gridHeaderList[5].alignment,
                                                title: value.balanceAmount,
                                              ):Container(),
                                              gridHeaderList[6].isActive?GridContent(
                                                width:gridHeaderList[6].width ,
                                                alignment: gridHeaderList[6].alignment,
                                                title: value.paymentStatus,
                                              ):Container(),
                                              gridHeaderList[7].isActive?Container(
                                                width:gridHeaderList[7].width ,
                                                alignment: gridHeaderList[7].alignment,
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
                            )
                        ),
                        AnimatedOpacity(
                            duration:Duration(milliseconds: 500),
                            opacity: 1,
                            child: GridWithWidgetParam(
                                headerHeight: headerHeight,
                                headerWidth: width,
                                gridHeaderList: gridHeaderList2,
                                showAdd: true,
                                showFilter: true,
                                showExport: true,
                                addBtnTap: (){
                                  Navigator.push(context, pr.PageRoute().slideFromLeftToRight(PaymentAddNew(isPayable: true,)));
                                },
                                filterOnTap: (i){
                                  setState(() {
                                    gridHeaderList2[i].isActive=!gridHeaderList2[i].isActive;
                                  });
                                },
                                searchFunc: (v){
                                  pn.searchCustomer(v);
                                },
                                headerWidget: Padding(
                                  padding:  EdgeInsets.only(top: 15),
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
                                bodyHeight: SizeConfig.screenHeight!-400,
                                bodyWidth: width,
                                bodyWidget: Padding(
                                  padding:EdgeInsets.only(top: 15),
                                  child: Column(
                                    children: pn.payPayMent.asMap().map((key, value) => MapEntry(key,
                                        Container(
                                          //width: width,
                                          padding: bodyPadd,
                                          margin: bodyMargin,
                                          decoration: bodyDecoration,
                                          constraints: bodyConstraints,
                                          child: Row(
                                            children: [

                                              gridHeaderList2[0].isActive?Container(
                                                width:gridHeaderList2[0].width ,
                                                alignment: gridHeaderList2[0].alignment,
                                                // margin:  EdgeInsets.only(left: 10),
                                                padding:  EdgeInsets.only(left: 10),

                                                child: Container(
                                                    padding:  EdgeInsets.only(left: 12,right: 12,top: 3,bottom: 3),
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius: BorderRadius.circular(50),
                                                    ),
                                                    child: Text("${value.payNo}",style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: 'RR'),)
                                                ),
                                              ):Container(),
                                              gridHeaderList2[1].isActive?GridContent(
                                                width:gridHeaderList2[1].width ,
                                                alignment: gridHeaderList2[1].alignment,
                                                title: value.date,
                                              ):Container(),
                                              gridHeaderList2[2].isActive?GridContent(
                                                width:gridHeaderList2[2].width ,
                                                alignment: gridHeaderList2[2].alignment,
                                                title: value.customerName,
                                              ):Container(),
                                              gridHeaderList2[3].isActive?GridContent(
                                                width:gridHeaderList2[3].width ,
                                                alignment: gridHeaderList2[3].alignment,
                                                title: value.grossAmount,
                                              ):Container(),
                                              gridHeaderList2[4].isActive?GridContent(
                                                width:gridHeaderList2[4].width ,
                                                alignment: gridHeaderList2[4].alignment,
                                                title: value.receivedOrPaidAmount,
                                              ):Container(),
                                              gridHeaderList2[5].isActive?GridContent(
                                                width:gridHeaderList2[5].width ,
                                                alignment: gridHeaderList2[5].alignment,
                                                title: value.balanceAmount,
                                              ):Container(),
                                              gridHeaderList2[6].isActive?GridContent(
                                                width:gridHeaderList2[6].width ,
                                                alignment: gridHeaderList2[6].alignment,
                                                title: value.paymentStatus,
                                              ):Container(),
                                              gridHeaderList2[7].isActive?Container(
                                                width:gridHeaderList2[7].width ,
                                                alignment: gridHeaderList2[7].alignment,
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
                            )
                        ),

                      ],
                    ),
                  ),

                  GridFooter(
                      width: width-70,
                      perPage: pn.perPage,
                      currentPage: pn.currentPage+1,
                      prev: (){
                        pn.prev();
                      },
                      next: (){
                        pn.next();
                      },
                      ontap: (i){
                        setState(() {
                          pn.perPage=i;
                        });
                        pn.init(true);
                      }
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
