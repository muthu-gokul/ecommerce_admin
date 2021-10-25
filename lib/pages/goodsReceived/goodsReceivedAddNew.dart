import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandGrid.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:ecommerce_admin/widgets/materialTab/materialTabBar.dart';
import 'package:ecommerce_admin/widgets/multiTags.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:ecommerce_admin/widgets/singleDatePicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

class GoodsReceivedEdit extends StatefulWidget {
  @override
  State<GoodsReceivedEdit> createState() => _GoodsReceivedEditState();
}

class _GoodsReceivedEditState extends State<GoodsReceivedEdit> with TickerProviderStateMixin{
  late double width;
  List<GridHeaderModel> gridHeaderList=[
    GridHeaderModel(columnName: "Item Name",),
    GridHeaderModel(columnName: "Ordered Qty",),
    GridHeaderModel(columnName: "Received Qty",width: 200),
    GridHeaderModel(columnName: "Amount"),
    GridHeaderModel(columnName: "Actions",width: 100),
  ];

  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final node=FocusScope.of(context);
    width=SizeConfig.screenWidth!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,
        elevation: 0,
        leadingWidth: 100,
        leading: BackBtn(ontap: (){
          Navigator.pop(context);
        }),
        title: Container(
          height: 50,
          //  color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,
          child: Row(
            children: [
              Text("Goods Received / Edit",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
            ],
          ),
        ),
      ),
      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      GridWithWidgetParam(
                          headerHeight: headerHeight,
                          headerWidth: width,
                          gridHeaderList: gridHeaderList,
                          showAdd: false,
                          showExport: false,
                          addBtnTap: (){

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
                          bodyHeight: SizeConfig.screenHeight!-230,
                          bodyWidth: width,
                          bodyWidget: Column(
                            children: pn.goodsAddNewList.asMap().map((key, value) => MapEntry(key,
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
                                        title: value.itemName,
                                      ):Container(),
                                      gridHeaderList[1].isActive?GridContent(
                                        width:gridHeaderList[1].width ,
                                        alignment: gridHeaderList[1].alignment,
                                        title: value.orderedQty,
                                      ):Container(),
                                      gridHeaderList[2].isActive?GridContent(
                                        width:gridHeaderList[2].width ,
                                        alignment: gridHeaderList[2].alignment,
                                        title: value.receivedQty,
                                      ):Container(),
                                      gridHeaderList[3].isActive?GridContent(
                                        width:gridHeaderList[3].width ,
                                        alignment: gridHeaderList[3].alignment,
                                        title: value.amount,
                                      ):Container(),

                                      gridHeaderList[4].isActive?Container(
                                        width:gridHeaderList[4].width ,
                                        alignment: gridHeaderList[4].alignment,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(onPressed: (){
                                              // setState(() {
                                              //   GR_selectedMaterialIndex=key;
                                              // });
                                              // if(value.isReturn){
                                              //   CustomAlert(
                                              //       callback: (){
                                              //         Navigator.pop(context);
                                              //         setState(() {
                                              //           value.isReturn=false;
                                              //           value.returnQuantity=0.0;
                                              //           value.returnReason=null;
                                              //         });
                                              //
                                              //       }
                                              //   ).yesOrNoDialog(context, "", "Already Returned.\nDo you want to cancel Return ?");
                                              // }
                                              // else{
                                                showDialog(context: context, builder: (ctx)=>Dialog(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Container(
                                                    height: 450,
                                                    width: 500,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        SvgPicture.asset("assets/icons/return.svg",height: 120,color:th.primaryColor1,),

                                                        SizedBox(height: 20,),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Do you want to Return ',
                                                            style: TextStyle(fontFamily: 'RR',fontSize: 24,color: grey2),
                                                            children: <TextSpan>[
                                                              TextSpan(text: '${value.itemName} ?',
                                                                  style: TextStyle(fontFamily: 'RM',fontSize: 24,color: grey2)
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 20,),
                                                        GestureDetector(
                                                          onTap: (){
                                                            Navigator.pop(ctx);

                                                            // setState((){
                                                            //   reasonController.clear();
                                                            //   selectedReason=-1;
                                                            // });
                                                            //
                                                            // reasonDialog(key,value.receivedQuantity);
                                                          },
                                                          child: Container(
                                                            height: 60,
                                                            width: 400,
                                                            decoration: BoxDecoration(
                                                                color: th.primaryColor3,
                                                                borderRadius: BorderRadius.circular(10)
                                                            ),
                                                            child: Center(
                                                              child: Text("Yes to All",style: ts18(Colors.white),),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 20,),
                                                        GestureDetector(
                                                          onTap: (){
                                                            Navigator.pop(ctx);
                                                            // setState(() {
                                                            //   MM_ReOrderLevel="";
                                                            //   selectedReason=-1;
                                                            // });
                                                            // someQtyDialog(key,value.orderedQuantity);
                                                          },
                                                          child: Container(
                                                            height: 60,
                                                            width: 400,
                                                            decoration: BoxDecoration(
                                                                color: addNewTextFieldBorder.withOpacity(0.5),
                                                                border: Border.all(color: addNewTextFieldBorder),
                                                                borderRadius: BorderRadius.circular(10)
                                                            ),
                                                            child: Center(
                                                              child: Text("Some Qty Only",
                                                                style: TextStyle(fontFamily: 'RR',fontSize: 20,color: grey2),),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                );

                                            //  }


                                            }, icon: Icon(Icons.assignment_return_outlined,size: 30,color: Colors.red.withOpacity(0.7),))
                                            // ActionIcon(
                                            //     ontap: (){},
                                            //     imgColor: grey1, img: "assets/icons/edit.svg",
                                            //
                                            // ),

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

                      SizedBox(height: 50,),
                      Container(
                        width: textFormWidth+(40),
                        alignment: Alignment.center,
                        child: SaveBtn(ontap: (){



                        }),
                      ),

                      SizedBox(height: 100,),
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

