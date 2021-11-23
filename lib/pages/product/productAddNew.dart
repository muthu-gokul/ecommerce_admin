import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandGrid.dart';
import 'package:ecommerce_admin/pages/product/productAttributesGrid.dart';
import 'package:ecommerce_admin/widgets/addMoreTextFieldAnimation.dart';
import 'package:ecommerce_admin/widgets/arrowAnimation.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/deleteBtnText.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customAppBar.dart';
import 'package:ecommerce_admin/widgets/customCheckBox.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/multiTags.dart';
import 'package:ecommerce_admin/widgets/overlayContainer.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:ecommerce_admin/widgets/searchDropdown/dropdown_search.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/expandedSection.dart';

import 'package:scutiwidgets/size.dart';
class ProductAddNew extends StatefulWidget {
  @override
  State<ProductAddNew> createState() => _ProductAddNewState();
}

class _ProductAddNewState extends State<ProductAddNew> {

  late double width1;

  TextEditingController pName=new TextEditingController();//pName=productName
  TextEditingController pslug=new TextEditingController();
  TextEditingController dummyTextController=new TextEditingController();
  String selectedBrand="";
  String selectedCategory="";
  String selectedSubCategory="";
  String selectedProductType="";

  TextEditingController pStock=new TextEditingController();
  TextEditingController pAlertStock=new TextEditingController();
  TextEditingController pActualPrice=new TextEditingController();
  TextEditingController pOfferPrice=new TextEditingController();
  TextEditingController pShippingPrice=new TextEditingController();
  TextEditingController pPincode=new TextEditingController();
  TextEditingController pCashBack=new TextEditingController();

  String selectedUnit="";
  TextEditingController pWebsiteUrl=new TextEditingController();
  TextEditingController pYouTubeUrl=new TextEditingController();



  TextEditingController pDescription=new TextEditingController();
  List<String> tagsList=[];
  List<String> seoKeyWordsList=[];
  List<String> seoTitlesList=[];

  //Add Values
  int selectedHeading=-1;
  bool isAddValueClick=false;
  // List<SubAddValues> tempSubAddValues=[];
  List<AddValues> tempAddValues=[];


  bool isProductAvailable=false;
  bool hideProduct=false;
  int priceApi=1;

  List<dynamic> highLightsList=[];

  String selectedImage="";
  XFile? image=null;
  List<XFile>? productImages=[];

  List<bool> validationList= List<bool>.generate(3, (i) => false);


  bool showBrandDropDown=false;
  bool showCategoryDropDown=false;
  bool showSubCategoryDropDown=false;
  bool showUnitDropDown=false;

  bool showAlert=false;
  bool showQtyRest=false;
  bool showPriceDetails=false;
  bool showShippingPrice=false;
  bool showReturnable=false;
  bool showProductDescription=false;
  bool showAttributeTab=false;

  void addTempSubValues(int i){
      setState(() {
        tempAddValues[i].subAddValuesList.add(
          SubAddValues(
              heading: TextEditingController(),
              title: TextEditingController(),
              value: TextEditingController(),
              innerSubAddValuesList: []
          )
        );
      });
  }
  void addInnerTempSubValues(int i,int j){
    setState(() {
      tempAddValues[i].subAddValuesList[j].innerSubAddValuesList.add(
          SubAddValues(
              heading: TextEditingController(),
              title: TextEditingController(),
              value: TextEditingController(),
              innerSubAddValuesList: []
          )
      );
    });
  }
  void addTempValues(){
    setState(() {
      tempAddValues.add(
          AddValues(
              title: TextEditingController(),
              //selectedHeading: -1,
              selectedHeading: 1,
              subAddValuesList: []
          )
      );
    });
  }

  addHighlights(){
    setState(() {
      highLightsList.add(TextEditingController());
    });
  }

  ScrollController scrollController=new ScrollController();

