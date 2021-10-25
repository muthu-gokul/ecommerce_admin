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
import 'package:ecommerce_admin/widgets/multiTags.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:ecommerce_admin/widgets/singleDatePicker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

class ReturnProductsAddNew extends StatefulWidget {
  @override
  State<ReturnProductsAddNew> createState() => _ReturnProductsAddNewState();
}

class _ReturnProductsAddNewState extends State<ReturnProductsAddNew> {
  TextEditingController key=new TextEditingController();
  TextEditingController dummyTextController=new TextEditingController();
  TextEditingController secret=new TextEditingController();

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  DateTime? ExpectedPurchaseDate;



  @override
  Widget build(BuildContext context) {
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
              Text("Return Products / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),


                      ProductTextField(
                          width: textFormWidth,
                          title: "Item",
                          validation: validationList[1],
                          textEditingController: key,
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: 20,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Customer Name",
                          validation: validationList[1],
                          textEditingController: secret,
                          onComplete: (){
                            node.unfocus();
                          }
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
                          title: "Price",
                          validation: validationList[1],
                          textEditingController: secret,
                          onComplete: (){
                            node.unfocus();
                          },
                          regExp: decimalReg,
                          textInputType: TextInputType.number,
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

            ],
          ),
        ),
      ),
    );
  }
}

