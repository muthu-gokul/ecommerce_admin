import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/circleProgressBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/linearProgressBar.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';


class CustomerView extends StatefulWidget {
  const CustomerView({Key? key}) : super(key: key);

  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  late double width;
  double width1=370;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    width=SizeConfig.screenWidth!-140;
    return Scaffold(
      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=> Container(
          height: SizeConfig.screenHeight!,
          width: SizeConfig.screenWidth,
          color: bgColor,
          //padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              Container(
                height: 50,
                color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,
                child: Row(
                  children: [
                    BackBtn(ontap: (){
                      Navigator.pop(context);
                    }),
                    Text("Customer Detail",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                     width: width1,
                     height: SizeConfig.screenHeight!-70,
                     child: Theme(
                       data: glowTransparent(context),
                       child: ListView(
                         children: [
                           Container(
                             width: width1,
                             //  height: SizeConfig.screenHeight!-70,
                             decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(5),
                                 boxShadow: [
                                   BoxShadow(
                                       color: Colors.grey.withOpacity(0.2),
                                       blurRadius: 10,
                                       spreadRadius: 1,
                                       offset: Offset(0,0)
                                   )
                                 ]
                             ),
                             child: Column(
                               children: [
                                 SizedBox(height: 15,),
                                 Container(
                                     padding:  EdgeInsets.only(left: 20),
                                     alignment: Alignment.centerLeft,
                                     child: Text("Profile",style: ts18(grey1,fontfamily: 'RM'),)
                                 ),
                                 Container(
                                   height: 80,
                                   width: 80,
                                   margin: EdgeInsets.only(bottom: 10),
                                   decoration: BoxDecoration(
                                     shape: BoxShape.circle,
                                     color: th.primaryColor3.withOpacity(0.1),
                                   ),
                                   child: Image.asset("assets/images/avatar.png"),
                                 ),
                                 Text("ID: 45454",style: ts14(grey3.withOpacity(0.8)),),
                                 SizedBox(height: 7,),
                                 Text("Mr.Ramesh",style: TextStyle(fontFamily: 'RR',color: grey3,fontSize: 16,letterSpacing: 0.2),),
                                 SizedBox(height: 10,),
                                 profileView(Icon(Icons.phone,size: 20,), "8787877878"),
                                 profileView(Icon(Icons.mail,size: 20,), "rameshjune28@gmail.com"),
                                 profileView(Icon(Icons.book,size: 20,),
                                     "No:4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai-600095.",
                                     crossAxisAlignment: CrossAxisAlignment.start
                                 ),
                                 SizedBox(height: 15,),
                               ],
                             ),
                           ),
                           SizedBox(height: 20,),
                           Container(
                             width: width1,
                             //  height: SizeConfig.screenHeight!-70,
                             decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(5),
                                 boxShadow: [
                                   BoxShadow(
                                       color: Colors.grey.withOpacity(0.2),
                                       blurRadius: 10,
                                       spreadRadius: 1,
                                       offset: Offset(0,0)
                                   )
                                 ]
                             ),
                             child: Column(
                               children: [
                                 SizedBox(height: 15,),
                                 Container(
                                     padding:  EdgeInsets.only(left: 20,bottom: 20),
                                     alignment: Alignment.centerLeft,
                                     child: Text("Expense Count",style: ts18(grey1,fontfamily: 'RM'),)
                                 ),
                                 Container(
                                   height: 100,
                                   child: CircleProgressBar(
                                     extraStrokeWidth: 1,
                                     innerStrokeWidth: 8,
                                     backgroundColor: Colors.grey[200],
                                     foregroundColor:th.primaryColor2,
                                     value: 1,
                                     center: Container(
                                       height: 80,
                                       width: 80,
                                       margin: EdgeInsets.all(0),
                                       alignment: Alignment.center,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         color: Colors.transparent,
                                         boxShadow: [

                                         ],
                                       ),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Text("Exp Spend",style: ts12(grey2),),
                                           SizedBox(height: 3,),
                                           Text("76",style: ts18(grey2,fontfamily: 'RR',fontsize: 22),),
                                         ],
                                       ),
                                       //child: Text("50%",textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF7D7D7D),fontFamily: 'RB'),)
                                     ),
                                   ),
                                 ),
                                 SizedBox(height: 20,),
                                 Row(
                                   children: [
                                     SizedBox(width: 20,),
                                     expenseCount("Food", "545 spend", Color(0xFFF7D46D), 0.4),
                                     expenseCount("Cloth", "545 spend", Colors.deepPurple, 0.4),
                                     expenseCount("Other", "545 spend", Colors.purpleAccent, 0.4),
                                   ],
                                 ),
                                 SizedBox(height: 20,),

                               ],
                             ),
                           ),
                           SizedBox(height: 20,),
                           Container(
                             width: width1,
                             //  height: SizeConfig.screenHeight!-70,
                             decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(5),
                                 boxShadow: [
                                   BoxShadow(
                                       color: Colors.grey.withOpacity(0.2),
                                       blurRadius: 10,
                                       spreadRadius: 1,
                                       offset: Offset(0,0)
                                   )
                                 ]
                             ),
                             child: Column(
                               children: [
                                 SizedBox(height: 15,),
                                 Container(
                                     padding:  EdgeInsets.only(left: 20,bottom: 20),
                                     alignment: Alignment.centerLeft,
                                     child: Text("Status Report",style: ts18(grey1,fontfamily: 'RM'),)
                                 ),
                                 statusReport("Product Visit", 54, 0.6, Colors.green),
                                 statusReport("Product Buy", 27, 0.3, Colors.cyan),
                                 statusReport("Comments on Product", 102, 0.7, Colors.deepPurpleAccent),
                                 statusReport("Wish List", 36, 0.4, Colors.lime),
                                 statusReport("Total Spent Time", "1024 Hours", 0.9, Colors.red),

                                 SizedBox(height: 5,),
                               ],
                             ),
                           ),
                           SizedBox(height: 20,),
                         ],
                       ),
                     ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth!-width1-60,
                      height: SizeConfig.screenHeight!-70,
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: width1,
                                height: 230,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(0,0)
                                      )
                                    ]
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 15,),
                                    Container(
                                        padding:  EdgeInsets.only(left: 20,bottom: 20),
                                        alignment: Alignment.centerLeft,
                                        child: Text("Delivery Address",style: ts18(grey1,fontfamily: 'RM'),)
                                    ),
                                    detailView("Address:",
                                        "No:4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai-600095.",
                                    ),
                                    detailView("Pincode:", "625603"),
                                    detailView("Phone No:", "8787877878"),
                                    SizedBox(height: 15,),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                width: width1,
                                height: 230,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(0,0)
                                      )
                                    ]
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 15,),
                                    Container(
                                        padding:  EdgeInsets.only(left: 20,bottom: 20),
                                        alignment: Alignment.centerLeft,
                                        child: Text("Shipping Address",style: ts18(grey1,fontfamily: 'RM'),)
                                    ),
                                    detailView("Address:",
                                        "No:4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai-600095.",
                                    ),
                                    detailView("Pincode:", "625603"),
                                    detailView("Phone No:", "8787877878"),
                                    SizedBox(height: 15,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  detailView(String title,dynamic value){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 7,bottom: 7),
      //alignment: Alignment.centerLeft,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:((width1)-40)*0.5,
            alignment: Alignment.centerLeft,
            child: Text("$title",style: ts16(grey1),),
          ),
          Container(
            width:((width1)-40)*0.5,
            alignment: Alignment.centerLeft,
            child: Text("$value",style: ts15(grey3),),
          ),
        ],
      ),
    );
  }
  profileView(Widget leading,dynamic value,{CrossAxisAlignment crossAxisAlignment= CrossAxisAlignment.center}){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 7,bottom: 7),
      child: Row(
        crossAxisAlignment:crossAxisAlignment,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: leading
          ),
          Spacer(),
          Container(
            width:((width1)-80),
            alignment: Alignment.centerLeft,
            child: Text("$value",style: ts15(grey3),),
          ),
        ],
      ),
    );
  }
  statusReport(String title,dynamic value,double percent,Color progressColor){
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$value",style: ts18(grey2),),
              Text("$title",style: ts14(grey3),),
            ],
          ),
          SizedBox(height: 7,),
          LinearPercentIndicator(
            leading: Container(width: 0,),
            padding: EdgeInsets.only(left: 0),
            width: width1-40,
            trailing: Container(),
            backgroundColor: Colors.grey[200],
            progressColor: progressColor,
            percent: percent,
            animationDuration: 1000,
            animation: true,
            lineHeight: 5,
          ),
        ],
      ),
    );
  }
  expenseCount(String title,String footer,Color color,double percent){
    return Container(
      width:  width1*0.25,
      margin: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title",style: ts14(grey2),),
          SizedBox(height: 10,),
          LinearPercentIndicator(
            leading: Container(width: 0,),
            padding: EdgeInsets.only(left: 0),
            width: width1*0.25,
            trailing: Container(),
            backgroundColor: Colors.grey[200],
            progressColor: color,
            percent: percent,
            animationDuration: 1000,
            animation: true,
            lineHeight: 5,
          ),
          SizedBox(height: 10,),
          Text("$footer",style: ts14(color),),
        ],
      ),
    );
  }

}
