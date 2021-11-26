import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/drawerContentModel.dart';
import 'package:ecommerce_admin/notifiers/reportNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/about/about.dart';
import 'package:ecommerce_admin/pages/cardClassification/cardClassifyGrid.dart';
import 'package:ecommerce_admin/pages/customers/customersGrid.dart';
import 'package:ecommerce_admin/pages/deliveryCharge/deliveryChargeGrid.dart';
import 'package:ecommerce_admin/pages/goodsReceived/goodsReceivedGrid.dart';
import 'package:ecommerce_admin/pages/holiday/holidayGrid.dart';
import 'package:ecommerce_admin/pages/invoice/invoiceGrid.dart';
import 'package:ecommerce_admin/pages/pincode/pincodeGrid.dart';
import 'package:ecommerce_admin/pages/product/productHome.dart';
import 'package:ecommerce_admin/pages/profile.dart';
import 'package:ecommerce_admin/pages/profile/profile2.dart';
import 'package:ecommerce_admin/pages/purchase/purchaseGrid.dart';
import 'package:ecommerce_admin/pages/ratingsReviews/ratingsReviewsGrid.dart';
import 'package:ecommerce_admin/pages/reports/allReports.dart';
import 'package:ecommerce_admin/pages/reports/reportGrid.dart';
import 'package:ecommerce_admin/pages/returnProducts/returnProductGrid.dart';
import 'package:ecommerce_admin/pages/settings/uomSettings.dart';
import 'package:ecommerce_admin/pages/shippingCharges/shippingChargesGrid.dart';
import 'package:ecommerce_admin/pages/subscriptionNEWAPP/adminSubscriptionPlan/adminSubsPlanGrid.dart';
import 'package:ecommerce_admin/pages/users/usersGrid.dart';
import 'package:ecommerce_admin/pages/wishList/wishListGird.dart';
import 'package:ecommerce_admin/widgets/arrowAnimation.dart';
import 'package:ecommerce_admin/widgets/circle.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/expandedSection.dart';
import 'package:scutiwidgets/fittedText.dart';
import 'package:scutiwidgets/size.dart';

import 'addColor/colorGrid.dart';
import 'addSize/sizeGrid.dart';
import 'appMaster/appGrid.dart';
import 'attributes/attributeGrid.dart';
import 'blog/blogGrid.dart';
import 'branch/branchGrid.dart';
import 'brand/brandGrid.dart';
import 'bulkCouponGenerat/bulkCouponGenerate.dart';
import 'contactDetails/contactDetails.dart';
import 'contactMessage/contactMsgGrid.dart';
import 'deliveryBoyDetails/deliveryBoysGrid.dart';
import 'emailSetting/emailSettingGrid.dart';
import 'featuredBrand/featuredBrandGrid.dart';
import 'footerPageSetings/footerPageSettings.dart';
import 'frontCoverSlider/frontCoverGrid.dart';
import 'giftCoupons/giftCouponsGrid.dart';
import 'installationCharges/installationChargeGrid.dart';
import 'manageUsers/manageUsersGrid.dart';
import 'message/bulkmessage.dart';
import 'message/newsletter.dart';
import 'newVendorRequest/vendorRequestGrid.dart';
import 'ordersList/ordersListGrid.dart';
import 'payment/paymentGrid.dart';
import 'paymentSettings/paymentSettingsGrid.dart';
import 'productShowCase/productShowCaseGrid.dart';
import 'productStock/productStockGrid.dart';
import 'refund/RefundGrid.dart';
import 'settings/companySettings.dart';
import 'settings/settings.dart';
import 'staffs/staffsGrid.dart';
import 'subscriptionNEWAPP/invoice/SubsInvoiceGrid.dart';
import 'subscriptionNEWAPP/subscriberList/subscriberListGrid.dart';
import 'taxes/taxesAddGroupsAdd.dart';
import 'topOffers/topOfferGrid.dart';
import 'underAmount/underAmountGrid.dart';
import 'userAccess/userAccess.dart';
import 'vendor/vendorListGrid.dart';

