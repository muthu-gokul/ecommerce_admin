import 'package:ecommerce_admin/model/productModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/customers/customerOrderDetailView.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/linearProgressBar.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';


class OrdersListView extends StatefulWidget {
  const OrdersListView({Key? key}) : super(key: key);

  @override
  _OrdersListViewState createState() => _OrdersListViewState();
}

class _OrdersListViewState extends State<OrdersListView> {
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

  String selectedStatus="";
  List<String> statusList=["Processing","Shipped","Out of Delivery","Delivered","Cancel"];
  bool showStatusDropDown=false;
  TextEditingController cancelReasonController=new TextEditingController();

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
    final node=FocusScope.of(context);
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
                                padding:  EdgeInsets.only(left: 0,bottom: 20),
                                alignment: Alignment.centerLeft,
                                child: Text("Item From Order #Order0002",style: ts18(grey1,fontsize: 20),)
                            ),
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
                            SizedBox(height: 10,),
                            Text("  10 points you will earn after on 24-10-2029",style: ts18(Colors.green[800]!,fontsize: 22), ),
                            SizedBox(height: 50,),
                            Container(
                                padding:  EdgeInsets.only(left: 0,bottom: 20),
                                alignment: Alignment.centerLeft,
                                child: Text("Order Status",style: ts18(grey1,fontsize: 26,fontfamily: 'RM'),)
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                      width: 150,
                                      alignment: Alignment.centerLeft,
                                      child: Text("Order Status",style: ts18(grey1,fontsize: 18,fontfamily: 'RR'),)
                                  ),
                                  CustomPopup(
                                      hintText: "Select Status",
                                      width: 400,
                                      data: statusList,
                                      selectedValue: selectedStatus,
                                      onSelect: (v){
                                        setState(() {
                                          selectedStatus=v;
                                        });
                                      },
                                      leftMargin: 190,
                                      color: Colors.white,
                                  )

                                ],
                              ),
                            ),
                            selectedStatus=="Cancel"?Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  Container(
                                      width: 150,
                                      alignment: Alignment.centerLeft,
                                      child: Text("Reason for Cancel",style: ts18(grey1,fontsize: 18,fontfamily: 'RR'),)
                                  ),
                                  AddNewLabelTextField(
                                      margin: EdgeInsets.only(left: 20),
                                      width: textFormWidth,
                                      hintText: "Enter Reason",
                                      scrollPadding: 600,
                                      onEditComplete: (){
                                        node.unfocus();
                                      },
                                  )

                                ],
                              ),
                            ):Container(),
                            SizedBox(height: 30,),
                            Padding(
                              padding: EdgeInsets.only(left: 200),
                              child: SaveBtn(ontap: (){},
                              title: "Update",
                              ),
                            ),

                            //Customer Information
                            Container(
                                padding:  EdgeInsets.only(top: 30,bottom: 20),
                                alignment: Alignment.centerLeft,
                                child: Text("Customer Information",style: ts18(grey1,fontsize: 26,fontfamily: 'RM'),)
                            ),
                            Container(
                           //     padding:  EdgeInsets.only(top: 30,bottom: 20),
                                alignment: Alignment.centerLeft,
                                child: Text("Delivery Address",style: ts18(grey1,fontsize: 22,fontfamily: 'RR'),)
                            ),
                            Container(
                               padding:  EdgeInsets.only(top: 20,left: 50),
                                alignment: Alignment.centerLeft,
                                child: Text("Raghu",style: ts18(grey1,fontsize: 18,fontfamily: 'RR'),)
                            ),
                            Container(
                               padding:  EdgeInsets.only(top: 10,left: 50),
                                alignment: Alignment.centerLeft,
                                width: 400,
                                child: Text("No:4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai-600095.",style: ts18(grey1,fontsize: 18,fontfamily: 'RR'),)
                            ),
                            Container(
                                padding:  EdgeInsets.only(top: 10,left: 50),
                                alignment: Alignment.centerLeft,
                                child: Text("9976789986",style: ts18(grey1,fontsize: 18,fontfamily: 'RR'),)
                            ),
                            Container(
                               padding:  EdgeInsets.only(top: 30),
                                alignment: Alignment.centerLeft,
                                child: Text("Billing Address",style: ts18(grey1,fontsize: 22,fontfamily: 'RR'),)
                            ),
                            Container(
                               padding:  EdgeInsets.only(top: 20,left: 50),
                                alignment: Alignment.centerLeft,
                                child: Text("Raghu",style: ts18(grey1,fontsize: 18,fontfamily: 'RR'),)
                            ),
                            Container(
                               padding:  EdgeInsets.only(top: 10,left: 50),
                                alignment: Alignment.centerLeft,
                                width: 400,
                                child: Text("No:4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai-600095.",style: ts18(grey1,fontsize: 18,fontfamily: 'RR'),)
                            ),
                            Container(
                                padding:  EdgeInsets.only(top: 10,left: 50),
                                alignment: Alignment.centerLeft,
                                child: Text("9976789986",style: ts18(grey1,fontsize: 18,fontfamily: 'RR'),)
                            ),


                            //Order Summary
                            Container(
                                padding:  EdgeInsets.only(top: 30,bottom: 10),
                                alignment: Alignment.centerLeft,
                                child: Text("Order Summary",style: ts18(grey1,fontsize: 26,fontfamily: 'RM'),)
                            ),
                           orderSummary("Grand Total", 43434),
                           orderSummary("Delivery Charge", 200),
                           orderSummary("Payment Type", "COD, Internet Banking"),
                           orderSummary("Payment Status", "Processing"),
                           orderSummary("Payment ID", "DGDFDF54545"),


                            //Invoice Details
                            Container(
                                padding:  EdgeInsets.only(top: 30,bottom: 10),
                                alignment: Alignment.centerLeft,
                                child: Text("Invoice Details",style: ts18(grey1,fontsize: 26,fontfamily: 'RM'),)
                            ),
                            orderSummary("Number", "#5454"),
                            orderSummary("Seller GST", "FDFD54545"),
                            orderSummary("Purchase GST", "545EFFDDF"),
                            SizedBox(height: 100,)
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

orderSummary(String title,dynamic value){
    return  Container(
      margin: EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 180,
              alignment: Alignment.centerLeft,
              child: Text("$title",style: ts18(grey1,fontsize: 19.5,fontfamily: 'RR'),)
          ),
          Container(
            //width: 150,
              constraints: BoxConstraints(
                  maxWidth: SizeConfig.screenWidth!-300
              ),
              alignment: Alignment.centerLeft,
              child: Text("$value",style: ts18(grey3,fontsize: 18,fontfamily: 'RR'),)

          ),


        ],
      ),
    );
}


}
