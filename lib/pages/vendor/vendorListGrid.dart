import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/frontCoverSlider/frontCoverAddNew.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/pages/vendor/vendorListAddNew.dart';
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

class VendorListGrid extends StatefulWidget {
  const VendorListGrid({Key? key}) : super(key: key);

  @override
  _VendorListGridState createState() => _VendorListGridState();
}

class _VendorListGridState extends State<VendorListGrid> {
  late double width;
  List<GridHeaderModel> gridHeaderList=[
    GridHeaderModel(columnName: "Company Logo",),
    GridHeaderModel(columnName: "Id",),
    GridHeaderModel(columnName: "Company Name",),
    GridHeaderModel(columnName: "Vendor Name",),
    GridHeaderModel(columnName: "Vendor Type",),
    GridHeaderModel(columnName: "Register Date",),
    GridHeaderModel(columnName: "Company Categories",),
    GridHeaderModel(columnName: "Service Status",),
    GridHeaderModel(columnName: "Mail",),
    GridHeaderModel(columnName: "Mobile no",),
    GridHeaderModel(columnName: "Address",),
    GridHeaderModel(columnName: "Gst No",),
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
                  showAdd: true,
                  addBtnTap: (){
                    Navigator.push(context, pr.PageRoute().slideFromLeftToRight(VendorListAdd()));
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
                  bodyHeight: SizeConfig.screenHeight!-gridReduceHei,
                  bodyWidth: width,
                  bodyWidget: Column(
                    children: pn.vendorList.asMap().map((key, value) => MapEntry(key,
                        Container(
                          //width: width,
                          padding: bodyPadd,
                          margin: bodyMargin,
                          decoration: bodyDecoration,
                          constraints: bodyConstraints,
                          child: Row(
                            children: [
                              gridHeaderList[0].isActive?Container(
                                width:  gridHeaderList[0].width,
                                height: 45,
                                // alignment: gridHeaderList[2].alignment,
                                child: Image.network("https://bc-storage.sfo2.digitaloceanspaces.com/girias/assets/girias-logo.png"),
                              ):Container(),
                              gridHeaderList[1].isActive?GridContent(
                                width:  gridHeaderList[1].width,
                                title: value.id,
                              ):Container(),
                              gridHeaderList[2].isActive?GridContent(
                                width:  gridHeaderList[2].width,
                                title: value.cmpyName,
                              ):Container(),
                              gridHeaderList[3].isActive?GridContent(
                                width:  gridHeaderList[3].width,
                                title: value.vendrName,
                              ):Container(),
                              gridHeaderList[4].isActive?GridContent(
                                width:  gridHeaderList[4].width,
                                title: value.vendrType,
                              ):Container(),
                              gridHeaderList[5].isActive?GridContent(
                                width:  gridHeaderList[5].width,
                                title: value.registorDate,
                              ):Container(),
                              gridHeaderList[6].isActive?GridContent(
                                width:  gridHeaderList[6].width,
                                title: value.CmpyCatgery,
                              ):Container(),
                              gridHeaderList[7].isActive?Container(
                                width:  gridHeaderList[7].width,
                                alignment:  gridHeaderList[7].alignment,
                                child: CustomSwitch(
                                  value: true,
                                  onchange: (v){

                                  },
                                ),
                              ):Container(),
                              gridHeaderList[8].isActive?GridContent(
                                width:  gridHeaderList[8].width,
                                title: value.mail,
                              ):Container(),
                              gridHeaderList[9].isActive?GridContent(
                                width:  gridHeaderList[9].width,
                                title: value.mbleNo,
                              ):Container(),
                              gridHeaderList[10].isActive?GridContent(
                                width:  gridHeaderList[10].width,
                                title: value.address,
                              ):Container(),
                              gridHeaderList[11].isActive?GridContent(
                                width:  gridHeaderList[11].width,
                                title: value.gst,
                              ):Container(),
                              gridHeaderList[12].isActive?Container(
                                width:  gridHeaderList[12].width,
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
                                    }, imgColor: Colors.red, img: "assets/icons/delete.svg"),
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


