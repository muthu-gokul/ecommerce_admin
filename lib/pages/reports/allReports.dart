import 'dart:async';

import 'package:ecommerce_admin/model/drawerContentModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/reportNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/addColor/colorGrid.dart';
import 'package:ecommerce_admin/pages/addSize/sizeGrid.dart';
import 'package:ecommerce_admin/pages/appMaster/appGrid.dart';
import 'package:ecommerce_admin/pages/attributes/attributeGrid.dart';
import 'package:ecommerce_admin/pages/customers/customersGrid.dart';
import 'package:ecommerce_admin/pages/emailSetting/emailSettingGrid.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/pages/newVendorRequest/vendorRequestGrid.dart';
import 'package:ecommerce_admin/pages/paymentSettings/paymentSettingsGrid.dart';
import 'package:ecommerce_admin/pages/pincode/pincodeGrid.dart';
import 'package:ecommerce_admin/pages/reports/reportGrid.dart';
import 'package:ecommerce_admin/pages/settings/companySettings.dart';
import 'package:ecommerce_admin/pages/settings/settings.dart';
import 'package:ecommerce_admin/pages/settings/uomSettings.dart';
import 'package:ecommerce_admin/pages/staffs/staffsGrid.dart';
import 'package:ecommerce_admin/pages/users/usersGrid.dart';
import 'package:ecommerce_admin/widgets/customAppBar.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/pageRoutes.dart'as pr;
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';
class AllReports extends StatefulWidget {
  const AllReports({Key? key}) : super(key: key);

  @override
  _AllReportsState createState() => _AllReportsState();
}

class _AllReportsState extends State<AllReports> with TickerProviderStateMixin{
  @override
  late  double width,height,width2,height2;

  TextEditingController pageTitle=new TextEditingController();
  TextEditingController urlSlug=new TextEditingController();
  TextEditingController heading=new TextEditingController();
  TextEditingController content=new TextEditingController();

  XFile? image=null;
  final HtmlEditorController controller = HtmlEditorController();

  double icoSize=60;
  List<DrawerContentModel> list=[];

  int selectedIndex=-1;



  @override
  void initState() {
    setState(() {
      list=[
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Purchase Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 53,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Orders Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 54,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Product Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 55,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Variants Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 56,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Gift Coupons Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 57,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Most Rated Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 58,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Contact Detail Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 59,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Brand Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 60,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Payment Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 61,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Customer Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 62,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Vendor Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 63,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Invoice Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 64,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Receivable Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 65,widget2: ReportGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Payable Report", widget: Icon(Icons.notes,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,isReport: true,index: 66,widget2: ReportGrid()),
      ];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-100;
    width2=(SizeConfig.screenWidth!*0.85)+(drawerOpen?0:100);

    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=>Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Container(

            child: Container(
              width: SizeConfig.screenWidth!*0.9,
              height: SizeConfig.screenHeight!-appBarHei,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top:20.0,left: 20,right: 20,bottom: 20),
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 10.0,
                  spacing: 10.0,
                  // direction: Axis.vertical,
                  alignment: WrapAlignment.start,
                  children: [
                    for(int i=0;i<list.length;i++)
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedIndex=i;
                          });
                          Provider.of<ReportNotifier>(context,listen: false).assignData(list[i].title);
                          Navigator.push(context, pr.PageRoute().fade(SettingsNavigation(
                            index: i,title: list[i].title,widget: list[i].widget2??Container(),)));
                          Timer(Duration(seconds: 1), (){
                            setState(() {
                              selectedIndex=-1;
                            });
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                          width: 200,
                          height: 170,
                          decoration: BoxDecoration(
                              color:i==selectedIndex?th.primaryColor2: th.primaryColor2.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow:i==selectedIndex? [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 15,
                                    spreadRadius: 2,
                                    color: th.primaryColor2.withOpacity(0.5)
                                )
                              ]:[]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                //width: 50,
                                alignment: Alignment.center,

                                child: list[i].widget==null?SvgPicture.asset(list[i].img,color: Colors.white,height: 60,):list[i].widget!,
                              ),
                              SizedBox(height: 10,),
                              Text("${list[i].title}",style: ts18(i==selectedIndex?Colors.white:grey1,fontsize: 15),)
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )


      ),
    );
  }
}



