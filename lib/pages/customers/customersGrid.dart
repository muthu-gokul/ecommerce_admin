import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandAddNew.dart';
import 'package:ecommerce_admin/pages/customers/customerView.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
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
                    children: pn.filterCustomers.asMap().map((key, value) => MapEntry(key,
                        Container(
                          //width: width,
                          padding: bodyPadd,
                          margin: bodyMargin,
                          decoration: bodyDecoration,
                          constraints: bodyConstraints,
                          child: Row(
                            children: [
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
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50,
                  width: width-70,
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Builder(
                        builder: (BuildContext ctx1) => GestureDetector(
                          onTap: (){
                            showPopover(
                              barrierColor: Colors.transparent,
                              context: ctx1,
                              transitionDuration: const Duration(milliseconds: 150),
                              bodyBuilder: (context) => Column(
                                children: [
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                      setState(() {
                                        pn.perPage=10;
                                      });
                                      pn.init(true);
                                    },
                                    child: Container(
                                      height: 25,
                                        width: 80,
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text("10")
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                      setState(() {
                                        pn.perPage=20;
                                      });
                                      pn.init(true);
                                    },
                                    child: Container(
                                      height: 25,
                                        width: 80,
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text("20")
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                      setState(() {
                                        pn.perPage=50;
                                      });
                                      pn.init(true);
                                    },
                                    child: Container(
                                      height: 25,
                                        width: 80,
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text("50")
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                      setState(() {
                                        pn.perPage=100;
                                      });
                                      pn.init(true);
                                    },
                                    child: Container(
                                      height: 25,
                                        width: 80,
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        child: Text("100")
                                    ),
                                  ),

                                  SizedBox(height: 10,),
                                ],
                              ),
                              onPop: () => print('Popover was popped!'),
                              direction: PopoverDirection.bottom,
                              width: 80,
                              height: 120,
                              arrowHeight: 0,
                              arrowWidth: 0,
                              //  backgroundColor: Color(0xFFf6f6f6),
                              backgroundColor: Colors.white,
                              contentDyOffset: 5,
                              //isAttachRight: false,
                              shadow:[
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                    offset: Offset(0,0)
                                )
                              ],
                              margin: 0,
                              isCustom: true,
                              leftMargin: 0,
                              constraints: BoxConstraints(
                                  maxHeight: 350
                              ),
                            );
                          },
                          child: Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: grey3.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5)
                            ),
                            alignment: Alignment.center,
                            child: Text("Show - ${pn.perPage}"),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text("Current Page - ${pn.currentPage+1}",style: ts14(grey3),),
                      Spacer(),
                      IconButton(
                          onPressed: (){
                            pn.prev();
                          },
                          icon: Icon(Icons.keyboard_arrow_left,size: 30,)
                      ),
                      IconButton(
                          onPressed: (){
                            pn.next();
                          },
                          icon: Icon(Icons.keyboard_arrow_right,size: 30,)
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
