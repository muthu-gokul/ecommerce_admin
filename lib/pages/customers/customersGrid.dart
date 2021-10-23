import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandAddNew.dart';
import 'package:ecommerce_admin/pages/customers/customerView.dart';
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



class CustomersGrid extends StatefulWidget {
  const CustomersGrid({Key? key}) : super(key: key);

  @override
  _CustomersGridState createState() => _CustomersGridState();
}

class _CustomersGridState extends State<CustomersGrid> {
  late double width;
  List<GridHeaderModel> gridHeaderList=[
    GridHeaderModel(columnName: "Customer Id",),
    GridHeaderModel(columnName: "Name",width: 200),
    GridHeaderModel(columnName: "Email",width: 200),
    GridHeaderModel(columnName: "Phone No",),
    GridHeaderModel(columnName: "Total Orders",),
    GridHeaderModel(columnName: "Total Amount",),
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
                      Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent
                          ),
                        ),
                      ),
                      for(int i=0;i<gridHeaderList.length;i++)
                        gridHeaderList[i].isActive? GridHeader(
                          width: gridHeaderList[i].width,
                          title: gridHeaderList[i].columnName,
                          alignment: gridHeaderList[i].alignment,
                        ):Container(),
                    ]
                  ),
                  bodyHeight: SizeConfig.screenHeight!-230,
                  bodyWidth: width,
                  bodyWidget: Column(
                    children: pn.filterCustomers.asMap().map((key, value) => MapEntry(key,
                        Container(
                          //width: width,
                          padding: bodyPadd,
                          margin: bodyMargin,
                          decoration: bodyDecoration,
                          constraints: bodyConstraints,
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green
                                  ),
                                ),
                              ),
                              gridHeaderList[0].isActive?GridContent(
                                width: 150,
                                title: value.customerId,
                              ):Container(),
                              gridHeaderList[1].isActive?GridContent(
                                width: 200,
                                title: value.name,
                              ):Container(),
                              gridHeaderList[2].isActive?GridContent(
                                width: 200,
                                title: value.email,
                              ):Container(),
                              gridHeaderList[3].isActive?GridContent(
                                width: 150,
                                title:value.phoneNumber,
                              ):Container(),
                              gridHeaderList[4].isActive?GridContent(
                                width: 150,
                                title: value.totalOrders,
                              ):Container(),
                              gridHeaderList[5].isActive?GridContent(
                                width: 150,
                                title: value.totalAmount,
                              ):Container(),
                              gridHeaderList[6].isActive?Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    AddBtn(
                                      ontap: (){
                                        Navigator.push(context, pr.PageRoute().slideFromLeftToRight(CustomerView()));
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
