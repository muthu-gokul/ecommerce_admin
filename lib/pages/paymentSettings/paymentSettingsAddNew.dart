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
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

class PaymentSettingsAddNew extends StatefulWidget {
  @override
  State<PaymentSettingsAddNew> createState() => _PaymentSettingsAddNewState();
}

class _PaymentSettingsAddNewState extends State<PaymentSettingsAddNew> {
  TextEditingController key=new TextEditingController();
  TextEditingController dummyTextController=new TextEditingController();
  TextEditingController secret=new TextEditingController();

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  List<String> currencyList=["INR","EURO","US DOLLAR",];

  String selectedCurrency="";


  bool showCurrencyDropDown=false;



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
              Text("Payment Settings / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                        title: "Select Preferred Currency",
                        validation: validationList[2],
                        textEditingController: dummyTextController,
                        onComplete: (){},
                        isTextField: false,
                        widget: OverLayPopUp(
                          ontap: (){
                            setState(() {
                              showCurrencyDropDown=!showCurrencyDropDown;
                            });
                          },
                          width: textFormWidth,
                          hinttext: "Select Preferred Currency",
                          selectedValue: selectedCurrency,
                          showPopUp: showCurrencyDropDown,
                          data: currencyList,
                          onitemTap: (i){
                            setState(() {
                              showCurrencyDropDown=false;
                              selectedCurrency=currencyList[i];
                            });
                          },
                          isToJson: false,
                        ),
                      ),
                      SizedBox(height: 20,),

                      ProductTextField(
                          width: textFormWidth,
                          title: "Key",
                          validation: validationList[1],
                          textEditingController: key,
                          onComplete: (){
                            node.unfocus();
                          }
                      ),
                      SizedBox(height: 20,),
                      ProductTextField(
                          width: textFormWidth,
                          title: "Secret",
                          validation: validationList[1],
                          textEditingController: secret,
                          onComplete: (){
                            node.unfocus();
                          }
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
                    showCurrencyDropDown=false;
                  });
                },
                child: Container(
                  height:showCurrencyDropDown? SizeConfig.screenHeight:0,
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

