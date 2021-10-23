import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/userModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import '../../constants.dart';



class UsersGrid extends StatefulWidget {
  const UsersGrid({Key? key}) : super(key: key);

  @override
  _UsersGridState createState() => _UsersGridState();
}

class _UsersGridState extends State<UsersGrid> {
  late double width;
  List<UserModel> users=[
    UserModel(name: "Muthu Gokul", email: "gokul@gmail.com", phoneNumber: "9788149292", password: "1234", mobileOTP: "0989", emailOTP: "0989", createdAt: "12-3443-33", status: "Active",isActive: true),
  ];
  @override
  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-100;
    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=>Consumer<ProductNotifier>(
        builder: (context,pn,child)=>  Container(
          height: SizeConfig.screenHeight!-50,
          width: width,
          color: bgColor,
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              GridWithWidgetParam(
                  headerHeight: headerHeight,
                  headerWidth: width,
                  gridHeaderList: [],
                  addBtnTap: (){},
                  filterOnTap: (i){},
                  searchFunc: (v){},
                  headerWidget: Row(
                    children: [
                      GridHeader(
                        width: 200,
                        title: "Name",
                      ),
                      GridHeader(
                        width: 200,
                        title: "Email",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Phone No",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Password",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Mobile OTP",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Email OTP",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Created At",
                      ),
                      GridHeader(
                        width: 150,
                        title: "Status",
                      ),

                      GridHeader(
                        width: 100,
                        title: "Actions",
                      ),
                    ],
                  ),
                  bodyHeight: SizeConfig.screenHeight!-150,
                  bodyWidth: width,
                  bodyWidget: Column(
                    children: users.asMap().map((key, value) => MapEntry(key,
                        Container(
                          //width: width,
                          padding: bodyPadd,
                          margin: bodyMargin,
                          decoration: bodyDecoration,
                          constraints: bodyConstraints,
                          child: Row(
                            children: [
                              GridContent(
                                width: 200,
                                title: value.name,
                              ),
                              GridContent(
                                width: 200,
                                title: value.email,
                              ),
                              GridContent(
                                width: 150,
                                title: value.phoneNumber,
                              ),
                              GridContent(
                                width: 150,
                                title: value.password,
                              ),
                              GridContent(
                                width: 150,
                                title: value.mobileOTP,
                              ),
                              GridContent(
                                width: 150,
                                title: value.emailOTP,
                              ),
                              GridContent(
                                width: 150,
                                title:value.createdAt,
                              ),
                              GridContent(
                                width: 150,
                                title: value.status,
                              ),
                              Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomSwitch(
                                      value:value.isActive,
                                      onchange: (v){
                                        setState(() {
                                          value.isActive=v;
                                        });
                                      },
                                    ),
                                    // ActionIcon(ontap: (){
                                    //   print("Ffff");
                                    // }, imgColor: Colors.black, img: "assets/icons/edit.svg"),
                                    ActionIcon(ontap: (){
                                    }, imgColor: Colors.red, img: "assets/icons/delete.svg"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                    )
                    ).values.toList(),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
