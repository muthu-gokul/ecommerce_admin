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
import 'package:ecommerce_admin/widgets/customAppBar.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/multiTags.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:ecommerce_admin/widgets/singleDatePicker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

class PaymentAddNew extends StatefulWidget {
  bool isPayable;
  PaymentAddNew({required this.isPayable});
  @override
  State<PaymentAddNew> createState() => _PaymentAddNewState();
}

class _PaymentAddNewState extends State<PaymentAddNew> {
  TextEditingController key=new TextEditingController();
  TextEditingController dummyTextController=new TextEditingController();
  TextEditingController secret=new TextEditingController();
  TextEditingController Stitle=new TextEditingController();

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  String selectedCategory="";
  String selectedPayment="";
  DateTime? ExpectedPurchaseDate;

  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    return Scaffold(

      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                color:th.addNewBodyColor,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: cA1,
                    children: [
                      CustomAppBarAddNew(
                        title: "Add New Payment",
                      ),
                      SizedBox(height: inBetweenHeight,),

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
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Product Name",
                        validation: validationList[1],
                        textEditingController: Stitle,
                        onComplete: (){},
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Party Name",
                        validation: validationList[1],
                        textEditingController: Stitle,
                        onComplete: (){},
                        isTextField: false,
                        widget:CustomPopup(
                          hintText: "Select Party Name",
                          data: ["AbiRami","Bhuvaneshwari",'Christi Priya',"Dhivya","Eliz Mertyl",],
                          selectedValue: selectedCategory,
                          width:textFormWidth ,
                          leftMargin: 0,
                          edgeInsets: EdgeInsets.only(left: 0),
                          onSelect: (v){
                            setState(() {
                              selectedCategory=v;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Amount",
                        validation: validationList[1],

                        onComplete: (){
                          node.unfocus();
                        },
                        regExp: digitRegEx,
                        textInputType: TextInputType.number,
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "Mode of Payment",
                        validation: validationList[1],
                        textEditingController: Stitle,
                        onComplete: (){},
                        isTextField: false,
                        widget:CustomPopup(
                          hintText: "Select Mode of Payment",
                          data: ["Cash","Card","Credit"],
                          selectedValue: selectedPayment,
                          width:textFormWidth ,
                          leftMargin: 0,
                          edgeInsets: EdgeInsets.only(left: 0),
                          onSelect: (v){
                            setState(() {
                              selectedPayment=v;
                            });
                          },
                        ),
                      ),




                      SizedBox(height: 50,),
                      Container(
                        width: textFormWidth+(40),
                        alignment: Alignment.center,
                        child: SaveBtn(ontap: (){



                        }),
                      ),

                     // SizedBox(height: 700,),
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

