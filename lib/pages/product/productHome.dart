import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import 'categoryAddNew.dart';
class ProductHome extends StatefulWidget {
  const ProductHome({Key? key}) : super(key: key);

  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  late double width,width2,leftPos,middleWidth;
  int selectedTab=1;

  bool isSelectAll=false;
  bool showDeleteAll=false;
  // @override
  // void initState() {
  //   leftPos=width*
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-100;
    width2=width*0.7;//gridWidth , tabHeader Width
    middleWidth=width2-(width2*0.3)-300;
    if(selectedTab==1){
      leftPos=width2*0.15;
    }
    else if(selectedTab==2){
      //leftPos=(width2*0.5)+150;
      leftPos=(width2*0.15)+150+middleWidth;
    }
    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=> Consumer<ProductNotifier>(
        builder: (context,pn,child)=> Container(
          height: SizeConfig.screenHeight!-50,
          width: width,
          color: bgColor,
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              //TabBar
              Container(

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Container(
                      width: width2,
                      height: 50,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 2,
                            child: Container(
                              height: 1,
                              width: width2,
                                color: grey4
                            ),
                          ),
                          AnimatedPositioned(
                            duration: animeDuration,
                            curve: animeCurve,
                            bottom: 0,
                            left: leftPos,
                            child: Container(
                                height: 5,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: th.primaryColor4,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: th.primaryColor4.withOpacity(0.45),
                                          blurRadius: 5,
                                          spreadRadius: 0,
                                          offset: Offset(0,2)
                                      )
                                    ]
                                ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,

                            child: Container(
                              width: width2,
                              child: Row(
                                children: [
                                  SizedBox(width: width2*0.15,),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selectedTab=1;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 150,
                                      color: Colors.transparent,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.card_travel,color: selectedTab==1?th.primaryColor3:grey3,),
                                          SizedBox(width: 10,),
                                          Text("CATEGORY",style: TextStyle(fontFamily: 'RR',color: selectedTab==1?th.primaryColor4:grey3,fontSize: 14,letterSpacing: 0.2),)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                //  SizedBox(width: width2*0.35,),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selectedTab=2;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 150,
                                      color: Colors.transparent,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.card_travel,color: selectedTab==2?th.primaryColor3:grey3,),
                                          SizedBox(width: 10,),
                                          Text("PRODUCT",style: TextStyle(fontFamily: 'RR',color: selectedTab==2?th.primaryColor4:grey3,fontSize: 14,letterSpacing: 0.2),)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width2*0.15,),
                                ],
                              ),
                            ),
                          )

                        ],
                      ),

                    ),
                    Spacer(),


                  ],
                ),
              ),
              SizedBox(height: 20,),
              //Body
              selectedTab==1?GridWithWidgetParam(
                  headerHeight: headerHeight,
                  headerWidth: width,
                  gridHeaderList: [],
                  filterOnTap: (i){},
                  addBtnTap: (){
                    Navigator.push(context, pr.PageRoute().slideFromLeftToRight(CategoryAddNew()));
                  },
                  searchFunc: (v){},
                  showAdd: true,
                  headerWidget: Row(
                    children: [
                      GridHeader(
                        width: 200,
                        title: "Category Name",
                      ),
                      GridHeader(
                        width: 100,
                        title: "Logo",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Created At",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Updated At",
                      ),
                      GridHeader(
                        width: 100,
                        title: "Actions",
                      ),
                    ],
                  ),
                  bodyHeight: SizeConfig.screenHeight!-240,
                  bodyWidth: width,
                  bodyWidget: Column(
                    children: pn.categoryList.asMap().map((key, value) => MapEntry(key,
                        Container(
                          //width: width,
                          padding: bodyPadd,
                          margin: bodyMargin,
                          decoration: bodyDecoration,
                          constraints: bodyConstraints,
                          child: Row(
                            children: [
                              GridContent(
                                width: 200,
                                title: value.categoryName,
                              ),
                              Container(
                                width: 100,
                                height: 45,
                                child: Image.network("https://bc-storage.sfo2.digitaloceanspaces.com/girias/assets/girias-logo.png"),
                              ),
                              GridContent(
                                width: 150,
                                title:value.createdAt,
                              ),
                              GridContent(
                                width: 150,
                                title: value.updatedAt,
                              ),
                              Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ActionIcon(ontap: (){
                                      print("Ffff");
                                    }, imgColor: Colors.black, img: "assets/icons/edit.svg"),
                                    ActionIcon(ontap: (){
                                    }, imgColor: Colors.red, img: "assets/icons/delete.svg"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                    )
                    ).values.toList(),
                  )
              ):
              GridWithWidgetParam(
                  headerHeight: headerHeight,
                  headerWidth: width,
                  showDeleteAll: showDeleteAll,
                  showAdd: true,
                  gridHeaderList: [],
                  filterOnTap: (i){},
                  addBtnTap: (){
                    Navigator.push(context, pr.PageRoute().slideFromLeftToRight(ProductAddNew()));
                  },
                  searchFunc: (v){},
                  headerWidget: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        child: Checkbox(
                            value: isSelectAll,
                            activeColor: th.primaryColor2,
                            onChanged: (v){
                          setState(() {
                            isSelectAll=v!;
                            showDeleteAll=v;
                            pn.products.forEach((element) {element.isSelect=v;});
                          });
                        }),
                      ),
                      GridHeader(
                        width: 100,
                        title: "Product Id",
                      ),
                      GridHeader(
                        width: 100,
                        title: "Image",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Name",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Actual Price",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Offer Price",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Created At",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Status",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Stock",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Current Qty",
                      ),
                      GridHeader(
                        width: 100,
                        title: "Publish",
                      ),
                      GridHeader(
                        width: 100,
                        title: "Today\'s Deal",
                        textAlign:  TextAlign.center,
                      ),
                      GridHeader(
                        width: 100,
                        title: "Action",
                      ),
                    ],
                  ),
                  bodyHeight: SizeConfig.screenHeight!-240,
                  bodyWidth: width,
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
                              Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                child: Checkbox(
                                    value: value.isSelect,
                                    activeColor: th.primaryColor2,
                                    onChanged: (v){
                                          setState(() {
                                            value.isSelect=v!;
                                          });
                                          int count=pn.products.where((element) => element.isSelect==true).toList().length;
                                          if(count==pn.products.length){
                                            setState(() {
                                              isSelectAll=true;
                                              showDeleteAll=true;
                                            });
                                          }
                                          else if(count==0){
                                            setState(() {
                                              isSelectAll=false;
                                              showDeleteAll=false;
                                            });
                                          }
                                          else{
                                            setState(() {
                                              isSelectAll=false;
                                              showDeleteAll=true;
                                            });
                                          }
                                }),
                              ),
                              GridContent(
                                width: 100,
                                title: value.productId,
                              ),
                              Container(
                                width: 100,
                                height: 45,
                                child: CachedNetworkImage(
                                  imageUrl: "https://st.depositphotos.com/2309453/2605/i/950/depositphotos_26059155-stock-photo-woman-wearing-flip-flops-while.jpg",
                                  placeholder: (context, url) => Container(
                                      height: 25,
                                      width: 25,
                                      alignment: Alignment.center,
                                      child: CircularProgressIndicator()
                                  ),
                                  errorWidget: (context, url, error) => Container(),
                                ),
                                //child: Image.network("https://st.depositphotos.com/2309453/2605/i/950/depositphotos_26059155-stock-photo-woman-wearing-flip-flops-while.jpg"),
                              ),
                              GridContent(
                                width: 150,
                                title:value.productName,
                              ),
                              GridContent(
                                width: 150,
                                title: value.productActualPrice,
                              ),
                              GridContent(
                                width: 150,
                                title: value.productOfferPrice,
                              ),
                              GridContent(
                                width: 150,
                                title: value.createdAt,
                              ),
                              GridContent(
                                width: 150,
                                title: value.status,
                              ),
                              GridContent(
                                width: 150,
                                title: value.productStock,
                              ),
                              GridContent(
                                width: 150,
                                title: value.currentQty,
                              ),
                              Container(
                                width: 100,
                                child: CustomSwitch(
                                  value: value.publish,
                                  onchange: (v){
                                    setState(() {
                                      value.publish=v;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 100,
                                child: CustomSwitch(
                                  value: value.todaysDeal,
                                  onchange: (v){
                                    setState(() {
                                      value.todaysDeal=v;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ActionIcon(ontap: (){

                                    }, imgColor: Colors.black, img: "assets/icons/edit.svg"),
                                    ActionIcon(ontap: (){
                                    }, imgColor: Colors.red, img: "assets/icons/delete.svg"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                    )
                    ).values.toList(),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}




