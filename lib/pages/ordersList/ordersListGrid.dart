import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandAddNew.dart';
import 'package:ecommerce_admin/pages/customers/customerView.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/pages/ordersList/ordersListView.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridFooter.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import '../../constants.dart';



class OrdersListGrid extends StatefulWidget {
  const OrdersListGrid({Key? key}) : super(key: key);

  @override
  _OrdersListGridState createState() => _OrdersListGridState();
}

class _OrdersListGridState extends State<OrdersListGrid> {
  late double width;
  List<GridHeaderModel> gridHeaderList=[
    GridHeaderModel(columnName: "Order Id",),
    GridHeaderModel(columnName: "Product Name",width: 200),
    GridHeaderModel(columnName: "Qty"),
    GridHeaderModel(columnName: "Total Amount",),
    GridHeaderModel(columnName: "Phone No",),
    GridHeaderModel(columnName: "Ordered Date",),
    GridHeaderModel(columnName: "Device Type",),
    GridHeaderModel(columnName: "App/Website",),
    GridHeaderModel(columnName: "Payment Type",),
    GridHeaderModel(columnName: "Payment Status",),
    GridHeaderModel(columnName: "Order Status",),
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
          child: Column(
            children: [
              GridWithWidgetParam(
                  headerHeight: headerHeight,
                  headerWidth: width,
                  gridHeaderList: gridHeaderList,
                  addBtnTap: (){},
                  showAdd: false,
                  filterOnTap: (i){
                    setState(() {
                      gridHeaderList[i].isActive=!gridHeaderList[i].isActive;
                    });
                  },
                  searchFunc: (v){

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
                  bodyHeight: SizeConfig.screenHeight!-270,
                  bodyWidth: width,
                  bodyWidget: Column(
                    children: pn.orders.asMap().map((key, value) => MapEntry(key,
                        Container(
                          //width: width,
                          padding: bodyPadd,
                          margin: bodyMargin,
                          decoration: bodyDecoration,
                          constraints: bodyConstraints,
                          child: Row(
                            children: [
                              gridHeaderList[0].isActive?GridContent(
                                width: gridHeaderList[0].width,
                                alignment: gridHeaderList[0].alignment,
                                title: value.orderId,
                              ):Container(),
                              gridHeaderList[1].isActive?GridContent(
                                width: gridHeaderList[1].width,
                                alignment: gridHeaderList[1].alignment,
                                title: value.productName,
                              ):Container(),
                              gridHeaderList[2].isActive?GridContent(
                                width: gridHeaderList[2].width,
                                alignment: gridHeaderList[2].alignment,
                                title: value.qty,
                              ):Container(),
                              gridHeaderList[3].isActive?GridContent(
                                width: gridHeaderList[3].width,
                                alignment: gridHeaderList[3].alignment,
                                title:value.totalAmt,
                              ):Container(),
                              gridHeaderList[4].isActive?GridContent(
                                width: gridHeaderList[4].width,
                                alignment: gridHeaderList[4].alignment,
                                title: value.phoneNo,
                              ):Container(),
                              gridHeaderList[5].isActive?GridContent(
                                width: gridHeaderList[5].width,
                                alignment: gridHeaderList[5].alignment,
                                title: value.orderedDate,
                              ):Container(),
                              gridHeaderList[6].isActive?GridContent(
                                width: gridHeaderList[6].width,
                                alignment: gridHeaderList[6].alignment,
                                title: value.deviceType,
                              ):Container(),
                              gridHeaderList[7].isActive?GridContent(
                                width: gridHeaderList[7].width,
                                alignment: gridHeaderList[7].alignment,
                                title: value.isApp?"App":"Website",
                              ):Container(),
                              gridHeaderList[8].isActive?GridContent(
                                width: gridHeaderList[8].width,
                                alignment: gridHeaderList[8].alignment,
                                title: value.paymentType,
                              ):Container(),
                              gridHeaderList[9].isActive?GridContent(
                                width: gridHeaderList[9].width,
                                alignment: gridHeaderList[9].alignment,
                                title: value.paymentStatus,
                              ):Container(),
                              gridHeaderList[10].isActive?GridContent(
                                width: gridHeaderList[10].width,
                                alignment: gridHeaderList[10].alignment,
                                title: value.orderStatus,
                              ):Container(),
                              gridHeaderList[11].isActive?Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    AddBtn(
                                      ontap: (){
                                        Navigator.push(context, pr.PageRoute().fade(OrdersListView()));
                                      },
                                      color: Colors.transparent,
                                      hei: 30,
                                      margin: EdgeInsets.only(left: 0),
                                      widget: Icon(Icons.visibility,color: Colors.grey,size: 30,),
                                    ),
                                   /* ActionIcon(ontap: (){
                                    }, imgColor: Colors.red, img: "assets/icons/delete.svg"
                                    ),*/
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

            ],
          ),
        ),
      ),
    );
  }
}
