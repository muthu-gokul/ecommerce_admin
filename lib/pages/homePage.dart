import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/cardClassification/cardClassifyGrid.dart';
import 'package:ecommerce_admin/pages/customers/customersGrid.dart';
import 'package:ecommerce_admin/pages/goodsReceived/goodsReceivedGrid.dart';
import 'package:ecommerce_admin/pages/pincode/pincodeGrid.dart';
import 'package:ecommerce_admin/pages/product/productHome.dart';
import 'package:ecommerce_admin/pages/profile.dart';
import 'package:ecommerce_admin/pages/purchase/purchaseGrid.dart';
import 'package:ecommerce_admin/pages/returnProducts/returnProductGrid.dart';
import 'package:ecommerce_admin/pages/settings/uomSettings.dart';
import 'package:ecommerce_admin/pages/shippingCharges/shippingChargesGrid.dart';
import 'package:ecommerce_admin/pages/users/usersGrid.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import 'brand/brandGrid.dart';
import 'emailSetting/emailSettingGrid.dart';
import 'featuredBrand/featuredBrandGrid.dart';
import 'footerPageSetings/footerPageSettings.dart';
import 'frontCoverSlider/frontCoverGrid.dart';
import 'newVendorRequest/vendorRequestGrid.dart';
import 'ordersList/ordersListGrid.dart';
import 'paymentSettings/paymentSettingsGrid.dart';
import 'productShowCase/productShowCaseGrid.dart';
import 'settings/companySettings.dart';
import 'topOffers/topOfferGrid.dart';
import 'underAmount/underAmountGrid.dart';
import 'vendor/vendorListGrid.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int menuIndex=1;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=> SingleChildScrollView(
          child: Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            color: th.primaryColor2,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: SizeConfig.screenHeight,
                  color: th.primaryColor2,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Padding(
                          padding:  EdgeInsets.only(left: 15),
                          child: Image.asset("assets/login/logo.jpg",height: 80,),
                        ),
                        SizedBox(height: 20,),
                        DrawerContent(
                            img: "assets/homepage/dashboard.svg",
                            isSelect: menuIndex==1?true:false,
                            imgHeight: 50,
                            ontap: (){
                              setState(() {
                                menuIndex=1;
                              });
                            }
                        ),
                        DrawerContent(
                            img: "assets/homepage/salesReport.svg",
                            isSelect: menuIndex==2?true:false,
                            imgHeight: 50,
                            ontap: (){
                              setState(() {
                                menuIndex=2;
                              });
                            }
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==3?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=3;
                              });
                            },
                            widget: Icon(Icons.person_pin_circle_outlined,color: Colors.white,size: 28,),
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==4?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=4;
                              });
                            },
                            widget: Icon(Icons.branding_watermark,color: Colors.white,),
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==5?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=5;
                              });
                            }
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==6?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=6;
                              });
                            },
                            widget: Icon(Icons.person_pin_outlined,color: Colors.white,),
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==7?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=7;
                              });
                            },
                            widget: Icon(Icons.star_border_outlined,color: Colors.white,),
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==8?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=8;
                              });
                            },
                            widget: Icon(Icons.production_quantity_limits,color: Colors.white,),
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==9?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=9;
                              });
                            },
                           widget: Icon(Icons.payments,color: Colors.white,),
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==10?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=10;
                              });
                            },
                            widget: Icon(Icons.local_convenience_store_rounded,color: Colors.white,),
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==11?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=11;
                              });
                            },
                            widget: Icon(Icons.branding_watermark_outlined,color: Colors.white,),
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==12?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=12;
                              });
                            }
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==13?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=13;
                              });
                            },
                            widget: Icon(Icons.local_offer_outlined,color: Colors.white,),
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==14?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=14;
                              });
                            },
                            widget: Icon(Icons.mail_outline,color: Colors.white,),
                        ),
                        DrawerContent(
                            img: "assets/homepage/user-profile.svg",
                            isSelect: menuIndex==15?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=15;
                              });
                            },
                            widget: Icon(Icons.square_foot,color: Colors.white,),
                        ),
                        DrawerContent(
                            img: "assets/homepage/uom.svg",
                            isSelect: menuIndex==16?true:false,
                            imgHeight: 25,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=16;
                              });
                            }
                        ),
                        DrawerContent(
                            img: "assets/homepage/purchase.svg",
                            isSelect: menuIndex==17?true:false,
                            imgHeight: 45,
                            rightPadd: 6,
                            ontap: (){
                              setState(() {
                                menuIndex=17;
                              });
                            }
                        ),
                        DrawerContent(
                            img: "assets/homepage/goodsReceived.svg",
                            isSelect: menuIndex==18?true:false,
                            imgHeight: 45,
                            rightPadd: 6,
                            ontap: (){
                              setState(() {
                                menuIndex=18;
                              });
                            }
                        ),
                        DrawerContent(
                            img: "assets/icons/return.svg",
                            isSelect: menuIndex==19?true:false,
                            imgHeight: 32,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=19;
                              });
                            }
                        ),
                        DrawerContent(
                            img: "assets/icons/return.svg",
                            isSelect: menuIndex==20?true:false,
                            imgHeight: 32,
                            rightPadd: 15,
                            ontap: (){
                              setState(() {
                                menuIndex=20;
                              });
                            },
                           widget: Icon(Icons.attach_money,color: Colors.white,),
                        ),
                        DrawerContent(
                          img: "assets/icons/return.svg",
                          isSelect: menuIndex==21?true:false,
                          imgHeight: 32,
                          rightPadd: 15,
                          ontap: (){
                            setState(() {
                              menuIndex=21;
                            });
                          },
                          widget: Icon(Icons.person_pin,color: Colors.white,),
                        ),
                        DrawerContent(
                          img: "assets/icons/return.svg",
                          isSelect: menuIndex==22?true:false,
                          imgHeight: 32,
                          rightPadd: 15,
                          ontap: (){
                            setState(() {
                              menuIndex=22;
                            });
                          },
                          widget: Icon(Icons.person_add,color: Colors.white,),
                        ),
                        DrawerContent(
                          img: "assets/icons/return.svg",
                          isSelect: menuIndex==23?true:false,
                          imgHeight: 32,
                          rightPadd: 15,
                          ontap: (){
                            setState(() {
                              menuIndex=23;
                            });
                          },
                          widget: Icon(Icons.settings,color: Colors.white,),
                        ),
                        DrawerContent(
                          img: "assets/icons/return.svg",
                          isSelect: menuIndex==24?true:false,
                          imgHeight: 32,
                          rightPadd: 15,
                          ontap: (){
                            setState(() {
                              menuIndex=24;
                            });
                          },
                          widget: Icon(Icons.pin_drop_outlined,color: Colors.white,),
                        ),
                        DrawerContent(
                          img: "assets/icons/return.svg",
                          isSelect: menuIndex==25?true:false,
                          imgHeight: 32,
                          rightPadd: 15,
                          ontap: (){
                            setState(() {
                              menuIndex=25;
                            });
                          },
                          widget: Icon(Icons.credit_card_outlined,color: Colors.white,),
                        ),
                        SizedBox(height: 50,),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth!-100,
                  height: SizeConfig.screenHeight,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),bottomLeft: Radius.circular(7)
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //APPBAR
                      Container(
                        height: 50,
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Text(menuIndex==1?"DASHBOARD":
                            menuIndex==2?"PRODUCT":
                              menuIndex==3?"PROFILE":
                              menuIndex==4?"BRAND":
                              menuIndex==5?"USERS":
                              menuIndex==6?"CUSTOMERS":
                              menuIndex==7?"ORDERS LIST":
                              menuIndex==8?"PRODUCT SHOWCASE":
                              menuIndex==9?"PAYMENT SETTINGS":
                              menuIndex==10?"Front Cover":
                              menuIndex==11?"Featured Brand":
                              menuIndex==12?"Under Amount":
                              menuIndex==13?"Top Offers":
                              menuIndex==14?"Email Settings":
                              menuIndex==15?"Footer Page Settings":
                              menuIndex==16?"UOM Settings":
                              menuIndex==17?"Purchase":
                              menuIndex==18?"Goods Received":
                              menuIndex==19?"Return Products":
                              menuIndex==20?"Shipping Charges":
                              menuIndex==21?"Vendor List":
                              menuIndex==22?"New Vendor Request":
                              menuIndex==23?"Company Settings":
                              menuIndex==24?"Pincode":
                              menuIndex==25?"Card Classification":
                            "",
                              style: TextStyle(fontSize: 18.5,color: grey1,fontFamily: 'RR',letterSpacing: 0.2),
                            ),
                            Spacer(),
                            Container(
                              height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: th.primaryColor1.withOpacity(0.2)
                                ),
                                alignment: Alignment.center,
                                child: Icon(Icons.search,color: th.primaryColor4,size: 18,)
                            ),
                            SizedBox(width: 10,),
                            Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  //  color: th.primaryColor1.withOpacity(0.2)
                                ),
                                alignment: Alignment.center,
                                child: Icon(Icons.notifications_none_outlined,color: th.primaryColor4,size: 22,)
                            ),
                            SizedBox(width: 10,),
                            Builder(
                              builder: (BuildContext ctx1) => GestureDetector(
                                onTap: (){
                                  showPopover(
                                    barrierColor: Colors.transparent,
                                    context: ctx1,
                                    transitionDuration: const Duration(milliseconds: 150),
                                    bodyBuilder: (context) => Column(
                                      children: [
                                        SizedBox(height: 10,),
                                        profile(
                                              () {
                                                Navigator.pop(ctx1);
                                                setState(() {
                                                  menuIndex=3;
                                                });
                                              },
                                            "Profile",
                                            Icon(Icons.person_outline,size: 20,color: menuIndex==3?Colors.white:th.primaryColor3,),
                                            isSelect: menuIndex==3?true:false,
                                        ),
                                        profile(
                                                () {
                                              Navigator.pop(ctx1);
                                            },
                                            "Inbox",
                                            Icon(Icons.mail_outline,size: 20,color: th.primaryColor3,)
                                        ),
                                        profile(
                                                () {
                                              Navigator.pop(ctx1);
                                            },
                                            "Chat",
                                            Icon(Icons.chat_outlined,size: 20,color: th.primaryColor3,)
                                        ),
                                        Container(
                                          height: 1,
                                          width: 120,
                                          margin: EdgeInsets.only(top: 13,bottom: 13),
                                          color: addNewTextFieldBorder,
                                        ),
                                        profile(
                                                () {
                                              Navigator.pop(ctx1);
                                            },
                                            "Settings",
                                            Icon(Icons.settings,size: 20,color: th.primaryColor3,)
                                        ),
                                        profile(
                                                () {
                                              Navigator.pop(ctx1);
                                            },
                                            "User Access",
                                            Icon(Icons.vpn_key_outlined,size: 20,color: th.primaryColor3,)
                                        ),
                                        profile(
                                                () {
                                              Navigator.pop(ctx1);
                                            },
                                            "FAQ",
                                            Icon(Icons.wine_bar,size: 20,color: th.primaryColor3,)
                                        ),
                                        Container(
                                          height: 1,
                                          width: 120,
                                          margin: EdgeInsets.only(top: 13,bottom: 13),
                                          color: addNewTextFieldBorder,
                                        ),
                                        profile(
                                                () {
                                              Navigator.pop(ctx1);
                                            },
                                            "Logout",
                                            Icon(Icons.power_settings_new_outlined,size: 20,color: Colors.red,),
                                            textColor: Colors.red,
                                        ),
                                        SizedBox(height: 10,),
                                      ],
                                    ),
                                    onPop: () => print('Popover was popped!'),
                                    direction: PopoverDirection.bottom,
                                    width: 200,
                                    height: 290,
                                    arrowHeight: 0,
                                    arrowWidth: 0,
                                    //  backgroundColor: Color(0xFFf6f6f6),
                                    backgroundColor: Colors.white,
                                    contentDyOffset: 5,
                                    //isAttachRight: false,
                                    shadow:[
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          blurRadius: 20,
                                          spreadRadius: 2,
                                          offset: Offset(0,0)
                                      )
                                    ],
                                    margin: 30,
                                    isCustom: true,
                                    leftMargin: 0,
                                    constraints: BoxConstraints(
                                        maxHeight: 350
                                    ),
                                  );
                                },
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: th.primaryColor1.withOpacity(0.2)
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.person,color: th.primaryColor4,size: 23,)
                                ),
                              ),
                            ),
                            SizedBox(width: 30,),
                          ],
                        ),
                      ),
                      menuIndex==2?ProductHome():
                      menuIndex==3?Profile():
                      menuIndex==4?BrandGrid():
                      menuIndex==5?UsersGrid():
                      menuIndex==6?CustomersGrid():
                      menuIndex==7?OrdersListGrid():
                      menuIndex==8?ProductShowcaseGrid():
                      menuIndex==9?PaymentSettingsGrid():
                      menuIndex==10?FrontCoverSlidreGrid():
                      menuIndex==11?FeaturedBrandGrid():
                      menuIndex==12?UnderAmountGrid():
                      menuIndex==13?TopOfferGrid():
                      menuIndex==14?EmailSettingGrid():
                      menuIndex==15?FooterPageSettings():
                      menuIndex==16?UOMSettings():
                      menuIndex==17?PurchaseGrid():
                      menuIndex==18?GoodsReceivedGrid():
                      menuIndex==19?ReturnProductGrid():
                      menuIndex==20?ShippingChargesGrid():
                      menuIndex==21?VendorListGrid():
                      menuIndex==22?VendorRequestGrid():
                      menuIndex==23?CompanySettings():
                      menuIndex==24?PincodeGrid():
                      menuIndex==25?CardClassificationGrid()
                          :Container()

                    ],
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  profile(VoidCallback ontap,String title,Widget prefix,{Color? textColor=null,bool isSelect=false}){
    return InkWell(
      onTap:ontap,
      child: Container(
        height: 30,
        width:200,
        padding: EdgeInsets.only(left: 20,),
        //  margin: EdgeInsets.only(bottom: 3),
        alignment: Alignment.centerLeft,
        // color:selectedValue==data![index]?AppTheme.red: Color(0xFFf6f6f6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isSelect?Provider.of<ThemeNotifier>(context,listen: false).primaryColor3:Colors.white,
        ),
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            prefix,
            SizedBox(width: 10,),
            Text("$title",
              style: TextStyle(fontFamily: 'RR',fontSize: 16,color:isSelect?Colors.white: textColor==null?grey3:textColor
                // color:selectedValue==data![index]?Colors.white: Color(0xFF555555),letterSpacing: 0.1
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class DrawerContent extends StatelessWidget {
  String img;
  bool isSelect;
  VoidCallback ontap;
  double imgHeight;
  double rightPadd;
  Color imgColor;
  Widget? widget;
  DrawerContent({required this.img,required this.isSelect,required this.ontap,required this.imgHeight,this.rightPadd=5,
  this.imgColor=Colors.white,this.widget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        duration: animeDuration,
        curve: animeCurve,
        height: 50,
        width: 80,
        decoration: BoxDecoration(
            color:isSelect? Provider.of<ThemeNotifier>(context,listen:false).primaryColor4:Colors.transparent,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: rightPadd),
        child: widget==null?SvgPicture.asset(img,color: imgColor,height: imgHeight,):widget,
      ),
    );
  }
}




