import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import '../../constants.dart';



class BrandGrid extends StatefulWidget {
  const BrandGrid({Key? key}) : super(key: key);

  @override
  _BrandGridState createState() => _BrandGridState();
}

class _BrandGridState extends State<BrandGrid> {
  late double width;
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
                  gridHeaderList: [],
                  filterOnTap: (i){},
                  addBtnTap: (){
                    Navigator.push(context, pr.PageRoute().slideFromLeftToRight(BrandAddNew()));
                  },
                  searchFunc: (v){},
                  headerWidget: Row(
                    children: [
                      GridHeader(
                        width: 200,
                        title: "Title",
                      ),
                      GridHeader(
                        width: 200,
                        title: "Slug",
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
                  bodyHeight: SizeConfig.screenHeight!-150,
                  bodyWidth: width,
                  bodyWidget: Column(
                    children: pn.brandList.asMap().map((key, value) => MapEntry(key,
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
                                title: value.title,
                              ),
                              GridContent(
                                width: 200,
                                title: value.slug,
                              ),
                              Container(
                                width: 100,
                                height: 45,
                                child: Image.network("https://bc-storage.sfo2.digitaloceanspaces.com/girias/assets/girias-logo.png"),
                              ),
                              // GridContent(
                              //   width: 100,
                              //   title: "Logo",
                              // ),
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
              ),

            ],
          ),
        ),
      ),
    );
  }
}
