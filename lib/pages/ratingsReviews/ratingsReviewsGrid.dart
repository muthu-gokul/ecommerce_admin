import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandAddNew.dart';
import 'package:ecommerce_admin/pages/customers/customerView.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/pages/paymentSettings/paymentSettingsAddNew.dart';
import 'package:ecommerce_admin/pages/pincode/pincodeAddNew.dart';
import 'package:ecommerce_admin/pages/ratingsReviews/ratingsView.dart';
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




class RatingsReviewsGrid extends StatefulWidget {


  @override
  _RatingsReviewsGridState createState() => _RatingsReviewsGridState();
}

class _RatingsReviewsGridState extends State<RatingsReviewsGrid> {
  late double width;
  List<GridHeaderModel> gridHeaderList=[
    GridHeaderModel(columnName: "Product Name",),
    GridHeaderModel(columnName: "Overall Rating"),
    GridHeaderModel(columnName: "No of Ratings"),
    GridHeaderModel(columnName: "No of Reviews"),
    GridHeaderModel(columnName: "Actions",width: 100),
  ];
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
        builder: (context,pn,child)=>  Container(
          height: SizeConfig.screenHeight!-appBarHei,
          width: width,
          color: bgColor,
          padding:bodyPadding,
          child: Column(
            children: [
              GridWithWidgetParam(
                  headerHeight: headerHeight,
                  headerWidth: width,
                  gridHeaderList: gridHeaderList,
                  showAdd: false,
                  addBtnTap: (){
                    Navigator.push(context, pr.PageRoute().slideFromLeftToRight(PincodeAddNew()));
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
                  bodyHeight: SizeConfig.screenHeight!-gridReduceHei,
                  bodyWidth: width,
                  bodyWidget: Column(
                    children: pn.ratings.asMap().map((key, value) => MapEntry(key,
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
                                title: value.productName,
                              ):Container(),
                              gridHeaderList[1].isActive?GridContent(
                                width:gridHeaderList[1].width ,
                                alignment: gridHeaderList[1].alignment,
                                title: value.rating,
                              ):Container(),
                              gridHeaderList[2].isActive?GridContent(
                                width:gridHeaderList[2].width ,
                                alignment: gridHeaderList[2].alignment,
                                title:"${value.noOfRatings}",
                              ):Container(),
                              gridHeaderList[3].isActive?GridContent(
                                width:gridHeaderList[3].width ,
                                alignment: gridHeaderList[3].alignment,
                                title:"${value.noOfReviews}",
                              ):Container(),

                              gridHeaderList[4].isActive?Container(
                                width:gridHeaderList[4].width ,
                                alignment: gridHeaderList[4].alignment,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [

                                    AddBtn(
                                      ontap: (){
                                         Navigator.push(context, pr.PageRoute().fade(RatingsView()));
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
