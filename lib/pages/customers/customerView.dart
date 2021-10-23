import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/customers/customerOrderView.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/circleProgressBar.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridFooter.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/linearProgressBar.dart';
import 'package:scutiwidgets/size.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import '../../constants.dart';


class CustomerView extends StatefulWidget {
  const CustomerView({Key? key}) : super(key: key);

  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  late double width;
  double width1=370;
  BoxDecoration decoration=BoxDecoration(
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
  );

  List<GridHeaderModel> gridHeaderList=[
    GridHeaderModel(columnName: "Id",),
    GridHeaderModel(columnName: "Item",width: 200),
    GridHeaderModel(columnName: "Payment Info",width: 200),
    GridHeaderModel(columnName: "Order Date",),
    GridHeaderModel(columnName: "Price",),
    GridHeaderModel(columnName: "Actions",width: 100,alignment: Alignment.center),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    width=SizeConfig.screenWidth!-140;
    return Scaffold(
      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>Consumer<ProductNotifier>(
      builder: (context,pn,child)=>  Container(
          height: SizeConfig.screenHeight!,
          width: SizeConfig.screenWidth,
          color: bgColor,
          //padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              Container(
                height: 50,
                color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,
                child: Row(
                  children: [
                    BackBtn(ontap: (){
                      Navigator.pop(context);
                    }),
                    Text("Customer Detail",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                     width: width1,
                     height: SizeConfig.screenHeight!-70,
                     child: Theme(
                       data: glowTransparent(context),
                       child: ListView(
                         children: [
                           Container(
                             width: width1,
                             //  height: SizeConfig.screenHeight!-70,
                             decoration: decoration,
                             child: Column(
                               children: [
                                 SizedBox(height: 15,),
                                 Container(
                                     padding:  EdgeInsets.only(left: 20),
                                     alignment: Alignment.centerLeft,
                                     child: Text("Profile",style: ts18(grey1,fontfamily: 'RM'),)
                                 ),
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
                                 Text("ID: 45454",style: ts14(grey3.withOpacity(0.8)),),
                                 SizedBox(height: 7,),
                                 Text("Mr.Ramesh",style: TextStyle(fontFamily: 'RR',color: grey3,fontSize: 16,letterSpacing: 0.2),),
                                 SizedBox(height: 10,),
                                 profileView(Icon(Icons.phone,size: 20,), "8787877878"),
                                 profileView(Icon(Icons.mail,size: 20,), "rameshjune28@gmail.com"),
                                 profileView(Icon(Icons.book,size: 20,),
                                     "No:4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai-600095.",
                                     crossAxisAlignment: CrossAxisAlignment.start
                                 ),
                                 SizedBox(height: 15,),
                               ],
                             ),
                           ),
                           SizedBox(height: 20,),
                           Container(
                             width: width1,
                             //  height: SizeConfig.screenHeight!-70,
                             decoration:decoration,
                             child: Column(
                               children: [
                                 SizedBox(height: 15,),
                                 Container(
                                     padding:  EdgeInsets.only(left: 20,bottom: 20),
                                     alignment: Alignment.centerLeft,
                                     child: Text("Expense Count",style: ts18(grey1,fontfamily: 'RM'),)
                                 ),
                                 Container(
                                   height: 100,
                                   child: CircleProgressBar(
                                     extraStrokeWidth: 1,
                                     innerStrokeWidth: 8,
                                     backgroundColor: Colors.grey[200],
                                     foregroundColor:th.primaryColor2,
                                     value: 1,
                                     center: Container(
                                       height: 80,
                                       width: 80,
                                       margin: EdgeInsets.all(0),
                                       alignment: Alignment.center,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         color: Colors.transparent,
                                         boxShadow: [

                                         ],
                                       ),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Text("Exp Spend",style: ts12(grey2),),
                                           SizedBox(height: 3,),
                                           Text("76",style: ts18(grey2,fontfamily: 'RR',fontsize: 22),),
                                         ],
                                       ),
                                       //child: Text("50%",textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF7D7D7D),fontFamily: 'RB'),)
                                     ),
                                   ),
                                 ),
                                 SizedBox(height: 20,),
                                 Row(
                                   children: [
                                     SizedBox(width: 20,),
                                     expenseCount("Food", "545 spend", Color(0xFFF7D46D), 0.4),
                                     expenseCount("Cloth", "545 spend", Colors.deepPurple, 0.4),
                                     expenseCount("Other", "545 spend", Colors.purpleAccent, 0.4),
                                   ],
                                 ),
                                 SizedBox(height: 20,),

                               ],
                             ),
                           ),
                           SizedBox(height: 20,),
                           Container(
                             width: width1,
                             //  height: SizeConfig.screenHeight!-70,
                             decoration:decoration,
                             child: Column(
                               children: [
                                 SizedBox(height: 15,),
                                 Container(
                                     padding:  EdgeInsets.only(left: 20,bottom: 20),
                                     alignment: Alignment.centerLeft,
                                     child: Text("Status Report",style: ts18(grey1,fontfamily: 'RM'),)
                                 ),
                                 statusReport("Product Visit", 54, 0.6, Colors.green),
                                 statusReport("Product Buy", 27, 0.3, Colors.cyan),
                                 statusReport("Comments on Product", 102, 0.7, Colors.deepPurpleAccent),
                                 statusReport("Wish List", 36, 0.4, Colors.lime),
                                 statusReport("Total Spent Time", "1024 Hours", 0.9, Colors.red),

                                 SizedBox(height: 5,),
                               ],
                             ),
                           ),
                           SizedBox(height: 20,),
                         ],
                       ),
                     ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth!-width1-60,
                      height: SizeConfig.screenHeight!-70,
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: width1,
                                height: 230,
                                decoration: decoration,
                                child: Column(
                                  children: [
                                    SizedBox(height: 15,),
                                    Container(
                                        padding:  EdgeInsets.only(left: 20,bottom: 20),
                                        alignment: Alignment.centerLeft,
                                        child: Text("Delivery Address",style: ts18(grey1,fontfamily: 'RM'),)
                                    ),
                                    detailView("Address:",
                                        "No:4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai-600095.",
                                    ),
                                    detailView("Pincode:", "625603"),
                                    detailView("Phone No:", "8787877878"),
                                    SizedBox(height: 15,),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                width: width1,
                                height: 230,
                                decoration: decoration,
                                child: Column(
                                  children: [
                                    SizedBox(height: 15,),
                                    Container(
                                        padding:  EdgeInsets.only(left: 20,bottom: 20),
                                        alignment: Alignment.centerLeft,
                                        child: Text("Shipping Address",style: ts18(grey1,fontfamily: 'RM'),)
                                    ),
                                    detailView("Address:",
                                        "No:4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai-600095.",
                                    ),
                                    detailView("Pincode:", "625603"),
                                    detailView("Phone No:", "8787877878"),
                                    SizedBox(height: 15,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height:SizeConfig.screenHeight!-340,
                            width: SizeConfig.screenWidth!-width1-60,
                            decoration: decoration,
                            child: Column(
                              children: [
                                Container(
                                    padding:  EdgeInsets.only(left: 20,top: 15),
                                    alignment: Alignment.centerLeft,
                                    child: Text("Customer Order",style: ts18(grey1,fontfamily: 'RM'),)
                                ),
                                GridWithWidgetParam(
                                    headerHeight: headerHeight,
                                    headerWidth:  SizeConfig.screenWidth!-width1-70,
                                    gridHeaderList: gridHeaderList,
                                    searchBg: bgColor,

                                    addBtnTap: (){},
                                    filterOnTap: (i){
                                      setState(() {
                                        gridHeaderList[i].isActive=!gridHeaderList[i].isActive;
                                      });
                                    },
                                    searchFunc: (v){
                                      pn.searchCustomer(v);
                                    },
                                    headerWidget: Row(
                                        children: [

                                          for(int i=0;i<gridHeaderList.length;i++)
                                            gridHeaderList[i].isActive? GridHeader(
                                              width: gridHeaderList[i].width,
                                              title: gridHeaderList[i].columnName,
                                              alignment: gridHeaderList[i].alignment,
                                            ):Container(),
                                        ]
                                    ),

                                    bodyHeight: SizeConfig.screenHeight!-550,
                                    bodyWidth:  SizeConfig.screenWidth!-width1-70,
                                    bodyWidget: Padding(
                                      padding: EdgeInsets.only(left: 5,right: 5),
                                      child: Column(
                                        children: pn.customerOrders.asMap().map((key, value) => MapEntry(key,
                                            Container(
                                              //width: width,
                                              padding: EdgeInsets.only(top: 10,bottom: 10),
                                              margin: EdgeInsets.only(bottom: 5,),
                                              decoration: BoxDecoration(
                                                color: bgColor,
                                                borderRadius: BorderRadius.circular(7),
                                              ),
                                              constraints: bodyConstraints,
                                              child: Row(
                                                children: [
                                                  gridHeaderList[0].isActive?GridContent(
                                                    width: 150,
                                                    title: value.id,
                                                  ):Container(),
                                                  gridHeaderList[1].isActive?GridContent(
                                                    width: 200,
                                                    title: value.item,
                                                  ):Container(),
                                                  gridHeaderList[2].isActive?GridContent(
                                                    width: 200,
                                                    title: value.paymentInfo,
                                                  ):Container(),
                                                  gridHeaderList[3].isActive?GridContent(
                                                    width: 150,
                                                    title:value.orderedDate,
                                                  ):Container(),
                                                  gridHeaderList[4].isActive?GridContent(
                                                    width: 150,
                                                    title: value.price,
                                                  ):Container(),

                                                  gridHeaderList[5].isActive?Container(
                                                    width: 100,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        AddBtn(
                                                          ontap: (){
                                                            Navigator.push(context, pr.PageRoute().fade(CustomerOrderView()));
                                                          },
                                                          color: Colors.transparent,
                                                          hei: 30,
                                                          margin: EdgeInsets.only(left: 0),
                                                          widget: Icon(Icons.visibility,color: Colors.grey,size: 30,),
                                                        ),
                                                        // ActionIcon(ontap: (){
                                                        // }, imgColor: Colors.red, img: "assets/icons/delete.svg"),
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
                                GridFooter(
                                    width: SizeConfig.screenWidth!-width1-60-70,
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
                          SizedBox(height: 20,),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
       )
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
            width:((width1)-40)*0.5,
            alignment: Alignment.centerLeft,
            child: Text("$title",style: ts16(grey1),),
          ),
          Container(
            width:((width1)-40)*0.5,
            alignment: Alignment.centerLeft,
            child: Text("$value",style: ts15(grey3),),
          ),
        ],
      ),
    );
  }
  profileView(Widget leading,dynamic value,{CrossAxisAlignment crossAxisAlignment= CrossAxisAlignment.center}){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 7,bottom: 7),
      child: Row(
        crossAxisAlignment:crossAxisAlignment,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: leading
          ),
          Spacer(),
          Container(
            width:((width1)-80),
            alignment: Alignment.centerLeft,
            child: Text("$value",style: ts15(grey3),),
          ),
        ],
      ),
    );
  }
  statusReport(String title,dynamic value,double percent,Color progressColor){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$value",style: ts18(grey2),),
              Text("$title",style: ts14(grey3),),
            ],
          ),
          SizedBox(height: 7,),
          LinearPercentIndicator(
            leading: Container(width: 0,),
            padding: EdgeInsets.only(left: 0),
            width: width1-40,
            trailing: Container(),
            backgroundColor: Colors.grey[200],
            progressColor: progressColor,
            percent: percent,
            animationDuration: 1000,
            animation: true,
            lineHeight: 5,
          ),
        ],
      ),
    );
  }
  expenseCount(String title,String footer,Color color,double percent){
    return Container(
      width:  width1*0.25,
      margin: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title",style: ts14(grey2),),
          SizedBox(height: 10,),
          LinearPercentIndicator(
            leading: Container(width: 0,),
            padding: EdgeInsets.only(left: 0),
            width: width1*0.25,
            trailing: Container(),
            backgroundColor: Colors.grey[200],
            progressColor: color,
            percent: percent,
            animationDuration: 1000,
            animation: true,
            lineHeight: 5,
          ),
          SizedBox(height: 10,),
          Text("$footer",style: ts14(color),),
        ],
      ),
    );
  }

}
