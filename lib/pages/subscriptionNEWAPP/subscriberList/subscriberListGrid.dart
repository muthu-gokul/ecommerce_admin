import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridFooter.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;

import '../../../constants.dart';
import 'subscriberListAddNew.dart';



class SubscriberListGrid extends StatefulWidget {
  const SubscriberListGrid({Key? key}) : super(key: key);

  @override
  _SubscriberListGridState createState() => _SubscriberListGridState();
}

class _SubscriberListGridState extends State<SubscriberListGrid> {
  late double width;
  List<GridHeaderModel> gridHeaderList=[
    GridHeaderModel(columnName: "S.No",),
    GridHeaderModel(columnName: "Company Name",),
    GridHeaderModel(columnName: "Contact Name",),
    GridHeaderModel(columnName: "Email",),
    GridHeaderModel(columnName: "Phone No",),
    GridHeaderModel(columnName: "Licence No",),
    GridHeaderModel(columnName: "Expiry date",),
    GridHeaderModel(columnName: "Status",),
    GridHeaderModel(columnName: "Actions",width: 100),
  ];
  @override
  void initState() {
    Provider.of<ProductNotifier>(context,listen: false).init(false);
    super.initState();
  }
  // @override
  // void didChangeDependencies() {
  //   print("CUstomer did");
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-100;
    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=>Consumer<ProductNotifier>(
        builder: (context,pn,child)=>  Container(
          height: SizeConfig.screenHeight!-appBarHei,
          width: width,
          color: bgColor,
          padding: bodyPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: SizeConfig.screenWidth,
                  alignment: Alignment.center,
                  height:380,
                  child: Wrap(
                   runSpacing: 10.0,
                    spacing: 10.0,
                    direction: Axis.horizontal,
                    children: [
                      counter("Total Subscription", "5.82 K"),
                    //  SizedBox(width: 20,),
                      counter("Total Active ", "1.1 K"),
                    //  SizedBox(width: 20,),
                      counter("Total Trial Plan", "2.88 K"),
                   //   SizedBox(width: 20,),
                      counter("Total Past Due", "2.88 K"),
                    //  SizedBox(width: 20,),
                      counter("Total Cancelled", "2.88 K"),
                    //  SizedBox(width: 20,),
                      counter("Total Expired", "2.88 K"),
                    ],
                  ),
                ),
                GridWithWidgetParam(
                    headerHeight: headerHeight,
                    headerWidth: width,
                    gridHeaderList: gridHeaderList,
                    showAdd: true,
                    addBtnTap: (){
                      Navigator.push(context, pr.PageRoute().fade(SubscriberListAdd()));
                    },
                    filterOnTap: (i){
                      setState(() {
                        gridHeaderList[i].isActive=!gridHeaderList[i].isActive;
                      });
                    },
                    searchFunc: (v){
                      pn.searchCustomer(v);
                    },
                    headerWidget: Row(
                        children: gridHeaderList.asMap().map((key, value) =>
                            MapEntry(key, value.isActive? GridHeader(
                              width: value.width,
                              title: value.columnName,
                            ):Container(),
                            )
                        ).values.toList()
                    ),
                    bodyHeight: SizeConfig.screenHeight!-270,
                    bodyWidth: width,
                    bodyWidget: Column(
                      children: pn.subsList.asMap().map((key, value) => MapEntry(key,
                          Container(
                            //width: width,
                            padding: bodyPadd,
                            margin: bodyMargin,
                            decoration: bodyDecoration,
                            constraints: bodyConstraints,
                            child: Row(
                              children: [
                                gridHeaderList[0].isActive?GridContent(
                                  width:  gridHeaderList[0].width,
                                  title: value.sNo,
                                ):Container(),
                                gridHeaderList[1].isActive?GridContent(
                                  width:  gridHeaderList[1].width,
                                  title: value.cmpnyName,
                                ):Container(),
                                gridHeaderList[2].isActive?GridContent(
                                  width:  gridHeaderList[2].width,
                                  alignment: gridHeaderList[2].alignment,
                                  title: value.contactName,
                                ):Container(),
                                gridHeaderList[3].isActive?GridContent(
                                  width:  gridHeaderList[3].width,
                                  title: value.email,
                                ):Container(),
                                gridHeaderList[4].isActive?GridContent(
                                  width:  gridHeaderList[4].width,
                                  title: value.phoneNo,
                                ):Container(),
                                gridHeaderList[5].isActive?GridContent(
                                  width:  gridHeaderList[5].width,
                                  title: value.licenceNo,
                                ):Container(),
                                gridHeaderList[6].isActive?GridContent(
                                  width:  gridHeaderList[6].width,
                                  alignment:  gridHeaderList[6].alignment,
                                  title: value.expirydate,
                                ):Container(),
                                gridHeaderList[7].isActive?GridContent(
                                  width:  gridHeaderList[7].width,
                                  alignment:  gridHeaderList[7].alignment,
                                  title: value.status,
                                ):Container(),
                                gridHeaderList[8].isActive?Container(
                                  width:  gridHeaderList[8].width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      AddBtn(
                                        ontap: (){
                                          // Navigator.push(context, pr.PageRoute().slideFromLeftToRight(CustomerView()));
                                        },
                                        color: Colors.transparent,
                                        hei: 30,
                                        margin: EdgeInsets.only(left: 0),
                                        widget: Icon(Icons.visibility,color: Colors.grey,size: 30,),
                                      ),
                                      ActionIcon(ontap: (){
                                      }, imgColor: Colors.red, img: "assets/icons/delete.svg"
                                      ),
                                    ],
                                  ),
                                ):Container(),
                              ],
                            ),
                          )
                      )
                      ).values.toList(),
                    )
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
                SizedBox(height: 30,)

              ],
            ),
          ),
        ),
      ),
    );
  }

  counter(String title,String value){
    return  Container(
      width:300,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$title",style: ts14(Colors.black),),
          SizedBox(height: 20,),
          Text("$value",style: ts18(Colors.black,fontsize: 30),)
        ],
      ),
    );
  }
}


