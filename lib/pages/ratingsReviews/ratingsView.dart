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
import 'package:ecommerce_admin/widgets/circle.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/multiTags.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/linearProgressBar.dart';
import 'package:scutiwidgets/size.dart';

class RatingsView extends StatefulWidget {
  @override
  State<RatingsView> createState() => _RatingsViewState();
}

class _RatingsViewState extends State<RatingsView> {
  TextEditingController key=new TextEditingController();
  TextEditingController dummyTextController=new TextEditingController();
  TextEditingController secret=new TextEditingController();

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);


  double width1=750;

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
              Text("View Review",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
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
                padding: EdgeInsets.only(left: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),


                      TextFieldHeader(
                          title: "Ratings & Reviews",
                          padd: EdgeInsets.only(left: 0),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 200,
                        width: width1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 20,
                                spreadRadius: 1,
                                offset: Offset(0,0)
                            )
                          ]
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 220,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("4.7 ",style: ts18(grey1,fontfamily: 'RR',fontsize: 55),),
                                      Icon(Icons.star,color: grey1,size: 45,),
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Text("14 Ratings",style: ts18(grey3,fontsize: 20),),
                                  SizedBox(height: 4,),
                                  Text("12 Reviews",style: ts18(grey3,fontsize: 20),),
                                ],
                              ),
                            ),

                            Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(height: 12,),
                                for(int i=5;i>=1;i--)
                                  Container(
                                    height: 35,
                                    width: 530,
                                    child: Row(
                                      children: [
                                        Text("${i}",style: ts18(grey1,fontfamily: 'RR',fontsize: 18),),
                                        Icon(Icons.star,color: grey1,size: 20,),
                                        LinearPercentIndicator(
                                          width: 400,
                                          lineHeight: 7,
                                          leading: Container(),

                                          trailing: Container(
                                            child: Text("  ${i*2}",style: ts16(grey3),),
                                          ),
                                          percent: (i*2)/10,
                                          progressColor: i==1?Colors.red:i==2?Colors.orangeAccent:Colors.green,
                                          backgroundColor: Colors.grey[200],
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20,),
                      Container(
                        width: width1,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.green,
                                  ),
                                  child: Row(

                                    children: [
                                      Spacer(),
                                      Text("5",style: ts18(Colors.white,fontfamily: 'RM'),),
                                      Icon(Icons.star,color: Colors.white,size: 18,),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Text("Brilliant",style: ts18(grey1,fontsize: 19),)
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("Good rs 1999",style: ts18(grey1),),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Text("Rajesh Prasadh Gupta",style: ts18(grey3),),
                                SizedBox(width: 20,),
                                Circle(
                                    hei: 20,
                                    color: grey3,
                                    widget: Icon(Icons.done,color: Colors.white,size: 15,),
                                ),
                                SizedBox(width: 7,),
                                Text("Certified Buyer 3months ago",style: ts16(grey3),),
                                Spacer(),
                                Icon(Icons.thumb_up,color: grey3.withOpacity(0.6),),
                                Text("  1      ",style: ts16(grey3),),
                                Icon(Icons.thumb_down,color: grey3.withOpacity(0.6),),
                                Text("      1  ",style: ts16(grey3),),
                                SizedBox(width: 20,),
                              ],
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 20,),
                      Container(
                        height: 300,
                        width: width1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey[300]!)
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[300]!))
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text("   Questions and Answers",style: ts18(grey1,fontfamily: 'RR',fontsize: 22),),
                            ),
                            
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              width: width1,
                              height: 130,
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[300]!))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Q: Noise is high or low",style: ts18(grey1),),
                                  SizedBox(height: 10,),
                                  Text("A: low",style: ts18(grey1),),
                                  SizedBox(height: 12,),
                                  Row(
                                    children: [
                                      Text("Rajesh Prasadh Gupta",style: ts18(grey3),),
                                      SizedBox(width: 20,),
                                      Circle(
                                        hei: 20,
                                        color: grey3,
                                        widget: Icon(Icons.done,color: Colors.white,size: 15,),
                                      ),
                                      SizedBox(width: 7,),
                                      Text("Certified Buyer 3months ago",style: ts16(grey3),),
                                      Spacer(),
                                      Icon(Icons.thumb_up,color: grey3.withOpacity(0.6),),
                                      Text("  1      ",style: ts16(grey3),),
                                      Icon(Icons.thumb_down,color: grey3.withOpacity(0.6),),
                                      Text("      1  ",style: ts16(grey3),),
                                      SizedBox(width: 20,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text("Didnt get the right answer you were looking for",style: ts16(grey1),),
                                  Spacer(),
                                  Text("Answer your Customers     ",style: ts18(grey1),),
                                ],
                              ),
                            ),
                            
                          ],
                        ),
                      ),

                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        height: 50,
                        width: width1,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey[300]!))
                        ),
                        child: Row(
                          children: [
                            Text("Post Your Answer",style: ts18(grey1,fontsize: 22),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      AddNewLabelTextFieldMinLines(
                          width: width1,
                          margin: EdgeInsets.only(left: 0),
                          minLines: 5,
                          maxlines: 6,
                          hintText: "Type your Answer Here",
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        width: width1,
                        alignment: Alignment.centerRight,
                        child:SaveBtn(ontap: (){

                        },
                        title: "Submit",
                        )
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

