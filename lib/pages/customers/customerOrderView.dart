import 'package:ecommerce_admin/model/productModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
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

import '../../constants.dart';


class CustomerOrderView extends StatefulWidget {
  const CustomerOrderView({Key? key}) : super(key: key);

  @override
  _CustomerOrderViewState createState() => _CustomerOrderViewState();
}

class _CustomerOrderViewState extends State<CustomerOrderView> {
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
    GridHeaderModel(columnName: "S.No",width: 50),
    GridHeaderModel(columnName: "Image",width: 100),
    GridHeaderModel(columnName: "Product Name",width: 200),
    GridHeaderModel(columnName: "Qty",),
    GridHeaderModel(columnName: "Amount",),
  ];
  List<ProductModel> products=[
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
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
                        Text("Order 545443",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
                      ],
                    ),
                  ),
                  Container(
                    padding:  EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: SizeConfig.screenHeight!-50,
                    child: Theme(
                      data: glowTransparent(context),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            detailView("Status", "Delivered"),
                            detailView("Delivered On", "12-09-2989"),
                            detailView("Action", "View"),
                            SizedBox(height: 20,),
                            GridWithWidgetParam(
                                headerHeight: headerHeight,
                                headerWidth: 650,
                                gridHeaderList: gridHeaderList,
                                addBtnTap: (){},
                                filterOnTap: (i){
                                  setState(() {
                                    gridHeaderList[i].isActive=!gridHeaderList[i].isActive;
                                  });
                                },
                                searchFunc: (v){
                                //  pn.searchCustomer(v);
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
                                bodyHeight: SizeConfig.screenHeight!-290,
                                bodyWidth: 650,
                                bodyWidget: Column(
                                  children: pn.products.asMap().map((key, value) => MapEntry(key,
                                      Container(
                                        //width: width,
                                        padding: bodyPadd,
                                        margin: bodyMargin,
                                        decoration: bodyDecoration,
                                        constraints: bodyConstraints,
                                        child: Row(
                                          children: [

                                            gridHeaderList[0].isActive?GridContent(
                                              width: 50,
                                              title: key+1,
                                            ):Container(),
                                            gridHeaderList[1].isActive?Container(
                                              width: 100,
                                              height: 45,
                                              child: Image.network("https://bc-storage.sfo2.digitaloceanspaces.com/girias/assets/girias-logo.png"),
                                            ):Container(),
                                            gridHeaderList[2].isActive?GridContent(
                                              width: 200,
                                              title: value.productName,
                                            ):Container(),
                                            gridHeaderList[3].isActive?GridContent(
                                              width: 150,
                                              title:value.currentQty,
                                            ):Container(),
                                            gridHeaderList[4].isActive?GridContent(
                                              width: 150,
                                              title: value.productActualPrice,
                                            ):Container(),

                                          ],
                                        ),
                                      )
                                  )
                                  ).values.toList(),
                                )
                            ),
                            SizedBox(height: 50,),
                            Container(
                              height: 50,
                              width: 650,
                              decoration: bodyDecoration,
                              child: Row(
                                children: [
                                  GridContent(
                                    width: 350,
                                    title: "Total",
                                    alignment: Alignment.centerLeft,
                                  ),
                                  GridContent(
                                    width: 150,
                                    title: "4",
                                    alignment: Alignment.centerLeft,
                                  ),
                                  GridContent(
                                    width: 150,
                                    title: "434",
                                    alignment: Alignment.centerLeft,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 50,),
                            Text("  You will save Rs.1,089 on this order",style: ts18(Colors.green[800]!,fontsize: 22), ),
                            SizedBox(height: 50,),
                          ],
                        ),
                      ),
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
