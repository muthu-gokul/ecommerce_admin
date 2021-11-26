import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/blog/blogAddNew.dart';
import 'package:ecommerce_admin/pages/branch/branchAddNew.dart';
import 'package:ecommerce_admin/pages/frontCoverSlider/frontCoverAddNew.dart';
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

import '../../constants.dart';

class BranchGrid extends StatefulWidget {
  const BranchGrid({Key? key}) : super(key: key);

  @override
  _BranchGridState createState() => _BranchGridState();
}

class _BranchGridState extends State<BranchGrid> {
  late double width;
  List<GridHeaderModel> gridHeaderList=[
    GridHeaderModel(columnName: "Branch Code",),
    GridHeaderModel(columnName: "Locality",width: 200),
    GridHeaderModel(columnName: "District",width: 200),
    GridHeaderModel(columnName: "State",),
    GridHeaderModel(columnName: "Added Date",),
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
                    Navigator.push(context, pr.PageRoute().fade(BranchAddNew()));
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
                    children: pn.branchDetail.asMap().map((key, value) => MapEntry(key,
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
                                title: value.branchCode,
                              ):Container(),
                              gridHeaderList[1].isActive?GridContent(
                                width:  gridHeaderList[1].width,
                                title: value.locality,
                              ):Container(),
                              gridHeaderList[2].isActive?GridContent(
                                width:  gridHeaderList[2].width,
                                title: value.district,
                              ):Container(),
                              gridHeaderList[3].isActive?GridContent(
                                width:  gridHeaderList[3].width,
                                alignment:  gridHeaderList[3].alignment,
                                title: value.state,
                              ):Container(),
                              gridHeaderList[4].isActive?GridContent(
                                width:  gridHeaderList[4].width,
                                title: value.addedDate,
                              ):Container(),
                              gridHeaderList[5].isActive?Container(
                                width:  gridHeaderList[5].width,
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


