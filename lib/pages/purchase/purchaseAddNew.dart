import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandGrid.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/materialTab/materialTabBar.dart';
import 'package:ecommerce_admin/widgets/multiTags.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:ecommerce_admin/widgets/singleDatePicker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

class PurchaseAddNew extends StatefulWidget {
  @override
  State<PurchaseAddNew> createState() => _PurchaseAddNewState();
}

class _PurchaseAddNewState extends State<PurchaseAddNew> with TickerProviderStateMixin{
  TextEditingController key=new TextEditingController();
  TextEditingController dummyTextController=new TextEditingController();
  TextEditingController secret=new TextEditingController();

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  List<String> VendorCompanyList=["GRT","Girias","Harish",];
  String selectedVendorCompany="";
  List<String> VendorTypeList=["District","State","Country",];
  String selectedVendorType="";
  List<String> statusList=["Sell","Offer Process","Out of Stock",];
  String selectedStatus="";

  bool showVendorCompanyDropDown=false;
  bool showVendorTypeDropDown=false;
  bool showStatusDropDown=false;

  DateTime? ExpectedPurchaseDate;

@override
  void initState() {
  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    Provider.of<ProductNotifier>(context,listen: false).initPurchase();
    Provider.of<ProductNotifier>(context,listen: false).PO_initTickerProvider(this);
  });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  SizeConfig().init(context);
    final node=FocusScope.of(context);
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
              Text("Purchase / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                      ProductTextField(
                          width: textFormWidth,
                          title: "Purchase Number",
                          validation: validationList[1],
                          // textEditingController: null,
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: 20,),

                      ProductTextField(
                        width: textFormWidth,
                        title: "Select Vendor Company",
                        validation: validationList[2],
                       // textEditingController: dummyTextController,
                        onComplete: (){},
                        isTextField: false,
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showVendorCompanyDropDown=!showVendorCompanyDropDown;
                            });
                          },
                          width: textFormWidth,
                          hinttext: "Select Vendor Company",
                          selectedValue: selectedVendorCompany,
                          showPopUp: showVendorCompanyDropDown,
                          data: VendorCompanyList,
                          onitemTap: (i){
                            setState(() {
                              showVendorCompanyDropDown=false;
                              selectedVendorCompany=VendorCompanyList[i];
                            });
                          },
                          isToJson: false,
                        ),
                      ),
                      SizedBox(height: 20,),

                      ProductTextField(
                        width: textFormWidth,
                        title: "Select Vendor Type",
                        validation: validationList[2],
                        // textEditingController: dummyTextController,
                        onComplete: (){},
                        isTextField: false,
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showVendorTypeDropDown=!showVendorTypeDropDown;
                            });
                          },
                          width: textFormWidth,
                          hinttext: "Select Vendor Type",
                          selectedValue: selectedVendorType,
                          showPopUp: showVendorTypeDropDown,
                          data: VendorTypeList,
                          onitemTap: (i){
                            setState(() {
                              showVendorTypeDropDown=false;
                              selectedVendorType=VendorTypeList[i];
                            });
                          },
                          isToJson: false,
                        ),
                      ),
                      SizedBox(height: 20,),


                      ProductTextField(
                          width: textFormWidth,
                          title: "Expected Date",
                          validation: validationList[1],
                          onComplete: (){
                            node.unfocus();
                          },
                          isTextField: false,
                          widget: GestureDetector(
                            onTap: () async{
                              final DateTime? picked = await showDatePicker2(
                                  context: context,
                                  initialDate:  ExpectedPurchaseDate==null?DateTime.now():ExpectedPurchaseDate!, // Refer step 1
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100),

                                  builder: (BuildContext context,Widget? child){
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: th.primaryColor3, // header background color
                                          onPrimary: Colors.white, // header text color
                                          onSurface: grey1, // body text color
                                        ),

                                      ),

                                      child: child!,
                                    );
                                  });
                              if (picked != null)
                                setState(() {
                                  ExpectedPurchaseDate = picked;
                                });
                            },
                            child: Container(
                              height: 50,
                              width: textFormWidth,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 15),
                              margin: EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                border: Border.all(color: addNewTextFieldBorder),
                                color: Colors.white
                              ),
                              child: Text(ExpectedPurchaseDate==null?"Select Expected Date":DateFormat(dbDateFormat).format(ExpectedPurchaseDate!),
                              style: ts16(grey2),),
                            ),
                          ),
                      ),
                      SizedBox(height: 20,),


                      ProductTextField(
                          width: textFormWidth,
                          title: "Address",
                          validation: validationList[1],
                          maxlines: 3,
                          // textEditingController: null,
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: 20,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Vendor Address",
                          validation: validationList[1],
                          maxlines: 3,
                          // textEditingController: null,
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 800,
                        alignment: Alignment.center,
                        child: MaterialTabBar(
                          isOpen: true,
                          isClose: false,
                          title: 'Purchase Orders',
                          cartIconClick: (){
                           // Navigator.push(context, _createRoute());
                          },
                          totalItems: 10,
                          closeClick: (){

                          },
                          materialTabController: pn.PO_materialsController,
                          materialCategoryList: pn.materialCategoriesProcessed,
                          searchFunc: (v){
                          //  qn.PO_searchPMaterial(v);
                          },
                          materialsList: pn.PO_filtervendorMaterials,
                          materialTap: (index){
                            /*  setState(() {
                              indentQty='';
                              if(qn.PO_filtervendorMaterials[index].isDiscount==0){
                                disValue='';
                                qn.PO_isDiscountPercentage=true;
                              }
                              else{
                                disValue=qn.PO_filtervendorMaterials[index].discountValue.toString();
                                if(qn.PO_filtervendorMaterials[index].isPercentage==1){
                                  qn.PO_isDiscountPercentage=true;
                                }else if(qn.PO_filtervendorMaterials[index].isAmount==1){
                                  qn.PO_isDiscountPercentage=false;
                                }
                              }
                              discountKeyPad=false;

                              qn.PO_purchaseList.add(
                                  VendorHistoryMaterialDetails(
                                    MaterialName: qn.PO_filtervendorMaterials[index].MaterialName,
                                    materialId: qn.PO_filtervendorMaterials[index].materialId,
                                    materialBrandId: qn.PO_filtervendorMaterials[index].materialBrandId,
                                    materialBrandName: qn.PO_filtervendorMaterials[index].materialBrandName,
                                    primaryUnitId: qn.PO_filtervendorMaterials[index].primaryUnitId,
                                    unitShortCode: qn.PO_filtervendorMaterials[index].unitShortCode,
                                    MaterialCategoryId: qn.PO_filtervendorMaterials[index].MaterialCategoryId,
                                    materialPrice: qn.PO_filtervendorMaterials[index].materialPrice,
                                    isTax: qn.PO_filtervendorMaterials[index].isTax,
                                    isDiscount: qn.PO_filtervendorMaterials[index].isDiscount,
                                    isAmount: qn.PO_filtervendorMaterials[index].isAmount,
                                    isPercentage: qn.PO_filtervendorMaterials[index].isPercentage,
                                    discountAmount: qn.PO_filtervendorMaterials[index].discountAmount,
                                    discountedAmount: qn.PO_filtervendorMaterials[index].discountedAmount,
                                    taxAmount: qn.PO_filtervendorMaterials[index].taxAmount,
                                    taxValue: qn.PO_filtervendorMaterials[index].taxValue,
                                    taxId: qn.PO_filtervendorMaterials[index].taxId,
                                    discountValue: qn.PO_filtervendorMaterials[index].discountValue,
                                    amount: qn.PO_filtervendorMaterials[index].amount,
                                    totalAmount: qn.PO_filtervendorMaterials[index].totalAmount,
                                    purchaseQuantity: TextEditingController()..text="",
                                    CheckBoxValue: qn.PO_filtervendorMaterials[index].CheckBoxValue,
                                    IndentQuantity: qn.PO_filtervendorMaterials[index].IndentQuantity,

                                  )
                              );
                            });


                            showDialog(context: context,
                                barrierDismissible: false,

                                builder: (context){
                                  return StatefulBuilder(
                                    builder:(context,setState){
                                      return Consumer<InventoryNotifier>(
                                        builder: (context,qn,child)=>Dialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), ),

                                          child: Container(
                                            height: 900,
                                            width: 500,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 20,),
                                                Image.asset("assets/images/indentBrand.jpg"),
                                                SizedBox(height: 20,),
                                                Text("${qn.PO_purchaseList[qn.PO_purchaseList.length-1].MaterialName??""}",
                                                  style: TextStyle(fontFamily: 'RR',fontSize: 20,color: AppTheme.gridTextColor),textAlign: TextAlign.center,),
                                                SizedBox(height: 20,),

                                                discountKeyPad?
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("${indentQty??""} ${qn.PO_purchaseList[qn.PO_purchaseList.length-1].unitShortCode??""}",
                                                      style: TextStyle(fontFamily: 'RM',fontSize: 20,color: AppTheme.gridTextColor),textAlign: TextAlign.center,),
                                                    SizedBox(width: 20,),

                                                    Text("${disValue??""}",
                                                      style: TextStyle(fontFamily: 'RM',fontSize: 30,color: AppTheme.gridTextColor),textAlign: TextAlign.center,),
                                                    SizedBox(width: 20,),
                                                    GestureDetector(
                                                      onTap: (){
                                                        qn.updatePO_isDiscountPercentageVendorMaterial(false);

                                                        // if(discountCont.text.isEmpty){
                                                        //   In.vendorMaterialDiscountCalc(key,"");
                                                        // }
                                                        // else{
                                                        //   In.vendorMaterialDiscountCalc(key,discountCont.text);
                                                        // }

                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(milliseconds: 200),
                                                        curve: Curves.easeIn,
                                                        height: 50,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            border: Border.all(color: qn.PO_isDiscountPercentage?AppTheme.addNewTextFieldBorder:Colors.transparent),
                                                            color: qn.PO_isDiscountPercentage?AppTheme.EFEFEF:AppTheme.addNewTextFieldFocusBorder
                                                        ),
                                                        child: Center(
                                                          child: Text("₹",style: qn.PO_isDiscountPercentage?AppTheme.discountDeactive:AppTheme.discountactive,),
                                                        ),

                                                      ),
                                                    ),
                                                    SizedBox(width: 20,),
                                                    GestureDetector(
                                                      onTap: (){
                                                        qn.updatePO_isDiscountPercentageVendorMaterial(true);
                                                        */
                            /* if(discountCont.text.isEmpty){
                                                                                                In.vendorMaterialDiscountCalc(key,"");
                                                                                              }
                                                                                              else{
                                                                                                In.vendorMaterialDiscountCalc(key,discountCont.text);
                                                                                              }*/
                            /*

                                                      },
                                                      child: AnimatedContainer(
                                                        duration: Duration(milliseconds: 200),
                                                        curve: Curves.easeIn,
                                                        height: 50,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            border: Border.all(color: qn.PO_isDiscountPercentage?Colors.transparent:AppTheme.addNewTextFieldBorder),
                                                            color: qn.PO_isDiscountPercentage?AppTheme.addNewTextFieldFocusBorder:AppTheme.EFEFEF
                                                        ),
                                                        child: Center(

                                                          child: Text("%",style: qn.PO_isDiscountPercentage?AppTheme.discountactive:AppTheme.discountDeactive,),
                                                        ),

                                                      ),
                                                    ),
                                                  ],
                                                ):



                                                Text("${indentQty??""} ${qn.PO_purchaseList[qn.PO_purchaseList.length-1].unitShortCode??""}",
                                                  style: TextStyle(fontFamily: 'RM',fontSize: 30,color: AppTheme.gridTextColor),textAlign: TextAlign.center,),

                                                Container(
                                                    margin: EdgeInsets.only(top: 20),
                                                    width: 350,
                                                    child: Wrap(
                                                        spacing: 10,
                                                        runSpacing: 10,
                                                        direction: Axis.horizontal,
                                                        alignment: WrapAlignment.center,
                                                        children: numbers
                                                            .asMap().map((i, element) => MapEntry(i,
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  if (numbers[i] == 'X') {

                                                                    if(!discountKeyPad){
                                                                      indentQty = indentQty.substring(0, indentQty.length - 1);
                                                                    } else{
                                                                      disValue = disValue.substring(0, disValue.length - 1);
                                                                    }

                                                                    reorderLevelIndex=i;
                                                                  }
                                                                  else if (numbers[i] == '.') {


                                                                    if(!discountKeyPad){
                                                                      if(indentQty.length<6 && indentQty.length>=1){
                                                                        if(indentQty.contains('.')){}
                                                                        else{
                                                                          setState(() {
                                                                            indentQty=indentQty+'.';
                                                                          });
                                                                        }
                                                                      }
                                                                    }
                                                                    else{
                                                                      if(disValue.length<4 && disValue.length>=1){
                                                                        if(disValue.contains('.')){}
                                                                        else{
                                                                          setState(() {
                                                                            disValue=disValue+'.';
                                                                          });
                                                                        }
                                                                      }
                                                                    }

                                                                    reorderLevelIndex=i;
                                                                  }
                                                                  else {

                                                                    if(!discountKeyPad){
                                                                      if(indentQty.isEmpty && numbers[i]=='0'){}
                                                                      else{
                                                                        setState(() {
                                                                          reorderLevelIndex = i;
                                                                        });
                                                                        if(indentQty.length<6){
                                                                          setState(() {
                                                                            indentQty=indentQty+numbers[i];
                                                                          });
                                                                        }
                                                                      }
                                                                    }
                                                                    else{
                                                                      if(disValue.isEmpty && numbers[i]=='0'){}
                                                                      else{
                                                                        setState(() {
                                                                          reorderLevelIndex = i;
                                                                        });
                                                                        if(disValue.length<4){
                                                                          setState(() {
                                                                            disValue=disValue+numbers[i];
                                                                          });
                                                                        }
                                                                      }
                                                                    }


                                                                  }
                                                                });
                                                                Timer(Duration(milliseconds: 300), (){
                                                                  setState((){
                                                                    reorderLevelIndex=-1;
                                                                  });
                                                                });
                                                              },
                                                              child: AnimatedContainer(
                                                                  height: 90,
                                                                  width: 90,
                                                                  duration: Duration(milliseconds: 200),
                                                                  curve: Curves.easeIn,
                                                                  decoration: BoxDecoration(
                                                                    color: reorderLevelIndex == i?AppTheme.addNewTextFieldFocusBorder:AppTheme.unitSelectColor,
                                                                    border: Border.all(color: AppTheme.addNewTextFieldBorder),
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                  child: Center(
                                                                      child: Text(numbers[i],
                                                                        style: TextStyle(fontFamily: 'RR', color:reorderLevelIndex == i?Colors.white:AppTheme.gridTextColor, fontSize: 28,),
                                                                        textAlign: TextAlign.center,
                                                                      )
                                                                  )
                                                              ),
                                                            )))
                                                            .values
                                                            .toList()
                                                    )
                                                ),
                                                SizedBox(height: 20,),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Checkbox(
                                                        activeColor: AppTheme.addNewTextFieldFocusBorder,
                                                        value: discountKeyPad,
                                                        // value: qn.PO_purchaseList[qn.PO_purchaseList.length-1].isDiscount==0?false:true,
                                                        onChanged: (v){
                                                          setState((){

                                                            discountKeyPad=v;
                                                          });
                                                          // if(v){
                                                          //   qn.PO_updateIsDiscountFromQtyDialog(qn.PO_purchaseList.length-1,1,disValue,indentQty);
                                                          // }else{
                                                          //   qn.PO_updateIsDiscountFromQtyDialog(qn.PO_purchaseList.length-1,0,'0',indentQty);
                                                          // }

                                                        }
                                                    ),

                                                    Text("Discount",style: TextStyle(fontFamily: 'RM',fontSize: 24,color: AppTheme.addNewTextFieldFocusBorder))

                                                  ],
                                                ),
                                                SizedBox(height: 20,),
                                                GestureDetector(
                                                  onTap: (){
                                                    qn.PO_updateIsDiscountFromQtyDialog(qn.PO_purchaseList.length-1,disValue,indentQty);
                                                    // if(indentQty.isNotEmpty){
                                                    //   qn.PO_updateIsDiscountFromQtyDialog(qn.PO_purchaseList.length-1,disValue,indentQty);
                                                    //  // qn.updatePO_purchaseListFromQuantityDialog(qn.PO_purchaseList.length-1,indentQty);
                                                    // }

                                                    Navigator.pop(context);

                                                  },
                                                  child: Container(
                                                    height: 70,
                                                    width: 350,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        color: AppTheme.addNewTextFieldFocusBorder
                                                    ),
                                                    child: Center(
                                                      child: Text("Done",style: AppTheme.TSWhite20,),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    qn.removePO_purchaseList(qn.PO_purchaseList.length-1);
                                                    Navigator.pop(context);

                                                  },
                                                  child: Container(
                                                    height: 70,
                                                    width: 350,
                                                    // decoration: BoxDecoration(
                                                    //     borderRadius: BorderRadius.circular(10),
                                                    //     color: AppTheme.addNewTextFieldFocusBorder
                                                    // ),
                                                    child: Center(
                                                      child: Text("Cancel",style: TextStyle(fontFamily: 'RL',fontSize: 20,color: Color(0xFFA1A1A1))),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                            );*/
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Select Status",
                        validation: validationList[2],
                        // textEditingController: dummyTextController,
                        onComplete: (){},
                        isTextField: false,
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showStatusDropDown=!showStatusDropDown;
                            });
                          },
                          width: textFormWidth,
                          hinttext: "Select Status",
                          selectedValue: selectedStatus,
                          showPopUp: showStatusDropDown,
                          data: statusList,
                          onitemTap: (i){
                            setState(() {
                              showStatusDropDown=false;
                              selectedStatus=statusList[i];
                            });
                          },
                          isToJson: false,
                        ),
                      ),
                      SizedBox(height: 20,),

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
              GestureDetector(
                onTap: (){
                  setState(() {
                    showVendorCompanyDropDown=false;
                    showVendorTypeDropDown=false;
                    showStatusDropDown=false;
                  });
                },
                child: Container(
                  height:showVendorCompanyDropDown||showVendorTypeDropDown||showStatusDropDown? SizeConfig.screenHeight:0,
                  width: SizeConfig.screenWidth,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