  @override
  void initState() {
   addHighlights();
   scrollController.addListener(() {
    // print(scrollController.offset);
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final node=FocusScope.of(context);
  //  width1=SizeConfig.screenWidth!-40;
    width1=textFormWidth+275;
    return Scaffold(

      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  color: th.addNewBodyColor,
                  padding: EdgeInsets.only(top: 0,left: 0,bottom: 10),
                  child: Column(
                    children: [
                      CustomAppBarAddNew(
                        title: "Add New Product",
                      ),
                      Theme(
                        data: glowTransparent(context),
                        child: Container(
                          height: SizeConfig.screenHeight!-80,
                          width: SizeConfig.screenWidth,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              crossAxisAlignment: cA1,
                              // runSpacing: 20,
                              // spacing: 0,
                              children: [
                                SizedBox(height: inBetweenHeight,),
                                ProductTextField(
                                  width: textFormWidth,
                                  title: "Product Type",
                                  validation: validationList[1],
                                  isTextField: false,
                                  onComplete: (){
                                    node.unfocus();
                                  },

                                  widget:CustomPopup(
                                    hintText: "Select Product Type",
                                    data: ["Simple Product","Variable Product"],
                                    selectedValue: selectedProductType,
                                    width:textFormWidth ,
                                    leftMargin: 0,
                                    edgeInsets: EdgeInsets.only(left: 0),
                                    onSelect: (v){
                                      setState(() {
                                        selectedProductType=v;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(height: inBetweenHeight,),
                                ProductTextField(
                                    width: textFormWidth,
                                    title: "Product Id & Name",
                                    validation: validationList[0],
                                    isTextField: false,
                                    onComplete: (){},
                                    widget: Container(
                                      width: textFormWidth,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AddNewLabelTextField(
                                              width: (textFormWidth/2)-10,
                                              margin: paddTextFieldHeader2,
                                              hintText: "Enter Product Id",

                                          ),
                                          AddNewLabelTextField(
                                              width: (textFormWidth/2)-10,
                                              margin: paddTextFieldHeader2,
                                              hintText: "Enter Product Name",
                                          ),
                                        ],
                                      ),
                                    ),
                                ),
                                SizedBox(height: inBetweenHeight,),
                                ProductTextField(
                                    width: textFormWidth,
                                    title: "URL Slug",
                                    validation: validationList[1],
                                    textEditingController: pslug,
                                    onComplete: (){
                                      node.unfocus();
                                    },

                                ),
                                SizedBox(height: inBetweenHeight,),
                                ProductTextField(
                                  width: textFormWidth+20,
                                  leftPadding: 40,
                                  title: "Upload Product Image",
                                  validation: validationList[1],
                                  textEditingController: pslug,
                                  onComplete: (){
                                    node.unfocus();
                                  },
                                  isTextField: false,
                                  widget: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("You can upload multiple images",style: ts18(grey1,fontfamily: 'RL'),),
                                      SizedBox(height: 10,),
                                      PickMultiImage(
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
                                          wid: textFormWidth+20
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: inBetweenHeight,),
                                ProductTextField(
                                  width: textFormWidth,
                                  title: "Select Brand",
                                  validation: validationList[2],
                                  textEditingController: dummyTextController,
                                  onComplete: (){},
                                  isTextField: false,
                                  widget: OverLayPopUp(
                                    ontap: (){
                                      setState(() {
                                        showBrandDropDown=!showBrandDropDown;
                                      });
                                    },
                                    width: textFormWidth,
                                    hinttext: "Select Brand",
                                    selectedValue: selectedBrand,
                                    showPopUp: showBrandDropDown,
                                    data: pn.brandList,
                                    onitemTap: (i){
                                      setState(() {
                                        showBrandDropDown=false;
                                        selectedBrand=pn.brandList[i].title;
                                      });
                                    },
                                    isToJson: true,
                                    propertyName: "title",
                                  ),
                                ),
                                SizedBox(height: inBetweenHeight,),


                                /*ProductTextField(
                                  width: textFormWidth,
                                  title: "Select Category Testing",
                                  validation: validationList[2],
                                  textEditingController: dummyTextController,
                                  onComplete: (){},
                                  isTextField: false,
                                  widget: Container(
                                    width: textFormWidth,
                                    child: DropdownSearch<String>(
                                      // validator: (v) => v == null ? "required field" : null,
                                      //  dialogMaxWidth: 200,

                                      dropdownSearchDecoration: InputDecoration(
                                        hintText: "Select Category Testing",
                                        //   labelText: "Menu mode *",
                                        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                                        border: OutlineInputBorder(),
                                      ),
                                      mode: Mode.MENU,
                                      showSelectedItems: true,
                                      popupElevation: 2,
                                      items: pn.categoryDropDownList,
                                      showClearButton: true,
                                      showSearchBox: true,
                                      dropDownButton: Icon(Icons.eleven_mp),
                                      searchDelay: Duration(milliseconds: 0),

                                      ontap: (){
                                        scrollController.jumpTo(400);
                                      },
                                      selectWidget: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeIn,
                                        height: 50,
                                        width: textFormWidth,
                                        // margin: paddTextFieldHeader,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          //border: Border.all(color: widget.isEnable?addNewTextFieldBorder:Color(0xffC5C5C5),),
                                          border: Border.all(color:addNewTextFieldBorder),
                                         // color: widget.isEnable?Colors.white:disableColor,
                                          color: Colors.white,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            Text(selectedCategory.isEmpty?"Select Category Testing":selectedCategory,
                                              style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 16,fontFamily: selectedCategory.isEmpty?'RL':'RR'),
                                            ),
                                            Spacer(),
                                            Icon(Icons.keyboard_arrow_down,size: 30,color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,),
                                            SizedBox(width: 15,)
                                          ],
                                        ),
                                      ),
                                      dialogWidget: Container(
                                        height:  pn.categoryDropDownList.length*50.0,
                                        width: textFormWidth,
                                        margin: const EdgeInsets.only(top: 5),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Colors.grey.withOpacity(0.3),
                                                  blurRadius: 20,
                                                  spreadRadius: 2,
                                                  offset: Offset(0,0)
                                              )
                                            ]
                                        ),
                                        constraints: BoxConstraints(
                                          maxHeight: 300
                                        ),
                                        child:  ListView.builder(
                                          itemCount: pn.categoryDropDownList.length,
                                          itemBuilder: (ctx,index){
                                            return   InkWell(
                                              onTap:(){
                                                setState(() {
                                                  selectedCategory=pn.categoryDropDownList[index];
                                                });
                                                Navigator.pop(ctx);
                                                //widget.onitemTap(index);
                                              },
                                              child: Container(
                                                height: 50,
                                                width:textFormWidth,
                                                padding: EdgeInsets.only(left: 20,),
                                                //  margin: EdgeInsets.only(bottom: 3),
                                                alignment: Alignment.centerLeft,
                                                // color:selectedValue==data![index]?AppTheme.red: Color(0xFFf6f6f6),
                                                decoration: BoxDecoration(
                                                  //borderRadius: BorderRadius.circular(8),
                                                  color: Colors.white,
                                                ),
                                                child:  Text("${pn.categoryDropDownList[index]}",
                                                  style: TextStyle(fontFamily: 'RR',fontSize: 16,color: Colors.grey
                                                    // color:selectedValue==data![index]?Colors.white: Color(0xFF555555),letterSpacing: 0.1
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      onChanged: (s){
                                        if(s==null){
                                          setState(() {
                                            selectedCategory="";
                                          });
                                        }
                                        else{
                                          setState(() {
                                            selectedCategory=s;
                                          });
                                        }

                                      },
                                      /// popupItemDisabled: (String? s) => s?.startsWith('I') ?? false,
                                      clearButtonSplashRadius: 20,
                                      selectedItem:selectedCategory,
                                      onBeforeChange: (a, b) {
                                        *//*if (b == null) {
                        AlertDialog alert = AlertDialog(
                          title: Text("Are you sure..."),
                          content: Text("...you want to clear the selection$a $b"),
                          actions: [
                            TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                            ),
                            TextButton(
                              child: Text("NOT OK"),
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                            ),
                          ],
                        );

                        return showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            });
                      }*//*

                                        return Future.value(true);
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: inBetweenHeight,),*/




                                ProductTextField(
                                  width: textFormWidth,
                                  title: "Category",
                                  validation: validationList[2],
                                  textEditingController: dummyTextController,
                                  onComplete: (){},
                                  isTextField: false,
                                  widget: OverLayPopUp(
                                    ontap: (){
                                      setState(() {
                                        showCategoryDropDown=!showCategoryDropDown;
                                      });
                                    },
                                    width: textFormWidth,
                                    hinttext: "Select Category",
                                    selectedValue: selectedCategory,
                                    showPopUp: showCategoryDropDown,
                                    data: pn.categoryDropDownList,
                                    onitemTap: (i){
                                      setState(() {
                                        showCategoryDropDown=false;
                                        selectedCategory=pn.categoryDropDownList[i];
                                      });
                                    },
                                    isToJson: false,
                                  ),
                                ),
                                SizedBox(height: inBetweenHeight,),
                                ProductTextField(
                                  width: textFormWidth,
                                  title: "Select Sub Category",
                                  validation: validationList[2],
                                  textEditingController: dummyTextController,
                                  onComplete: (){},
                                  isTextField: false,
                                  widget: OverLayPopUp(
                                    ontap: (){
                                      setState(() {
                                        showSubCategoryDropDown=!showSubCategoryDropDown;
                                      });
                                    },
                                    width: textFormWidth,
                                    hinttext: "Select Sub Category",
                                    selectedValue: selectedSubCategory,
                                    showPopUp: showSubCategoryDropDown,
                                    data: pn.categoryDropDownList,
                                    onitemTap: (i){
                                      setState(() {
                                        showSubCategoryDropDown=false;
                                        selectedSubCategory=pn.categoryDropDownList[i];
                                      });
                                    },
                                    isToJson: false,
                                  ),
                                ),
                                SizedBox(height: inBetweenHeight,),
                                ProductTextField(
                                    width: textFormWidth,
                                    title: "Product Stock",
                                    validation: validationList[0],
                                    textEditingController: pStock,
                                    textInputType: TextInputType.number,
                                    onComplete: (){
                                      node.unfocus();
                                    }
                                ),
                                Container(
                                  height: 50,
                                  width:  770,
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      CustomCheckBox(
                                          show: showAlert,
                                          ontap: (){
                                            setState(() {
                                              showAlert=!showAlert;
                                            });
                                          }
                                      ),
                                      SizedBox(width: 10,),
                                      Icon(Icons.warning,color: Colors.red,),
                                      Text("  Alert Stock Values",style: ts16(th.primaryColor4),)
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: textFormWidth+270,
                                  child: CustomExpansionTile(
                                    expand: showAlert,
                                    child: ProductTextField(
                                        width: textFormWidth,
                                        title: "Alert Stock",
                                        validation: validationList[0],
                                        textEditingController: pAlertStock,
                                        textInputType: TextInputType.number,
                                        onComplete: (){
                                          node.unfocus();
                                        }
                                    ),
                                  ),
                                ),
                                SizedBox(height: inBetweenHeight,),
                                ProductTextField(
                                    width: textFormWidth,
                                    title: "Quantity Restriction",
                                    validation: validationList[0],
                                    textEditingController: pAlertStock,
                                    onComplete: (){
                                      node.unfocus();
                                    },
                                    isTextField: false,
                                    widget: Container(
                                    //  margin: EdgeInsets.only(left: 20,top: 20),
                                      width: textFormWidth,
                                      height: 50,
                                      child: Row(
                                        children: [
                                          Text("Do you want Quantity Restriction ?    ",
                                            style: TextStyle(fontFamily: 'RL',fontSize: 18,color: grey2),
                                          ),
                                       //   Spacer(),
                                          CustomSwitch(
                                            value: showQtyRest,
                                            onchange: (v){
                                              setState(() {
                                                showQtyRest=v;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                ),


                                Container(
                                  alignment: Alignment.center,
                                  width: textFormWidth+270,
                                  child: CustomExpansionTile(
                                    expand: showQtyRest,
                                    child: ProductTextField(
                                      width: textFormWidth,
                                      title: "",
                                      validation: validationList[0],
                                      isTextField: false,
                                      onComplete: (){},
                                      widget: Container(
                                        width: textFormWidth,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            AddNewLabelTextField(
                                              width: (textFormWidth/2)-10,
                                              margin: EdgeInsets.only(top: 15),
                                              hintText: "Minimum",
                                            ),
                                            AddNewLabelTextField(
                                              width: (textFormWidth/2)-10,
                                              margin: EdgeInsets.only(top: 15),
                                              hintText: "Maximum",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: inBetweenHeight,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      showPriceDetails=!showPriceDetails;
                                    });
                                  },
                                  child: Container(
                                    width: textFormWidth+270,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: th.addNewAppBarColor
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            padding:  EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                            alignment: Alignment.centerLeft,
                                            child: Text("Product Price Details / Shipping",style: ts18(grey1,),)
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(right:20.0),
                                          child: Arrow(isOpen: showPriceDetails),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomExpansionTile(
                                  expand: showPriceDetails,
                                  child: Container(
                                    width: SizeConfig.screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ProductTextField(
                                          width: textFormWidth,
                                          title: "Product Price",
                                          validation: validationList[0],
                                          isTextField: false,
                                          onComplete: (){},
                                          widget: Container(
                                            width: textFormWidth,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                AddNewLabelTextField(
                                                  width: (textFormWidth/2)-10,
                                                  margin: EdgeInsets.only(top: 15),
                                                  hintText: "Actual Price",
                                                ),
                                                AddNewLabelTextField(
                                                  width: (textFormWidth/2)-10,
                                                  margin: EdgeInsets.only(top: 15),
                                                  hintText: "Offer Price",
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                          width: textFormWidth,
                                          title: "Taxes",
                                          validation: validationList[2],
                                          textEditingController: dummyTextController,
                                          onComplete: (){},
                                          isTextField: false,
                                          widget:CustomPopup(
                                            hintText: "Select Taxes",
                                            data: ["GST","CGST"],
                                            selectedValue: selectedProductType,
                                            width:textFormWidth ,
                                            leftMargin: 0,
                                            edgeInsets: EdgeInsets.only(left: 0),
                                            onSelect: (v){
                                              setState(() {
                                                selectedProductType=v;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          width: textFormWidth,
                                          paddTextFieldHeader2: EdgeInsets.only(top: 10),
                                          title: "Shipping Price",
                                          validation: validationList[2],
                                          textEditingController: dummyTextController,
                                          onComplete: (){},
                                          isTextField: false,
                                          widget:Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 50,
                                               // width:  770,
                                                child: Row(
                                                  children: [
                                                  //  Spacer(),
                                                    CustomCheckBox(
                                                        show: showShippingPrice,
                                                        ontap: (){
                                                          setState(() {
                                                            showShippingPrice=!showShippingPrice;
                                                          });
                                                        }
                                                    ),
                                                    SizedBox(width: 10,),
                                                    Icon(Icons.warning,color: Colors.red,),
                                                    Text("  Do you want to add Shipping Price ?",style: ts16(grey1,fontfamily: 'RL'),),
                                                  ],
                                                ),
                                              ),
                                              CustomExpansionTile(
                                                expand: showShippingPrice,
                                                child: AddNewLabelTextField(
                                                  width: textFormWidth,
                                                  margin: EdgeInsets.only(left: 0),
                                                  hintText: "Enter Shipping Price",
                                                ),
                                              )
                                            ],
                                          ),

                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          width: textFormWidth,
                                          paddTextFieldHeader2: EdgeInsets.only(top: 10),
                                          title: "Select State / District",
                                          validation: validationList[2],
                                          textEditingController: dummyTextController,
                                          onComplete: (){},
                                          isTextField: false,
                                          widget:Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: textFormWidth,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    CustomPopup(
                                                      hintText: "Select State",
                                                      data: ["Tamilnadu","Andhra Pradesh","Kerala"],
                                                      selectedValue: "",
                                                      width:(textFormWidth/2)-10 ,
                                                      leftMargin: 0,
                                                      edgeInsets: EdgeInsets.only(left: 0),
                                                      onSelect: (v){
                                                        setState(() {
                                                        //  selectedProductType=v;
                                                        });
                                                      },
                                                    ),
                                                    CustomPopup(
                                                      hintText: "Select District",
                                                      data: ["Chennai","Theni","Madurai"],
                                                      selectedValue: "",
                                                      width:(textFormWidth/2)-10 ,
                                                      leftMargin: 0,
                                                      edgeInsets: EdgeInsets.only(left: 0),
                                                      onSelect: (v){
                                                        setState(() {
                                                         // selectedProductType=v;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: inBetweenHeight,),
                                              Container(
                                                width: textFormWidth,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    CustomPopup(
                                                      hintText: "Select Taluk",
                                                      data: ["Tamilnadu","Andhra Pradesh","Kerala"],
                                                      selectedValue: "",
                                                      width:(textFormWidth/2)-10 ,
                                                      leftMargin: 0,
                                                      edgeInsets: EdgeInsets.only(left: 0),
                                                      onSelect: (v){
                                                        setState(() {
                                                          //  selectedProductType=v;
                                                        });
                                                      },
                                                    ),
                                                    CustomPopup(
                                                      hintText: "Select Area",
                                                      data: ["Chennai","Theni","Madurai"],
                                                      selectedValue: "",
                                                      width:(textFormWidth/2)-10 ,
                                                      leftMargin: 0,
                                                      edgeInsets: EdgeInsets.only(left: 0),
                                                      onSelect: (v){
                                                        setState(() {
                                                          // selectedProductType=v;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),

                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                          width: textFormWidth,
                                          title: "Unit",
                                          validation: validationList[2],
                                          textEditingController: dummyTextController,
                                          onComplete: (){},
                                          isTextField: false,
                                          widget:CustomPopup(
                                            hintText: "Select Unit",
                                            data: pn.units,
                                            selectedValue: selectedUnit,
                                            width:textFormWidth ,
                                            leftMargin: 0,
                                            edgeInsets: EdgeInsets.only(left: 0),
                                            onSelect: (v){
                                              setState(() {
                                                selectedUnit=v;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          width: textFormWidth,
                                          paddTextFieldHeader2: EdgeInsets.only(top: 10),
                                          title: "Is Returnable Item",
                                          validation: validationList[2],
                                          textEditingController: dummyTextController,
                                          onComplete: (){},
                                          isTextField: false,
                                          widget:Container(
                                            height: 50,
                                            padding: EdgeInsets.only(top: 10),
                                            // width:  770,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                //  Spacer(),
                                                CustomCheckBox(
                                                    show: showReturnable,
                                                    ontap: (){
                                                      setState(() {
                                                        showReturnable=!showReturnable;
                                                      });
                                                    }
                                                ),
                                                SizedBox(width: 10,),
                                                Icon(Icons.warning,color: Colors.red,),
                                                SizedBox(width: 10,),
                                                Container(

                                                    width: textFormWidth-70,

                                                    child: Text("If it is returnable item mean need to mentioned with in day of returnable ?",style: ts16(grey1,fontfamily: 'RL'),))
                                              ],
                                            ),
                                          ),

                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                        Container(
                                          width: textFormWidth+270,
                                          child: CustomExpansionTile(
                                            expand:showReturnable ,
                                            child: Column(
                                              children: [
                                                ProductTextField(
                                                    width: textFormWidth,
                                                    title: "Replacement Days",
                                                    validation: validationList[0],

                                                    onComplete: (){
                                                      node.unfocus();
                                                    }
                                                ),
                                                SizedBox(height: inBetweenHeight,),
                                                ProductTextField(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    width: textFormWidth,
                                                    title: "Policy",
                                                    maxlines: 3,
                                                    validation: validationList[0],

                                                    onComplete: (){
                                                      node.unfocus();
                                                    }
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: inBetweenHeight,),


                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      showProductDescription=!showProductDescription;
                                    });
                                  },
                                  child: Container(
                                    width: textFormWidth+270,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: th.addNewAppBarColor
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            padding:  EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                            alignment: Alignment.centerLeft,
                                            child: Text("Product Description",style: ts18(grey1,),)
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(right:20.0),
                                          child: Arrow(isOpen: showProductDescription),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomExpansionTile(
                                  expand: showProductDescription,
                                  child: Container(
                                    width: SizeConfig.screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          width: textFormWidth,
                                          title: "Description",
                                          validation: validationList[0],
                                          textEditingController: pDescription,
                                          maxlines: 3,
                                          onComplete: (){
                                            node.unfocus();
                                          },
                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          width: textFormWidth,
                                          title: "Tags",
                                          validation: validationList[0],
                                          onComplete: (){
                                            node.unfocus();
                                          },
                                          isTextField: false,
                                          widget: Container(
                                            margin: EdgeInsets.only(left: 0,right: 0,bottom: 0),
                                            width: textFormWidth,
                                            // padding: EdgeInsets.only(top: 10,bottom: 10),
                                            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                // border: Border.all(color: addNewTextFieldBorder),
                                                color: addNewValuesBg
                                            ),
                                            //  height: 200,
                                            child: MultiTags(
                                              hintText: 'Enter Tags',
                                              data: tagsList,
                                              width: textFormWidth,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          width: textFormWidth,
                                          title: "SEO Titles",
                                          validation: validationList[0],
                                          onComplete: (){
                                            node.unfocus();
                                          },
                                          isTextField: false,
                                          widget: Container(
                                            margin: EdgeInsets.only(left: 0,right: 0,bottom: 0),
                                            width: textFormWidth,
                                            // padding: EdgeInsets.only(top: 10,bottom: 10),
                                            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                // border: Border.all(color: addNewTextFieldBorder),
                                                color: addNewValuesBg
                                            ),
                                            //  height: 200,
                                            child: MultiTags(
                                              hintText: 'Enter SEO Titles',
                                              data: seoTitlesList,
                                              width: textFormWidth,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          width: textFormWidth,
                                          title: "SEO KeyWords",
                                          validation: validationList[0],
                                          onComplete: (){
                                            node.unfocus();
                                          },
                                          isTextField: false,
                                          widget: Container(
                                            margin: EdgeInsets.only(left: 0,right: 0,bottom: 0),
                                            width: textFormWidth,
                                            // padding: EdgeInsets.only(top: 10,bottom: 10),
                                            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                // border: Border.all(color: addNewTextFieldBorder),
                                                color: addNewValuesBg
                                            ),
                                            //  height: 200,
                                            child: MultiTags(
                                              hintText: 'Enter SEO KeyWords',
                                              data: seoKeyWordsList,
                                              width: textFormWidth,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                            width: textFormWidth,
                                            title: "Website URL",
                                            validation: validationList[0],
                                            textEditingController: pWebsiteUrl,
                                            onComplete: (){
                                              node.unfocus();
                                            }
                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                            width: textFormWidth,
                                            title: "Embedded You tube URL",
                                            validation: validationList[0],
                                            textEditingController: pYouTubeUrl,
                                            onComplete: (){
                                              node.unfocus();
                                            }
                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                      ],
                                    ),
                                  ),

                                ),
                                SizedBox(height: inBetweenHeight,),


                                Container(
                                  width: textFormWidth+270,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: th.addNewAppBarColor
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding:  EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                          alignment: Alignment.centerLeft,
                                          child: Text("Add Fields",style: ts18(grey1,),)
                                      ),
                                      AddBtnText(
                                        ontap: (){
                                          addTempValues();
                                        },
                                        margin:  EdgeInsets.only(right:20.0),
                                      ),
                                    ],
                                  ),
                                ),
                                for(int i=0;i<tempAddValues.length;i++)
                                  Container(
                                    padding: EdgeInsets.only(bottom: 0),
                                    margin: EdgeInsets.only(left: 0,right: 0,top: 30,bottom: 20),
                                    width: width1,
                                    decoration: BoxDecoration(
                                       // borderRadius: BorderRadius.circular(5),
                                      //  border: Border.all(color: addNewTextFieldBorder),
                                        border: Border(bottom: BorderSide(color: addNewTextFieldBorder,width: 2)),
                                        color: Colors.white
                                    ),
                                    constraints: BoxConstraints(
                                        minHeight: 100
                                    ),
                                    child: Column(
                                      children: [
                                        ProductTextField(
                                            width: textFormWidth,
                                            title: "Physical Detail",
                                            validation: validationList[0],
                                            textEditingController: tempAddValues[i].title,
                                            onComplete: (){
                                              node.unfocus();
                                            }
                                        ),
                                        Row(
                                          children: [
                                           /* AddNewLabelTextField(
                                              margin: EdgeInsets.only(left: 0),
                                              width: width1*0.5,
                                              hintText: "Enter Title",
                                              textEditingController: tempAddValues[i].title,
                                              onEditComplete: (){
                                                node.unfocus();
                                              },
                                              onChange: (v){},
                                            ),*/
                                            Spacer(),
                                            CustomCheckBox(
                                                show: tempAddValues[i].selectedHeading==1,
                                                ontap: (){
                                                  if(tempAddValues[i].subAddValuesList.isEmpty){
                                                    setState(() {
                                                      if(tempAddValues[i].selectedHeading==1){
                                                        tempAddValues[i].selectedHeading=2;
                                                      }
                                                      else{
                                                        tempAddValues[i].selectedHeading=1;
                                                      }

                                                      //addTempSubValues(i);
                                                    });
                                                  }
                                                }
                                            ),
                                            SizedBox(width: 10,),
                                            Text("  Do you want to add Specification with Heading ?",style: ts16(grey1,fontfamily: 'RL'),),
                                            SizedBox(width: 75,),
                                            AddBtnText(
                                              ontap: (){
                                                addTempSubValues(i);
                                                /*if(tempAddValues[i].subAddValuesList.isEmpty){
                                                  setState(() {
                                                    tempAddValues[i].selectedHeading=1;
                                                    addTempSubValues(i);
                                                  });
                                                }*/
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15,),

                                        for(int j=0;j<tempAddValues[i].subAddValuesList.length;j++)
                                          ProductTextField(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              width: textFormWidth,
                                              paddTextFieldHeader2: EdgeInsets.only(top: 20),
                                              title: "Heading - ${j+1}",
                                              validation: validationList[0],
                                              textEditingController: pYouTubeUrl,
                                              onComplete: (){
                                                node.unfocus();
                                              },
                                            isTextField: false,
                                            widget: Container(
                                              margin: EdgeInsets.only(left: 0,right: 0,bottom: 20),
                                              width: textFormWidth,
                                              // padding: EdgeInsets.only(top: 10,bottom: 10),
                                              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  // border: Border.all(color: addNewTextFieldBorder),
                                                  color: addNewValuesBg
                                              ),
                                              child: Column(
                                                children: [
                                                  tempAddValues[i].selectedHeading==1? Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: AddNewLabelTextField(
                                                      margin: EdgeInsets.only(left: 0,top: 10),
                                                      width: textFormWidth,
                                                      hintText: "Enter Heading",
                                                      textEditingController: tempAddValues[i].subAddValuesList[j].heading,
                                                      onEditComplete: (){
                                                        node.unfocus();
                                                      },
                                                      onChange: (v){},
                                                    ),
                                                  ):Container(),
                                                  Row(
                                                    children: [
                                                      Spacer(),
                                                      AddBtnText(
                                                        ontap: (){
                                                          addInnerTempSubValues(i, j);
                                                          // addTempSubValues(i);
                                                        },
                                                      ),
                                                      Text("  or  ",style: ts14(th.primaryColor4),),
                                                       DeleteBtnText(
                                                        ontap: (){
                                                          setState(() {
                                                            tempAddValues[i].subAddValuesList.removeAt(j);
                                                          });
                                                        }
                                                    ),
                                                    ],
                                                  ),
                                                  for(int k=0;k<tempAddValues[i].subAddValuesList[j].innerSubAddValuesList.length;k++)
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            AddNewLabelTextField(
                                                              margin: EdgeInsets.only(top: 0),
                                                              width: textFormWidth*0.45,
                                                              hintText: "Enter Title",
                                                              textEditingController: tempAddValues[i].subAddValuesList[j].innerSubAddValuesList[k].title,
                                                              onEditComplete: (){
                                                                node.unfocus();
                                                              },
                                                              onChange: (v){},
                                                            ),
                                                            Spacer(),
                                                            AddNewLabelTextField(
                                                              margin: EdgeInsets.only(left: 0),
                                                              width: textFormWidth*0.45,
                                                              hintText: "Enter Value",
                                                              textEditingController: tempAddValues[i].subAddValuesList[j].innerSubAddValuesList[k].value,
                                                              onEditComplete: (){
                                                                node.unfocus();
                                                              },
                                                              onChange: (v){},
                                                            ),

                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Spacer(),
                                                            k==tempAddValues[i].subAddValuesList[j].innerSubAddValuesList.length-1?AddBtnText(
                                                              ontap: (){
                                                                addInnerTempSubValues(i, j);
                                                              },
                                                            ):Container(),
                                                            k==tempAddValues[i].subAddValuesList[j].innerSubAddValuesList.length-1?
                                                            Text("  or  ",style: ts14(th.primaryColor4),):Container(),
                                                            DeleteBtnText(
                                                                ontap: (){
                                                                  setState(() {
                                                                    tempAddValues[i].subAddValuesList[j].innerSubAddValuesList.removeAt(k);
                                                                  });
                                                                }
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),

                                                ],
                                              ),
                                            ),
                                          ),

                                     
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: DeleteBtnText(
                                            ontap: (){
                                              setState(() {
                                                tempAddValues.removeAt(i);
                                              });
                                            },
                                          )
                                        )


                                      ],
                                    ),
                                  ),
                                SizedBox(height: inBetweenHeight,),


                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      showAttributeTab=!showAttributeTab;
                                    });
                                  },
                                  child: Container(
                                    width: textFormWidth+270,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: th.addNewAppBarColor
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            padding:  EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                            alignment: Alignment.centerLeft,
                                            child: Text("Attribute Tab",style: ts18(grey1,),)
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(right:20.0),
                                          child: Arrow(isOpen: showAttributeTab),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomExpansionTile(
                                  expand: showAttributeTab,
                                  child: Container(
                                    width: SizeConfig.screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                          width: textFormWidth,
                                          title: "Product Attributes",
                                          validation: validationList[1],
                                          isTextField: false,
                                          onComplete: (){
                                            node.unfocus();
                                          },
                                          widget:CustomPopup(
                                            hintText: "Select Product Attributes",
                                            data: ["Color","Size"],
                                            selectedValue: "",
                                            width:textFormWidth ,
                                            leftMargin: 0,
                                            edgeInsets: EdgeInsets.only(left: 0),
                                            onSelect: (v){
                                              setState(() {
                                               // selectedProductType=v;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(height: inBetweenHeight,),
                                        ProductTextField(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          width: textFormWidth,
                                          title: "Color",
                                          validation: validationList[0],
                                          onComplete: (){
                                            node.unfocus();
                                          },
                                          isTextField: false,
                                          widget: Container(
                                            margin: EdgeInsets.only(left: 0,right: 0,bottom: 0),
                                            width: textFormWidth,
                                            // padding: EdgeInsets.only(top: 10,bottom: 10),
                                            padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                // border: Border.all(color: addNewTextFieldBorder),
                                                color: addNewValuesBg
                                            ),
                                            //  height: 200,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomCheckBox(show: true, ontap:(){}),
                                                    SizedBox(width: 10,),
                                                    Icon(Icons.visibility,color: th.primaryColor2,size: 30,),
                                                    SizedBox(width: 10,),
                                                    Text("Do you want to visible this on product page ?",
                                                      style: ts16(grey1,fontfamily: 'RL'),
                                                    ),
                                                  ],
                                                ),
                                                MultiTags(
                                                  hintText: 'Enter Values',
                                                  data: ["Red","Green","Yellow"],
                                                  width: textFormWidth,
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    CustomCheckBox(show: true, ontap:(){}),
                                                    SizedBox(width: 10,),
                                                    Text("Used for variations ?",
                                                      style: ts16(grey1,fontfamily: 'RL'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: inBetweenHeight+30,),
                                        SaveBtn2(
                                            ontap: (){
                                              Navigator.push(context, pr.PageRoute().fade(ProductAttributesGrid()));
                                            },
                                            color: th.primaryColor2,
                                          title: "Save Attributes",
                                        )




                                      ],
                                    ),
                                  ),

                                ),
                                SizedBox(height: inBetweenHeight,),



                                SizedBox(height: inBetweenHeight+100,),



                                /*ProductTextField(
                                    width: textFormWidth,
                                    title: "Pincode",
                                    validation: validationList[0],
                                    textEditingController: pPincode,
                                    textInputType: TextInputType.number,
                                    regExp: digitRegEx,
                                    textLength: zipcodeLength,
                                    onComplete: (){
                                      node.unfocus();
                                    }
                                ),
                                ProductTextField(
                                    width: textFormWidth,
                                    title: "CashBack",
                                    validation: validationList[0],
                                    textEditingController: pCashBack,
                                    textInputType: TextInputType.number,
                                    onComplete: (){
                                      node.unfocus();
                                    }
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20,top: 20),
                                  width: textFormWidth-20,
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Text("Product Availability in Stock",
                                        style: TextStyle(fontFamily: 'RR',fontSize: 20,color: Color(0xFF505050)),
                                      ),
                                      Spacer(),
                                      CustomSwitch(
                                          value: isProductAvailable,
                                          onchange: (v){
                                            setState(() {
                                              isProductAvailable=v;
                                            });
                                          },
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20,top: 20),
                                  width: textFormWidth-20,
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Text("Hide the Product",
                                        style: TextStyle(fontFamily: 'RR',fontSize: 20,color: Color(0xFF505050)),
                                      ),
                                      Spacer(),
                                      CustomSwitch(
                                          value: hideProduct,
                                          onchange: (v){
                                            setState(() {
                                              hideProduct=v;
                                            });
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                                ProductTextField(
                                    width: textFormWidth,
                                    title: "Price API",
                                    validation: validationList[0],
                                    textEditingController: dummyTextController,
                                    onComplete: (){
                                      node.unfocus();
                                    },
                                    isTextField: false,
                                    widget: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                priceApi=1;
                                              });

                                            },
                                            child: Container(
                                              height: 50,
                                              alignment: Alignment.centerLeft,
                                             // padding:  EdgeInsets.only(left: SizeConfig.width20!),
                                              color: Colors.transparent,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  AnimatedContainer(
                                                    duration: animeDuration,
                                                    curve: animeCurve,
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                        color: priceApi==1?th.loginBtn:Color(0xFFBABABA),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: priceApi==1?th.primaryColor2:Color(0xFFDADADA),width: 7)
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text("FP",
                                                    style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 18,fontFamily: 'RR'),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                priceApi=2;
                                              });

                                            },
                                            child: Container(
                                              height: 50,
                                              alignment: Alignment.centerLeft,
                                             // padding:  EdgeInsets.only(left: SizeConfig.width20!),
                                              color: Colors.transparent,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  AnimatedContainer(
                                                    duration: animeDuration,
                                                    curve: animeCurve,
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                        color: priceApi==2?th.loginBtn:Color(0xFFBABABA),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(color: priceApi==2?th.primaryColor2:Color(0xFFDADADA),width: 7)
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text("GOP",
                                                    style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 18,fontFamily: 'RR'),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ),
                                ProductTextField(
                                    width:530,
                                    title: "Highlights",
                                    validation: validationList[0],
                                    textEditingController: dummyTextController,
                                    onComplete: (){
                                      node.unfocus();
                                    },
                                    isTextField: false,
                                    widget: AddMoreTextFieldAnimation(
                                        data: highLightsList,
                                        wid: 530,
                                        hintText: "Highlights",
                                        addCB: addHighlights,
                                        deleteCB: (i){
                                          setState(() {
                                            highLightsList.removeAt(i);
                                          });
                                        }
                                    )
                                ),*/





                                Container(
                                  width: SizeConfig.screenWidth,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(bottom: 50),
                                  child: SaveBtn(ontap: (){

                                    if(pName.text.isEmpty){setState(() {validationList[0]=true;});}
                                    else{setState(() {validationList[0]=false;});}

                                    if(pslug.text.isEmpty){setState(() {validationList[1]=true;});}
                                    else{setState(() {validationList[1]=false;});}

                                    if(selectedCategory.isEmpty){setState(() {validationList[1]=true;});}
                                    else{setState(() {validationList[1]=false;});}

                                    if(image==null){setState(() {validationList[2]=true;});}
                                    else{setState(() {validationList[2]=false;});}

                                    int length=validationList.where((element) => element==false).toList().length;
                                    if(length==validationList.length){


                                      Navigator.pop(context);
                                    }


                                  }),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    showBrandDropDown=false;
                    showCategoryDropDown=false;
                    showSubCategoryDropDown=false;
                    showUnitDropDown=false;
                  });
                },
                child: Container(
                  height:showBrandDropDown||showCategoryDropDown || showSubCategoryDropDown||showUnitDropDown? SizeConfig.screenHeight:0,
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



/*class ProductTextField extends StatelessWidget {
  double width;
  String title;
  Color titleColor;
  String regExp;
  bool validation;
  TextEditingController? textEditingController;
  VoidCallback onComplete;
  bool isTextField;
  Widget? widget;
  double leftPadding;
  TextInputType textInputType;
  int? textLength;
  int? maxlines;
  Widget? suffixIcon;
  bool isEnable;
  ProductTextField({required this.width,required this.title,required this.validation, this.textEditingController,
  required this.onComplete,this.isTextField=true,this.widget,this.leftPadding=20,this.regExp='[A-Za-z0-9@., ]',this.textInputType=TextInputType.emailAddress,
  this.textLength=null,this.maxlines=1,this.titleColor=const Color(0xFF505050),this.suffixIcon,this.isEnable=true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(left: leftPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldHeader(
            title: title,
            padd: paddTextFieldHeader2,
            textColor: titleColor,
          ),
          isTextField?AddNewLabelTextField(
            margin:maxlines==null ?EdgeInsets.only(right: 20,top: 10):maxlines!>1?EdgeInsets.only(right: 20,top: 10): marginAddNewTextField2,
            width: width,
            textEditingController: textEditingController,
            hintText: title,
            regExp: regExp,
            textInputType: textInputType,
            textLength: textLength,
            maxlines: maxlines,
            suffixIcon: suffixIcon,
            isEnabled: isEnable,
            ontap: (){

            },
            onChange: (v){

            },
            onEditComplete:onComplete,
          ):widget!,
          validation?ValidationErrorText(title: validationText,padd: paddTextFieldHeader2,):Container(),
        ],
      ),
    );
  }
}*/
class ProductTextField extends StatelessWidget {
  double width;
  double titleWidth;
  String title;
  Color titleColor;
  String regExp;
  bool validation;
  TextEditingController? textEditingController;
  VoidCallback onComplete;
  bool isTextField;
  Widget? widget;
  double leftPadding;
  TextInputType textInputType;
  int? textLength;
  int? maxlines;
  Widget? suffixIcon;
  bool isEnable;
  CrossAxisAlignment crossAxisAlignment;
  bool showValidation;
  EdgeInsets paddTextFieldHeader2;
  EdgeInsets textFiedlMargin;
  ProductTextField({required this.width,this.titleWidth=250,required this.title,required this.validation, this.textEditingController,
  required this.onComplete,this.isTextField=true,this.widget,this.leftPadding=20,this.regExp='[A-Za-z0-9@., ]',this.textInputType=TextInputType.emailAddress,
  this.textLength=null,this.maxlines=1,this.titleColor=const Color(0xFF505050),this.suffixIcon,this.isEnable=true,
  this.crossAxisAlignment=CrossAxisAlignment.center,this.showValidation=true,this.paddTextFieldHeader2=const EdgeInsets.only(left: 0),
  this.textFiedlMargin=const EdgeInsets.only(left: 0)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: titleWidth+width+leftPadding,
      padding: EdgeInsets.only(left: leftPadding),
      //color: Colors.red,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          TextFieldHeader(
            title: title,
            padd: paddTextFieldHeader2,
            textColor: titleColor,
            width: titleWidth,
          ),
          showValidation?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isTextField?AddNewLabelTextField(
                margin: textFiedlMargin,
                //margin:maxlines==null ?EdgeInsets.only(right: 20,top: 10):maxlines!>1?EdgeInsets.only(right: 0,top: 10): marginAddNewTextField2,
                width: width,
                textEditingController: textEditingController,
                hintText: title,
                regExp: regExp,
                textInputType: textInputType,
                textLength: textLength,
                maxlines: maxlines,
                suffixIcon: suffixIcon,
                isEnabled: isEnable,
                ontap: (){

                },
                onChange: (v){

                },
                onEditComplete:onComplete,
              ):widget!,
              validation?ValidationErrorText(title: validationText,padd: paddTextFieldHeader2,):Container(),
            ],
          ):isTextField?AddNewLabelTextField(
            margin:textFiedlMargin,
            width: width,
            textEditingController: textEditingController,
            hintText: title,
            regExp: regExp,
            textInputType: textInputType,
            textLength: textLength,
            maxlines: maxlines,
            suffixIcon: suffixIcon,
            isEnabled: isEnable,
            ontap: (){

            },
            onChange: (v){

            },
            onEditComplete:onComplete,
          ):widget!,

        ],
      ),
    );
  }
}




class AddValues{
  TextEditingController title;
  int selectedHeading;
  List<SubAddValues> subAddValuesList;
  AddValues({required this.title,required this.selectedHeading,required this.subAddValuesList});
}
class SubAddValues{
  TextEditingController heading;
  TextEditingController title;
  TextEditingController value;
  List<SubAddValues> innerSubAddValuesList;
  SubAddValues({required this.heading,required this.title,required this.value,required this.innerSubAddValuesList});
}

