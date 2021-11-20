import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/reportNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/appMaster/appAddNew.dart';
import 'package:ecommerce_admin/pages/brand/brandAddNew.dart';
import 'package:ecommerce_admin/pages/customers/customerView.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/pages/paymentSettings/paymentSettingsAddNew.dart';
import 'package:ecommerce_admin/pages/pincode/pincodeAddNew.dart';
import 'package:ecommerce_admin/pages/shippingCharges/shippingChargesAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
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




class ReportGrid extends StatefulWidget {


  @override
  _ReportGridState createState() => _ReportGridState();
}

class _ReportGridState extends State<ReportGrid> {
  late double width;

  @override
  void initState() {
    Provider.of<ProductNotifier>(context,listen: false).init(false);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-100;
    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=>Consumer<ProductNotifier>(
        builder: (context,pn,child)=>  Consumer<ReportNotifier>(
            builder: (context,rn,child)=> Container(
              height: SizeConfig.screenHeight!-appBarHei,
              width: width,
              color: bgColor,
              padding: bodyPadding,
              child: Column(
                children: [
                  GridWithWidgetParam(
                      headerHeight: headerHeight,
                      headerWidth: width,
                      gridHeaderList: rn.gridHeaderList,
                      showAdd: true,
                      addBtnTap: (){
                        Navigator.push(context, pr.PageRoute().fade(AppAddNew()));
                      },
                      filterOnTap: (i){
                        setState(() {
                          rn.gridHeaderList[i].isActive=!rn.gridHeaderList[i].isActive;
                        });
                      },
                      searchFunc: (v){
                        pn.searchCustomer(v);
                      },
                      headerWidget: Row(
                          children: [

                            for(int i=0;i<rn.gridHeaderList.length;i++)
                              rn.gridHeaderList[i].isActive? GridHeader(
                                width: rn.gridHeaderList[i].width,
                                title: rn.gridHeaderList[i].columnName,
                                alignment: rn.gridHeaderList[i].alignment,
                                textAlign: rn.gridHeaderList[i].textAlign,
                              ):Container(),
                          ]
                      ),
                      bodyHeight: SizeConfig.screenHeight!-gridReduceHei,
                      bodyWidth: width,
                      bodyWidget: Column(
                        children: rn.gridData.asMap().map((key, value) => MapEntry(key,
                            Container(
                              //width: width,
                              padding: bodyPadd,
                              margin: bodyMargin,
                              decoration: bodyDecoration,
                              constraints: bodyConstraints,
                              child: Row(
                                children: [

                                  for(int i=0;i<rn.gridHeaderList.length;i++)
                                  rn.gridHeaderList[i].isActive?GridContent(
                                    width:rn.gridHeaderList[i].width ,
                                    alignment: rn.gridHeaderList[i].alignment,
                                    title:value.get(rn.gridHeaderList[i].propertyName),
                                  ):Container(),
                                  // rn.gridHeaderList[i].isActive?Container(
                                  //   width:  rn.gridHeaderList[i].width,
                                  //   height: 45,
                                  //   alignment: rn.gridHeaderList[i].alignment,
                                  //   // child: Image.network("https://bc-storage.sfo2.digitaloceanspaces.com/girias/assets/girias-logo.png"),
                                  // ):Container(),
                                  // rn.gridHeaderList[1].isActive?GridContent(
                                  //   width:rn.gridHeaderList[1].width ,
                                  //   alignment: rn.gridHeaderList[1].alignment,
                                  //   title: value.downldType,
                                  // ):Container(),
                                  // rn.gridHeaderList[2].isActive?GridContent(
                                  //   width:rn.gridHeaderList[2].width ,
                                  //   alignment: rn.gridHeaderList[2].alignment,
                                  //   title:value.downldLink,
                                  // ):Container(),
                                  //
                                  // rn.gridHeaderList[3].isActive?Container(
                                  //   width:rn.gridHeaderList[3].width ,
                                  //   alignment: rn.gridHeaderList[3].alignment,
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
      ),
    );
  }
}