bool drawerOpen=false;
double appBarHei=60;
double gridReduceHei=270;
EdgeInsets bodyPadding=EdgeInsets.only(left: 20,right: 20,top: 20);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int menuIndex=2;
 int expandIndex=-1;
 String title="Product Details";

 List<DrawerContentModel> drawerContentList=[
   DrawerContentModel(img: "assets/homepage/dashboard.svg", title: "Dashboard",imgHeight: 50,index: 1),
   DrawerContentModel(img: "assets/homepage/salesReport.svg", title: "Products",imgHeight: 50,index: 100,
      list: [
        DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Brand",widget: Icon(Icons.branding_watermark,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 4),
        DrawerContentModel(img: "assets/homepage/salesReport.svg", title: "Product Details",imgHeight: 50,index: 2),
        DrawerContentModel(img: "assets/icons/return.svg", title: "Ratings & Reviews",  widget: Icon(Icons.rate_review,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 39),
        DrawerContentModel(img: "assets/icons/return.svg", title: "Wish List",  widget: Icon(Icons.favorite_border_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 28),
      ]
   ),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Orders List",widget: Icon(Icons.star_border_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 7),
   DrawerContentModel(img: "assets/homepage/salesReport.svg", title: "Inventory ",imgHeight: 50,index: 101,
      list: [
        DrawerContentModel(img: "assets/homepage/purchase.svg", title: "Purchase",rightPadd: 5,imgHeight: 45,index: 17),
        DrawerContentModel(img: "assets/homepage/goodsReceived.svg", title: "Goods Received",rightPadd: 5,imgHeight: 45,index: 18),
        DrawerContentModel(img: "assets/icons/return.svg", title: "Product Stock",  widget: Icon(Icons.pest_control_rodent_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 32),
        DrawerContentModel(img: "assets/icons/return.svg", title: "Return Products",rightPadd: 15,imgHeight: 32,index: 19),
      ]
   ),
   DrawerContentModel(img: "assets/homepage/salesReport.svg", title: "Accounts & Finance ",imgHeight: 50,index: 102,
       list: [
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Payment Details", widget: Icon(Icons.attach_money,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 45),
         DrawerContentModel(img: "assets/icons/return.svg", title: "Shipping Charges",  widget: Icon(Icons.attach_money,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 20),
         DrawerContentModel(img: "assets/icons/return.svg", title: "Card Classification",  widget: Icon(Icons.credit_card_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 25),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Taxes", widget: Icon(Icons.local_grocery_store_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 42),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Invoice", widget: Icon(Icons.attach_money,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 44),
         DrawerContentModel(img: "assets/icons/return.svg", title: "Refund",  widget: Icon(Icons.assignment_return_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 30),
       ]
   ),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Settings",  widget: Icon(Icons.settings,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 49,
       list: [
/*         DrawerContentModel(img: "assets/icons/return.svg", title: "Company Settings",  widget: Icon(Icons.settings,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
         DrawerContentModel(img: "assets/icons/return.svg", title: "New Vendor Request",  widget: Icon(Icons.person_add,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Customer Master",widget: Icon(Icons.person_pin_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "User Master",rightPadd: 15,imgHeight: 25,),
         DrawerContentModel(img: "assets/icons/return.svg", title: "Staff Master",  widget: Icon(Icons.perm_identity_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Email Settings",widget: Icon(Icons.mail_outline,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Payment Settings",widget: Icon(Icons.payments,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
         DrawerContentModel(img: "assets/homepage/uom.svg", title: "Unit of Measure",rightPadd: 15,imgHeight: 25,),
         DrawerContentModel(img: "assets/icons/return.svg", title: "Pincode",  widget: Icon(Icons.pin_drop_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
         DrawerContentModel(img: "assets/icons/return.svg", title: "Attributes",  widget: Icon(Icons.attractions_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
         DrawerContentModel(img: "assets/icons/return.svg", title: "Add Color",  widget: Icon(Icons.color_lens_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
         DrawerContentModel(img: "assets/icons/return.svg", title: "Add Size",  widget: Icon(Icons.format_size_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "App", widget: Icon(Icons.app_blocking_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),*/
       ]
   ),

   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Reports", widget: Icon(Icons.notes,color: Colors.white,),rightPadd: 15,imgHeight: 25,isReport: true,index: 53,

   ),

   DrawerContentModel(img: "assets/homepage/dashboard.svg", title: "Website ",imgHeight: 50,index: 103,
       list: [
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Front Cover Slider",widget: Icon(Icons.local_convenience_store_rounded,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 10),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Product Showcase",widget: Icon(Icons.production_quantity_limits,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 8),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Feature Brand",widget: Icon(Icons.branding_watermark_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 11),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Under Amount",rightPadd: 15,imgHeight: 25,index: 12),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Top Offers",widget: Icon(Icons.local_offer_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 13),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Footer Page Settings",widget: Icon(Icons.square_foot,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 15),
         DrawerContentModel(img: "assets/icons/return.svg", title: "Contact Details", widget: Icon(Icons.contact_page_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 31),
         DrawerContentModel(img: "assets/icons/return.svg", title: "About", widget: Icon(Icons.contact_page_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 70),
         DrawerContentModel(img: "assets/icons/return.svg", title: "Blog", widget: Icon(Icons.contact_page_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 71),
         ]
   ),

   DrawerContentModel(img: "assets/homepage/dashboard.svg", title: "Delivery",imgHeight: 50,index: 104,
      list: [
        DrawerContentModel(img: "assets/icons/return.svg", title: "Delivery Boys",  widget: Icon(Icons.delivery_dining_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 36),
        DrawerContentModel(img: "assets/icons/return.svg", title: "Delivery Charge",  widget: Icon(Icons.delivery_dining_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 37),
        DrawerContentModel(img: "assets/icons/return.svg", title: "Installation Charge",  widget: Icon(Icons.attach_money,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 38),
        DrawerContentModel(img: "assets/icons/return.svg", title: "Holiday",  widget: Icon(Icons.attach_money,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 69),
      ]
   ),
   DrawerContentModel(img: "assets/homepage/dashboard.svg", title: "Marketing ",imgHeight: 50,index: 105,
       list: [
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "News Letter", widget: Icon(Icons.legend_toggle_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 47),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Contact Message", widget: Icon(Icons.message_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 46),
         DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Bulk SMS Message", widget: Icon(Icons.sms_failed_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 48),
         DrawerContentModel(img: "assets/icons/return.svg", title: "Gift Coupons",  widget: Icon(Icons.card_giftcard_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 26),
         DrawerContentModel(img: "assets/icons/return.svg", title: "Bulk Coupon Generate",  widget: Icon(Icons.casino_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 27),
        ]
   ),
 //DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Profile",widget: Icon(Icons.person_pin_circle_outlined,color: Colors.white,size: 28,),rightPadd: 15,imgHeight: 25,),


   DrawerContentModel(img: "assets/icons/return.svg", title: "Vendor List",  widget: Icon(Icons.person_pin,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 21),

   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Manage Users",rightPadd: 15,imgHeight: 25,index: 40),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "User Access",rightPadd: 15,imgHeight: 25,index: 41),



   //DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Settings", widget: Icon(Icons.settings_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Admin Subscription Plan", widget: Icon(Icons.add_task_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 50),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Subscriber List", widget: Icon(Icons.add_task_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 51),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Invoice", widget: Icon(Icons.calendar_view_month_sharp,color: Colors.white,),rightPadd: 15,imgHeight: 25,index: 52),





   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Profile 2",rightPadd: 15,imgHeight: 25,index: 68),
 ];


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
                AnimatedContainer(
                  duration: animeDuration,
                  curve: animeCurve,
                  width: drawerOpen?250:100,
                  height: SizeConfig.screenHeight,
                  color: th.primaryColor2,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Padding(
                          padding:  EdgeInsets.only(left: 15),
                          child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  drawerOpen=!drawerOpen;
                                });
                              },
                              child: Image.asset("assets/login/logo.jpg",height: 80,)
                          ),
                        ),
                        SizedBox(height: 20,),
                        for(int i=0;i<drawerContentList.length;i++)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DrawerContent(
                                img:drawerContentList[i].img,
                                isSelect:expandIndex!=-1?expandIndex==drawerContentList[i].index: menuIndex==drawerContentList[i].index,
                                imgHeight: drawerContentList[i].imgHeight,
                                rightPadd:drawerContentList[i].list.isEmpty? drawerContentList[i].rightPadd:15.0,
                                ontap: (){
                                  if(drawerContentList[i].list.isEmpty){
                                    setState(() {
                                      menuIndex=drawerContentList[i].index;
                                      expandIndex=-1;
                                      title=drawerContentList[i].title;
                                    });
                                  }
                                  else{
                                    if(expandIndex==drawerContentList[i].index){
                                      setState(() {
                                        expandIndex=-1;
                                      });
                                    }
                                    else{
                                      setState(() {
                                        menuIndex=-1;
                                        expandIndex=drawerContentList[i].index;
                                        // drawerContentList[i].isExpand=!drawerContentList[i].isExpand;
                                      });
                                    }

                                  }
                                },
                                arrow:drawerContentList[i].list.isEmpty?Container():
                                Arrow(isOpen: expandIndex==drawerContentList[i].index,color: Colors.white,),
                                drawerOpen: drawerOpen,
                                title: drawerContentList[i].title,
                              ),
                              CustomExpansionTile(
                                  expand:  expandIndex==drawerContentList[i].index,
                                  child: Container(
                                //    color: Colors.red,
                                    height: drawerContentList[i].list.length*50,
                                   // width: drawerOpen?250:100,
                                    width: drawerOpen?240:80,
                                    alignment: Alignment.topCenter,
                                    //padding: EdgeInsets.only(left: 10),
                                    child: ListView.builder(
                                    itemCount: drawerContentList[i].list.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (ctx,j){
                                      return DrawerContent(
                                        img:drawerContentList[i].list[j].img,
                                        isSelect: false,
                                        isTextClr: menuIndex==drawerContentList[i].list[j].index,
                                        imgHeight: drawerContentList[i].list[j].imgHeight,
                                        rightPadd: drawerContentList[i].list[j].rightPadd,
                                        leftPadd: 10,
                                        ontap: (){
                                          setState(() {
                                            menuIndex=drawerContentList[i].list[j].index;
                                            title=drawerContentList[i].list[j].title;
                                          });
                                          if(drawerContentList[i].list[j].isReport){
                                            Provider.of<ReportNotifier>(context,listen: false).assignData(drawerContentList[i].list[j].title);
                                          }
                                        },
                                        widget: Container(height: 0,width: 0,),
                                        drawerOpen: drawerOpen,
                                        title: drawerContentList[i].list[j].title,
                                      );
                                    },
                                  )
                                  ),

                              ),
                            ],
                          ),


                        SizedBox(height: 50,),
                      ],
                    ),
                  ),
                ),

                AnimatedContainer(
                  duration: animeDuration,
                  curve: animeCurve,
                  width: SizeConfig.screenWidth!-(drawerOpen?250:100),
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
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Text(menuIndex==3?"Profile":
                            menuIndex==40?"Manage Users":menuIndex==41?"User Access":
                            "${title}",
                              style: TextStyle(fontSize: 18.5,color: grey1,fontFamily: 'RR',letterSpacing: 0.2),
                            ),
                            Spacer(),
                            /*Container(
                              height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: th.primaryColor1.withOpacity(0.2)
                                ),
                                alignment: Alignment.center,
                                child: Icon(Icons.search,color: th.primaryColor4,size: 18,)
                            ),
                            SizedBox(width: 10,),*/
                            Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  //  color: th.primaryColor1.withOpacity(0.2)
                                ),
                                alignment: Alignment.center,
                                child: Icon(Icons.notifications_none_outlined,color: th.primaryColor4,size: 28,)
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
                                            null,
                                            isSelect: menuIndex==3?true:false,
                                            iconData: Icons.person_outline,
                                        ),
                                        profile(
                                                () {
                                              Navigator.pop(ctx1);
                                            },
                                            "Inbox",
                                            null,
                                            iconData: Icons.mail_outline
                                        ),
                                        profile(
                                                () {
                                              Navigator.pop(ctx1);
                                            },
                                            "Chat",
                                            null,
                                            iconData: Icons.chat_outlined
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
                                            null,
                                            iconData: Icons.settings
                                        ),
                                        profile(
                                                () {
                                                  setState(() {
                                                    menuIndex=40;
                                                  });
                                              Navigator.pop(ctx1);
                                            },
                                            "Manage Users",
                                            null,
                                          isSelect: menuIndex==40?true:false,
                                          iconData: Icons.person_outline
                                        ),
                                        profile(
                                                () {
                                                  setState(() {
                                                    menuIndex=41;
                                                  });
                                              Navigator.pop(ctx1);
                                            },
                                            "User Access",
                                            null,
                                          isSelect: menuIndex==41?true:false,
                                          iconData: Icons.vpn_key_outlined
                                        ),
                                        profile(
                                                () {
                                              Navigator.pop(ctx1);
                                            },
                                            "FAQ",
                                            null,
                                          iconData: Icons.wine_bar
                                        ),
                                        Container(
                                          height: 1,
                                          width: 120,
                                          margin: EdgeInsets.only(top: 13,bottom: 0),
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
                                    height: 305,
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
                      menuIndex==25?CardClassificationGrid():
                      menuIndex==26?GiftCouponsGrid():
                      menuIndex==27?BulkCouponGenerate():
                      menuIndex==28?WishListGird():
                      menuIndex==29?StaffsGird():
                      menuIndex==30?RefundGird():
                      menuIndex==31?ContactDetails():
                      menuIndex==32?ProductStockGrid():
                      menuIndex==33?AttributeGrid():
                      menuIndex==34?ColorGrid():
                      menuIndex==35?SizeGrid():
                      menuIndex==36?DeliveryBoysGrid():
                      menuIndex==37?DeliveryChargeGrid():
                      menuIndex==38?InstallationChargesGird():
                      menuIndex==39?RatingsReviewsGrid():
                      menuIndex==40?ManageUsersGird():
                      menuIndex==41?UserAcessGrid():
                      menuIndex==42?TaxesGroups():
                      menuIndex==43?AppGrid():
                      menuIndex==44?InvoiceGrid():
                      menuIndex==45?PaymentGrid():
                      menuIndex==46?ContactMsgGrid():
                      menuIndex==47?NewsLette():
                      menuIndex==48?BulkSMS():
                      menuIndex==49?Settings():
                      menuIndex==50?AdminSubsPlanGrid():
                      menuIndex==51?SubscriberListGrid():
                      menuIndex==52?SubscriberInvoice():
                      menuIndex==53 || menuIndex==54 || menuIndex==55  || menuIndex==56 || menuIndex==57  || menuIndex==58  || menuIndex==59 || menuIndex==60 || menuIndex==61 || menuIndex==62 || menuIndex==63 || menuIndex==64 || menuIndex==65 || menuIndex==66 || menuIndex==67?AllReports():
                      menuIndex==68?Profile2():
                      menuIndex==69?HolidayGrid():
                      menuIndex==70?AboutWebAdd():
                      menuIndex==71?BlogGrid():
                          Container()

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

  profile(VoidCallback ontap,String title,Widget? prefix,{Color? textColor=null,bool isSelect=false,IconData iconData=Icons.eleven_mp}){
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
            prefix==null?  Icon(iconData,size: 20,color: isSelect?Colors.white:Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,):prefix!,
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

/*class DrawerContent extends StatelessWidget {
  String img;
  bool isSelect;
  VoidCallback ontap;
  double imgHeight;
  double rightPadd;
  double leftPadd;
  Color imgColor;
  Widget? widget;
  bool drawerOpen;
  String title;
  DrawerContent({required this.img,required this.isSelect,required this.ontap,required this.imgHeight,this.rightPadd=5,
  this.imgColor=Colors.white,this.widget,required this.drawerOpen,required this.title,this.leftPadd=0.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        duration: animeDuration,
        curve: animeCurve,
        height: 50,
        width: drawerOpen?250:80,
        decoration: BoxDecoration(
            color:isSelect? Provider.of<ThemeNotifier>(context,listen:false).primaryColor4:Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(25))
            // borderRadius: BorderRadius.only(
            //   topRight: Radius.circular(25),
            //   bottomRight: Radius.circular(25),
            // )
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: rightPadd,),
        child: Row(
          children: [
            leftPadd==0?Container():Padding(
              padding: EdgeInsets.only(left: 13),
              child: Circle(hei: 8, color: Provider.of<ThemeNotifier>(context,listen:false).primaryColor1),
            ),
            SizedBox(width:leftPadd==0? 10:8,),
            AnimatedOpacity(
              duration: animeDuration,
              opacity: drawerOpen?1:0,
              child: AnimatedContainer(
                duration: animeDuration,
                curve: animeCurve,
                width: drawerOpen?155:0,
                child: FittedText(
                  height: 19,
                  width: 155,
                  text: "$title",
                  alignment: Alignment.centerLeft,
                  textStyle: ts18(Colors.white,),
                ),
              ),
            ),
           // SizedBox(width: drawerOpen?0:15,),
            Spacer(),
            Container(
              //width: 50,
              alignment: Alignment.center,

              child: widget==null?SvgPicture.asset(img,color: imgColor,height: imgHeight,):widget!,
            ),

          ],
        ),
      ),
    );
  }
}*/
class DrawerContent extends StatelessWidget {
  String img;
  bool isSelect;
  VoidCallback ontap;
  double imgHeight;
  double rightPadd;
  double leftPadd;
  Color imgColor;
  Widget? widget;
  bool drawerOpen;
  String title;
  Widget? arrow;
  bool isTextClr;
  DrawerContent({required this.img,required this.isSelect,required this.ontap,required this.imgHeight,this.rightPadd=5,
  this.imgColor=Colors.white,this.widget,required this.drawerOpen,required this.title,this.leftPadd=0.0,this.arrow,this.isTextClr=false});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        duration: animeDuration,
        curve: animeCurve,
        height: 50,
        width: drawerOpen?250:100,
        decoration: BoxDecoration(
          //color: Colors.white,
            color:isSelect? Provider.of<ThemeNotifier>(context,listen:false).primaryColor4:Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(25))
            // borderRadius: BorderRadius.only(
            //   topRight: Radius.circular(25),
            //   bottomRight: Radius.circular(25),
            // )
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 0,),
        child: Row(
          children: [
            /*leftPadd==0?Container():Padding(
              padding: EdgeInsets.only(left: 13),
              child: Circle(hei: 8, color: Provider.of<ThemeNotifier>(context,listen:false).primaryColor1),
            ),
            SizedBox(width:leftPadd==0? 10:8,),*/
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,

              child: widget==null?SvgPicture.asset(img,color: imgColor,height: imgHeight,):widget!,
            ),
            leftPadd==0?Container():Padding(
              padding: EdgeInsets.only(left: 13,right: 10),
              child: Circle(hei: 8, color: Provider.of<ThemeNotifier>(context,listen:false).primaryColor4),
            ),
            AnimatedOpacity(
              duration: animeDuration,
              opacity: drawerOpen?1:0,
              child: AnimatedContainer(
                duration: animeDuration,
                curve: animeCurve,
              //  color: Colors.red,
                width: drawerOpen?leftPadd==0?160:159:0,
                child: FittedText(
                  height: 19,
                  width: 155,
                  text: "$title",
                  alignment: Alignment.centerLeft,
                  textStyle: ts18(isTextClr?Provider.of<ThemeNotifier>(context,listen:false).primaryColor4:Colors.white,),
                ),
              ),
            ),
           arrow==null?Container():arrow!
           // SizedBox(width: drawerOpen?0:15,),
           // Spacer(),


          ],
        ),
      ),
    );
  }
}




