import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../constants.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late double width;
  @override
  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-140;
    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=> Container(
        height: SizeConfig.screenHeight!-50,
        width: SizeConfig.screenWidth!-100,
        color: bgColor,
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width*0.32,
              height: SizeConfig.screenHeight!-70,
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
                  SizedBox(height: 20,),
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: th.primaryColor3.withOpacity(0.1),
                    ),
                  ),
                  Text("Mr.Ramesh",style: TextStyle(fontFamily: 'RR',color: grey3,fontSize: 16,letterSpacing: 0.2),),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                    margin: EdgeInsets.only(top: 5,bottom: 20),
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    alignment: Alignment.center,
                    child: Text("Admin",style: ts14(Colors.red,fontfamily: 'RM'),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      activeDays(Colors.green, Icon(Icons.done,color: Colors.green[800],), 365, "Active days"),
                      activeDays(th.primaryColor3, Icon(Icons.card_travel,color: th.primaryColor2,), 4343, "Products"),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 15),
                    padding: EdgeInsets.only(bottom: 5),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: grey4))
                    ),
                    child: Text("Details",style: ts16(grey1),),
                  ),
                  detailView("Pan Number",34343434 ),
                  detailView("GSTIN",4343434434 ),
                  detailView("Email","rameshjune28@gmail.com" ),
                  detailView("Phone Number",8787877878 ),
                  detailView("Alternative Number",8787877878 ),
                  detailView("Address","No:4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai-600095." ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          color: th.primaryColor2,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        alignment: Alignment.center,
                        child: Text("Edit",style: ts16(Colors.white),),
                      ),
                      Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.red)
                        ),
                        alignment: Alignment.center,
                        child: Text("Suspender",style: ts16(Colors.red),),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  activeDays(Color color,Widget icon,dynamic title,dynamic value){
    return Container(
      height: 34,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: icon,
          ),
          SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$title",style: ts16(grey3,fontfamily: 'RM'),),
              SizedBox(height: 1,),
              Text("$value",style: ts12(grey3.withOpacity(0.7)),),
            ],
          )
        ],
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
            width:((width*0.32)-40)*0.5,
            alignment: Alignment.centerLeft,
            child: Text("$title",style: ts16(grey1),),
          ),
          Container(
            width:((width*0.32)-40)*0.5,
            alignment: Alignment.centerLeft,
            child: Text("$value",style: ts15(grey3),),
          ),
        ],
      ),
    );
  }
}