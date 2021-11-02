import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/frontCoverSlider/frontCoverAddNew.dart';
import 'package:ecommerce_admin/pages/staffs/staffsAddNew.dart';
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

import '../../constants.dart';

class RefundGird extends StatefulWidget {
  const RefundGird({Key? key}) : super(key: key);

  @override
  _RefundGirdState createState() => _RefundGirdState();
}

class _RefundGirdState extends State<RefundGird> {
  late double width;
  List<GridHeaderModel> gridHeaderList=[
    GridHeaderModel(columnName: "Order Id",),
    GridHeaderModel(columnName: "Product",),
    GridHeaderModel(columnName: "Customer Name",),
    GridHeaderModel(columnName: "Customer Mail Id",),
    GridHeaderModel(columnName: "Status",),
    GridHeaderModel(columnName: "Refund Configuration",),
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
          height: SizeConfig.screenHeight!-50,
          width: width,
          color: bgColor,
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              GridWithWidgetParam(
                  headerHeight: headerHeight,
                  headerWidth: width,
                  gridHeaderList: gridHeaderList,
                  showAdd: false,
                  addBtnTap: (){
                    Navigator.push(context, pr.PageRoute().slideFromLeftToRight(StaffsAdd()));
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
                  bodyHeight: SizeConfig.screenHeight!-230,
                  bodyWidth: width,
                  bodyWidget: Column(
                    children: pn.refunds.asMap().map((key, value) => MapEntry(key,
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
                                title: value.orderId,
                              ):Container(),
                              gridHeaderList[1].isActive?GridContent(
                                width:  gridHeaderList[1].width,
                                title: value.product,
                              ):Container(),
                              gridHeaderList[2].isActive?GridContent(
                                width:  gridHeaderList[2].width,
                                title: value.cusname,
                              ):Container(),
                              gridHeaderList[3].isActive?GridContent(
                                width:  gridHeaderList[3].width,
                                alignment:  gridHeaderList[3].alignment,
                                title: value.cusmail,
                              ):Container(),
                              gridHeaderList[4].isActive?Container(
                                width:  gridHeaderList[4].width,
                                alignment:  gridHeaderList[4].alignment,
                                child: CustomSwitch(
                                  value: true,
                                  onchange: (v){

                                  },
                                ),
                              ):Container(),
                              gridHeaderList[5].isActive?GridContent(
                                width:  gridHeaderList[5].width,
                                title: value.refundConfi,
                              ):Container(),
                              gridHeaderList[6].isActive?Container(
                                width:  gridHeaderList[6].width,
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

            ],
          ),
        ),
      ),
    );
  }
}

