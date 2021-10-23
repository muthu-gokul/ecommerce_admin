import 'package:ecommerce_admin/model/productModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/circle.dart';
import 'package:ecommerce_admin/widgets/circleProgressBar.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/linearProgressBar.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';


class CustomerOrderDetailView extends StatefulWidget {
  const CustomerOrderDetailView({Key? key}) : super(key: key);

  @override
  _CustomerOrderDetailViewState createState() => _CustomerOrderDetailViewState();
}

class _CustomerOrderDetailViewState extends State<CustomerOrderDetailView> {
  late double width,width2;
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
    width2=SizeConfig.screenWidth!*0.7;
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
                        Text("Order Details",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                            Container(
                              height: 300,
                              width: SizeConfig.screenWidth,
                              decoration: decoration,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width1,
                                    child: Column(
                                      children: [
                                        Container(
                                            padding:  EdgeInsets.only(left: 20,bottom: 20,top: 20),
                                            alignment: Alignment.centerLeft,
                                            child: Text("Delivery Address",style: ts18(grey1,fontfamily: 'RM'),)
                                        ),
                                        Container(
                                            padding:  EdgeInsets.only(left: 20,bottom: 20),
                                            alignment: Alignment.centerLeft,
                                            child: Text("Raghu",style: ts18(grey2,fontfamily: 'RM',fontsize: 17),)
                                        ),
                                        detailView("Address:",
                                          "No:4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai-600095.",
                                        ),
                                        detailView("Phone No:", "8787877878"),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 300,
                                    width: 2,
                                    color: bgColor
                                  ),
                                  Container(
                                    width: width1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            padding:  EdgeInsets.only(left: 20,bottom: 20,top: 20),
                                            alignment: Alignment.centerLeft,
                                            child: Text("Your Rewards",style: ts18(grey1,fontfamily: 'RM'),)
                                        ),
                                        Container(
                                            padding:  EdgeInsets.only(left: 50,bottom: 5),
                                            alignment: Alignment.centerLeft,
                                            child: Text("50 points",style: ts18(grey2,fontfamily: 'RM',fontsize: 17),)
                                        ),
                                        Container(
                                            padding:  EdgeInsets.only(left: 50,bottom: 20),
                                            alignment: Alignment.centerLeft,
                                            child: Text("go to reward zone to know more",style: ts16(grey3),)
                                        )

                                      ],
                                    ),
                                  ),
                                  Container(
                                      height: 300,
                                      width: 2,
                                      color: bgColor
                                  ),
                                  Container(
                                    //width: width1,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                padding:  EdgeInsets.only(left: 20,bottom: 20,top: 20),
                                                alignment: Alignment.centerLeft,
                                                child: Text("More Actions",style: ts18(grey1,fontfamily: 'RM'),)
                                            ),
                                            Container(
                                                padding:  EdgeInsets.only(left: 50,bottom: 5),
                                                alignment: Alignment.centerLeft,
                                                child: Text("Download Invoice",style: ts18(grey2,fontfamily: 'RM',fontsize: 17),)
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 50,),
                                        Container(
                                            height: 50,
                                            width: 200,
                                            margin: EdgeInsets.only(top: 80),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(color: th.primaryColor2)
                                            ),
                                            alignment: Alignment.center,
                                            child: Text("Download")
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              height: 200,
                              width: SizeConfig.screenWidth,
                              decoration: decoration,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  Container(
                                    height: 120,
                                    width: width2,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: width2,
                                          child: Row(
                                            children: [
                                                Container(
                                                  width: width2*0.25,
                                                  alignment: Alignment.centerLeft,
                                                  child: Text("Ordered",style: ts16(Colors.green[800]!),),
                                                ),
                                              Container(
                                                width: width2*0.25,
                                                alignment: Alignment.center,
                                                child: Text("Shipped",style: ts16(Colors.green[800]!)),
                                              ),
                                              Container(
                                                width: width2*0.25,
                                                alignment: Alignment.center,
                                                child: Text("Out for Delivery",style: ts16(Colors.green[800]!)),
                                              ),
                                              Container(
                                                width: width2*0.25,
                                                alignment: Alignment.centerRight,
                                                child: Text("Delivered",style: ts16(Colors.green[800]!)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: width2,
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: 5,
                                                  width: width2-60,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: 40,
                                                  width: width2-60,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: (width2-60)*0.25,
                                                        alignment: Alignment.centerLeft,
                                                        child: Circle(
                                                          color: Colors.green,
                                                          hei: 14,
                                                        )
                                                      ),
                                                      Container(
                                                        width: (width2-60)*0.25,
                                                        alignment: Alignment.center,
                                                        child:  Circle(
                                                          color: Colors.green,
                                                          hei: 14,
                                                        )
                                                      ),
                                                      Container(
                                                        width: (width2-60)*0.25,
                                                        alignment: Alignment.center,
                                                        child:  Circle(
                                                          color: Colors.green,
                                                          hei: 14,
                                                        )
                                                      ),
                                                      Container(
                                                        width: (width2-60)*0.25,
                                                        alignment: Alignment.centerRight,
                                                        child:  Circle(
                                                          color: Colors.green,
                                                          hei: 14,
                                                        )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: width2,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: width2*0.25,
                                                alignment: Alignment.centerLeft,
                                                child: Text("Mon, 30th Sep",style: ts16(grey3),),
                                              ),
                                              Container(
                                                width: width2*0.25,
                                                alignment: Alignment.center,
                                                child: Text("Wed, 3rd Oct",style: ts16(grey3),),
                                              ),
                                              Container(
                                                width: width2*0.25,
                                                alignment: Alignment.center,
                                                child: Text("Tue, 8th Oct",style: ts16(grey3),),
                                              ),
                                              Container(
                                                width: width2*0.25,
                                                alignment: Alignment.centerRight,
                                                child: Text("Tue, 8th Oct",style: ts16(grey3),),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
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
