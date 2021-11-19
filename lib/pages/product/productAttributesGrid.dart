import 'package:ecommerce_admin/Otp-style.dart';
import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandGrid.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/circle.dart';
import 'package:ecommerce_admin/widgets/customAppBar.dart';
import 'package:ecommerce_admin/widgets/customCheckBox.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:ecommerce_admin/widgets/multiTags.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/animeDialog.dart';
import 'package:scutiwidgets/innerShadowTBContainer.dart';
import 'package:scutiwidgets/size.dart';

import 'productAddNew.dart';
class ProductAttributesGrid extends StatefulWidget {
  @override
  State<ProductAttributesGrid> createState() => _ProductAttributesGridState();
}

class _ProductAttributesGridState extends State<ProductAttributesGrid> {
  TextEditingController title=new TextEditingController();
  TextEditingController slug=new TextEditingController();
  String selectedCategory="";
  XFile? image=null;
  String selectedNullImage="";
  List<bool> validationList= List<bool>.generate(3, (i) => false);
  List<int> iconList= List<int>.generate(10,(i)=>i+1);

  List<XFile>? productImages=[];
Color color1=Color(0xffD9DDEA);

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    SizeConfig().init(context);
    List<GridHeaderModel> gridHeaderList=[
      GridHeaderModel(columnName: "Product",),
      GridHeaderModel(columnName: "Color"),
      GridHeaderModel(columnName: "Size",width: 100),
      GridHeaderModel(columnName: "Upload Image",alignment: Alignment.center,width: 170),
      GridHeaderModel(columnName: "Regular Price"),
      GridHeaderModel(columnName: "Offer Price"),
      GridHeaderModel(columnName: "Product Stock",width: 135),
      GridHeaderModel(columnName: "Actions",width: 80),
    ];
    return Scaffold(

      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
            builder: (context,pn,child)=> Stack(
              children: [
                Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,

                  color: th.addNewAppBarColor,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: cA1,
                      children: [
                        CustomAppBarAddNew(
                          title: "Create T-Shirt Variations from all Attributes",
                          diffColor: true,
                        ),
                        SizedBox(height: inBetweenHeight,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomCheckBox(show: true, ontap: (){}),
                            SizedBox(width: 20,),
                            Text("Create Variations from all Attributes",
                              style: ts14(grey1,fontfamily: 'RL'),
                            )
                          ],
                        ),
                        SizedBox(height: inBetweenHeight,),
                        GridWithWidgetParam(
                            headerHeight: headerHeight,
                            headerWidth: SizeConfig.screenWidth!,
                            gridHeaderList: gridHeaderList,
                            showAdd: false,
                            showExport: false,
                            showFilter: false,
                            showSearchAll: false,
                            addBtnTap: (){
                             // Navigator.push(context, pr.PageRoute().fade(PincodeAddNew()));
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
                            bodyHeight: SizeConfig.screenHeight!-270,
                            bodyWidth: SizeConfig.screenWidth!,
                            bodyWidget: Column(
                              children: pn.variants.asMap().map((key, value) => MapEntry(key,
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
                                          title: value.color,
                                        ):Container(),
                                        gridHeaderList[2].isActive?GridContent(
                                          width:gridHeaderList[2].width ,
                                          alignment: gridHeaderList[2].alignment,
                                          title:"${value.size}",
                                        ):Container(),
                                        gridHeaderList[3].isActive?Container(
                                          width:gridHeaderList[3].width ,
                                          alignment: gridHeaderList[3].alignment,
                                          child: GestureDetector(
                                            onTap: (){
                                              showDialog(
                                                  barrierDismissible: false,
                                                  barrierColor: Colors.black54,
                                                  context: context,
                                                  builder: (ctx)
                                                  {
                                                    return StatefulBuilder(
                                                        builder: (BuildContext ctx, StateSetter setState)=>Dialog(
                                                          clipBehavior: Clip.antiAlias,
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                          backgroundColor: Colors.transparent,
                                                          child: Container(
                                                            height: 560,
                                                            width: 370,
                                                            //color: Colors.black.withOpacity(0.5),
                                                            //  color: Colors.transparent,
                                                            child: Stack(
                                                              children: [
                                                                Container(
                                                                    height: 540,
                                                                    width: 350,
                                                                    margin: EdgeInsets.only(top: 20),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.white,
                                                                        borderRadius: BorderRadius.circular(10)
                                                                    ),

                                                                    child: Column(
                                                                        children: [
                                                                          SizedBox(height: 20,),
                                                                          Container(
                                                                            width: 300,
                                                                            child: Text("You can upload multiple images for this product ?",
                                                                              style: TextStyle(fontSize: 20,fontFamily: 'RL',color: grey1,letterSpacing: 0.1,
                                                                                  height: 1.5
                                                                              )
                                                                              ,textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                          SizedBox(height: 20,),
                                                                          InnerShadowTBContainer(
                                                                            height: 350,
                                                                            width: 320,
                                                                            color: Colors.white,
                                                                            child: PickMultiImage(
                                                                                images: productImages??[],
                                                                                title: "Upload Product",
                                                                                cb: (c){
                                                                                  setState(() {
                                                                                    productImages=c;
                                                                                  });
                                                                                },
                                                                                deleteCb: (i){
                                                                                  if(productImages!=null){
                                                                                    setState(() {
                                                                                      productImages!.removeAt(i);
                                                                                    });
                                                                                  }
                                                                                },
                                                                                wid: 320,
                                                                                 hei: 350,
                                                                              imgWid: 135,
                                                                            ),
                                                                          ),
                                                                          SizedBox(height: 20,),
                                                                          SaveBtn2(ontap: (){}, color: th.primaryColor2,title: "Yes",)
                                                                        ]
                                                                    )
                                                                ),
                                                                Positioned(
                                                                    right: 0,
                                                                    child: GestureDetector(
                                                                      onTap: (){
                                                                        Navigator.pop(ctx);
                                                                      },
                                                                      child: Circle(
                                                                        hei: 50,
                                                                        color: th.primaryColor4,
                                                                        widget: Icon(Icons.clear,color: Colors.white,size: 25,),
                                                                      ),
                                                                    )
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                    );
                                                  }
                                              );
                                             /* AnimeDialog().slideFromBottomToTop(
                                                context,
                                                Dialog(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 200,
                                                        width: 300,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              );*/
                                            },
                                            child: Container(
                                              width: 50,
                                              color: Colors.transparent,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(top: 0),
                                                      child: Image.asset("assets/images/addnew-brand.jpg",height: 35,)),
                                                  Positioned(
                                                    right: 0,
                                                    child: Circle(
                                                        hei: 20,
                                                        color: Colors.red,
                                                        widget: Center(
                                                          child: Text("6",style: ts14(Colors.white,fontfamily: 'RM'),),
                                                        ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ):Container(),
                                        gridHeaderList[4].isActive?Container(
                                          width:gridHeaderList[4].width ,
                                          alignment: gridHeaderList[4].alignment,
                                          padding: gridHeaderList[4].edgeInsets,
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(10,5,10,5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7),
                                              color: color1
                                            ),
                                            child: Text("${value.regularPrice}",style: ts16(Color(0xff838588)),),
                                          ),
                                        ):Container(),
                                        gridHeaderList[5].isActive?Container(
                                          width:gridHeaderList[5].width ,
                                          alignment: gridHeaderList[5].alignment,
                                          padding: gridHeaderList[4].edgeInsets,
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(10,5,10,5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7),
                                                color: color1
                                            ),
                                            child: Text("${value.offerPrice}",style: ts16(Color(0xff838588)),),
                                          ),
                                        ):Container(),
                                        gridHeaderList[6].isActive?GridContent(
                                          width:gridHeaderList[6].width ,
                                          alignment: gridHeaderList[6].alignment,
                                          title:"${value.stock}",
                                        ):Container(),

                                        gridHeaderList[7].isActive?Container(
                                          width:gridHeaderList[7].width ,
                                          alignment: gridHeaderList[7].alignment,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SaveBtn2(ontap: (){
                              Navigator.pop(context);
                            }, color: color1,title: "Cancel",textColor: grey2,),
                            SizedBox(width: 20,),
                            SaveBtn2(ontap: (){
                              Navigator.pop(context);
                            }, color: th.primaryColor2,title: "Save Changes",),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
               /* Container(
                  height: iconOpen?SizeConfig.screenHeight:0,
                  width: SizeConfig.screenWidth,
                  color: Colors.black54,
                ),*/

              ],
            )
        ),
      ),
    );
  }
}

