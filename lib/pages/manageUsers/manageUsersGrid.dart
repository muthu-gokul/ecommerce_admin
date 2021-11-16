import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/pages/manageUsers/manageUsersAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/circle.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridFooter.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/fittedText.dart';
import 'package:scutiwidgets/size.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;

import '../../constants.dart';

class ManageUsersGird extends StatefulWidget {
  const ManageUsersGird({Key? key}) : super(key: key);

  @override
  _ManageUsersGirdState createState() => _ManageUsersGirdState();
}

class _ManageUsersGirdState extends State<ManageUsersGird> {
  late double width;

  @override
  void initState() {
    Provider.of<ProductNotifier>(context,listen: false).init(false);
    super.initState();
  }
  // @override
  // void didChangeDependencies() {
  //   print("CUstomer did");
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {

    List<GridHeaderModel> gridHeaderList=[
      GridHeaderModel(columnName: "Product",width: 200),
      GridHeaderModel(columnName: "No of days after delivery",width: 130,),
      GridHeaderModel(columnName: "Amount",),
      GridHeaderModel(columnName: "Covered under installation",width: 230),
      GridHeaderModel(columnName: "Not Covered under installation",width: 230),
      GridHeaderModel(columnName: "Actions",width: 100),
    ];

    width=SizeConfig.screenWidth!-100;
    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=>Consumer<ProductNotifier>(
        builder: (context,pn,child)=>  Container(
          height: SizeConfig.screenHeight!-appBarHei,
          width: width,
          color: bgColor,
          padding: bodyPadding,
          child: Theme(
            data: glowTransparent(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: width,
                    alignment: Alignment.topCenter,
                    child:Row(
                      children: [
                        Spacer(),
                        Container(
                          height: 45,
                          width: 250,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(fontFamily: 'RR',fontSize: 16,color: Colors.grey),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                prefixIcon: Icon(Icons.search)
                            ),
                            onChanged: (v){
                           //   widget.searchFunc(v.toLowerCase());
                            },
                          ),
                        ),

                       AddBtn(
                          ontap: (){
                            Navigator.push(context, pr.PageRoute().slideFromLeftToRight(ManageUsersAddNew()));
                          },
                          color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
                        ),
                      ],
                    ),
                  ),
                 users("Super Admin", th.primaryColor4),
                 SizedBox(height: 20,),
                 users("Admin", th.primaryColor4),
                  SizedBox(height: 20,),
                 users("General User", th.primaryColor4),
                  SizedBox(height: 100,),

                 // SizedBox(height: 20,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  users(String role,Color borderColor){
    return Stack(
      children: [
        Container(
          // height: 200,
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.only(top: 20),
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor),
          ),
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 50,
            children: [
              for (int i = 0; i < 3; i++)
                Container(
                  padding:EdgeInsets.fromLTRB(10, 20, 10, 20),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: grey1.withOpacity(0.5)),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Circle(
                        hei: 70,
                        color: Colors.white,
                        bs: [
                          BoxShadow(
                              color:Colors.grey.withOpacity(0.35),
                              offset: const Offset(0, 7.0),
                              blurRadius: 15.0,
                              spreadRadius: 1
                          )
                        ],
                        widget: Image.asset("assets/images/avatar.png"),
                      ),
                      SizedBox(height: 20,),
                      FittedText(
                        alignment: Alignment.center,
                        height: 20,
                        width: 180,
                        text:"Muthu Gokul",
                        textStyle: TextStyle(
                            fontFamily: 'RR',
                            // fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color:grey1
                        ),
                      ),
                      SizedBox(height: 5,),
                      SizedBox(height: 10,),
                      SaveBtn(
                        hei: 35,
                        wid: 85,
                        ontap: (){},
                        title: "Edit",
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 20,
          child: SaveBtn(
            ontap: (){},
            title: role,
          ),
        )
      ],
    );
  }

}


