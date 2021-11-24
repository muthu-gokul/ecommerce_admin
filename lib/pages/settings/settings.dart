import 'dart:async';

import 'package:ecommerce_admin/model/drawerContentModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
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
import 'package:ecommerce_admin/pages/settings/companySettings.dart';
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
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with TickerProviderStateMixin{
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
        DrawerContentModel(img: "assets/icons/return.svg", title: "Company Settings",  widget: Icon(Icons.settings,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,index: 1,widget2: CompanySettings()),
        DrawerContentModel(img: "assets/icons/return.svg", title: "New Vendor Request",  widget: Icon(Icons.person_add,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,index: 2,widget2: VendorRequestGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Customer Master",widget: Icon(Icons.person_pin_outlined,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,index: 3,widget2: CustomersGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "User Master",rightPadd: 15,imgHeight: 25,index: 4,widget2: UsersGrid()),
        DrawerContentModel(img: "assets/icons/return.svg", title: "Staff Master",  widget: Icon(Icons.perm_identity_outlined,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,index: 5,widget2: StaffsGird()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Email Settings",widget: Icon(Icons.mail_outline,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,index: 6,widget2: EmailSettingGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Payment Settings",widget: Icon(Icons.payments,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,index: 7,widget2: PaymentSettingsGrid()),
        DrawerContentModel(img: "assets/homepage/uom.svg", title: "Unit of Measure",rightPadd: 15,imgHeight: 25,index: 8,widget2: UOMSettings()),
        DrawerContentModel(img: "assets/icons/return.svg", title: "Pincode",  widget: Icon(Icons.pin_drop_outlined,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,index: 9,widget2: PincodeGrid()),
        DrawerContentModel(img: "assets/icons/return.svg", title: "Attributes",  widget: Icon(Icons.attractions_outlined,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,index: 10,widget2: AttributeGrid()),
        DrawerContentModel(img: "assets/icons/return.svg", title: "Add Color",  widget: Icon(Icons.color_lens_outlined,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,index: 11,widget2: ColorGrid()),
        DrawerContentModel(img: "assets/icons/return.svg", title: "Add Size",  widget: Icon(Icons.format_size_outlined,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,index: 12,widget2: SizeGrid()),
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "App", widget: Icon(Icons.app_blocking_outlined,color: Colors.white,size: icoSize,),rightPadd: 15,imgHeight: 25,index: 13,widget2: AppGrid()),
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


class SettingsNavigation extends StatelessWidget {
  int index;
  String title;
  Widget widget;
  SettingsNavigation({required this.index,required this.title,required this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: bgColor,
        child: Column(
          children: [
            CustomAppBarAddNew(title: title,diffColor: true,color: Colors.white,),
             widget
          ],
        ),
      ),
    );
  }
}

