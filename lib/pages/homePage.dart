import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/drawerContentModel.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/cardClassification/cardClassifyGrid.dart';
import 'package:ecommerce_admin/pages/customers/customersGrid.dart';
import 'package:ecommerce_admin/pages/deliveryCharge/deliveryChargeGrid.dart';
import 'package:ecommerce_admin/pages/goodsReceived/goodsReceivedGrid.dart';
import 'package:ecommerce_admin/pages/pincode/pincodeGrid.dart';
import 'package:ecommerce_admin/pages/product/productHome.dart';
import 'package:ecommerce_admin/pages/profile.dart';
import 'package:ecommerce_admin/pages/purchase/purchaseGrid.dart';
import 'package:ecommerce_admin/pages/returnProducts/returnProductGrid.dart';
import 'package:ecommerce_admin/pages/settings/uomSettings.dart';
import 'package:ecommerce_admin/pages/shippingCharges/shippingChargesGrid.dart';
import 'package:ecommerce_admin/pages/users/usersGrid.dart';
import 'package:ecommerce_admin/pages/wishList/wishListGird.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/fittedText.dart';
import 'package:scutiwidgets/size.dart';

import 'addColor/colorGrid.dart';
import 'addSize/sizeGrid.dart';
import 'attributes/attributeGrid.dart';
import 'brand/brandGrid.dart';
import 'bulkCouponGenerat/bulkCouponGenerate.dart';
import 'contactDetails/contactDetails.dart';
import 'deliveryBoyDetails/deliveryBoysGrid.dart';
import 'emailSetting/emailSettingGrid.dart';
import 'featuredBrand/featuredBrandGrid.dart';
import 'footerPageSetings/footerPageSettings.dart';
import 'frontCoverSlider/frontCoverGrid.dart';
import 'giftCoupons/giftCouponsGrid.dart';
import 'newVendorRequest/vendorRequestGrid.dart';
import 'ordersList/ordersListGrid.dart';
import 'paymentSettings/paymentSettingsGrid.dart';
import 'productShowCase/productShowCaseGrid.dart';
import 'productStock/productStockGrid.dart';
import 'refund/RefundGrid.dart';
import 'settings/companySettings.dart';
import 'staffs/staffsGrid.dart';
import 'topOffers/topOfferGrid.dart';
import 'underAmount/underAmountGrid.dart';
import 'vendor/vendorListGrid.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
bool drawerOpen=false;
class _HomePageState extends State<HomePage> {
 int menuIndex=1;

 List<DrawerContentModel> drawerContentList=[
   DrawerContentModel(img: "assets/homepage/dashboard.svg", title: "Dashboard",imgHeight: 50,),
   DrawerContentModel(img: "assets/homepage/salesReport.svg", title: "Product",imgHeight: 50,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Profile",widget: Icon(Icons.person_pin_circle_outlined,color: Colors.white,size: 28,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Brand",widget: Icon(Icons.branding_watermark,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Users",rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Customers",widget: Icon(Icons.person_pin_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Orders List",widget: Icon(Icons.star_border_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Product Showcase",widget: Icon(Icons.production_quantity_limits,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Payment Settings",widget: Icon(Icons.payments,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Front Cover",widget: Icon(Icons.local_convenience_store_rounded,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Feature Brand",widget: Icon(Icons.branding_watermark_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Under Amount",rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Top Offers",widget: Icon(Icons.local_offer_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Email Settings",widget: Icon(Icons.mail_outline,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/user-profile.svg", title: "Footer Page Settings",widget: Icon(Icons.square_foot,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/uom.svg", title: "UOM Settings",rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/homepage/purchase.svg", title: "Purchase",rightPadd: 5,imgHeight: 45,),
   DrawerContentModel(img: "assets/homepage/goodsReceived.svg", title: "Goods Received",rightPadd: 5,imgHeight: 45,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Return Products",rightPadd: 15,imgHeight: 32,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Shipping Charges",  widget: Icon(Icons.attach_money,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Vendor List",  widget: Icon(Icons.person_pin,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "New Vendor Request",  widget: Icon(Icons.person_add,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Company Settings",  widget: Icon(Icons.settings,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Pincode",  widget: Icon(Icons.pin_drop_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Card Classification",  widget: Icon(Icons.credit_card_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Gift Coupons",  widget: Icon(Icons.card_giftcard_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Bulk Coupon Generate",  widget: Icon(Icons.casino_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Wish List",  widget: Icon(Icons.favorite_border_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Staffs",  widget: Icon(Icons.perm_identity_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Refunds",  widget: Icon(Icons.assignment_return_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Contact Details",  widget: Icon(Icons.contact_page_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Product Stock",  widget: Icon(Icons.pest_control_rodent_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Attributes",  widget: Icon(Icons.attractions_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Add Color",  widget: Icon(Icons.color_lens_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Add Size",  widget: Icon(Icons.format_size_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Delivery Boys",  widget: Icon(Icons.delivery_dining_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
   DrawerContentModel(img: "assets/icons/return.svg", title: "Delivery Charge",  widget: Icon(Icons.delivery_dining_outlined,color: Colors.white,),rightPadd: 15,imgHeight: 25,),
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
                        DrawerContent(
                            img:drawerContentList[i].img,
                            isSelect: menuIndex==(i+1)?true:false,
                            imgHeight: drawerContentList[i].imgHeight,
                            rightPadd: drawerContentList[i].rightPadd,
                            ontap: (){
                              setState(() {
                                menuIndex=i+1;
                              });
                            },
                            widget: drawerContentList[i].widget,
                            drawerOpen: drawerOpen,
                            title: drawerContentList[i].title,
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
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Text("${drawerContentList[menuIndex-1].title}",
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
                      menuIndex==37?DeliveryChargeGrid()
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
  bool drawerOpen;
  String title;
  DrawerContent({required this.img,required this.isSelect,required this.ontap,required this.imgHeight,this.rightPadd=5,
  this.imgColor=Colors.white,this.widget,required this.drawerOpen,required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        duration: animeDuration,
        curve: animeCurve,
        height: 50,
        width: drawerOpen?235:80,
        decoration: BoxDecoration(
            color:isSelect? Provider.of<ThemeNotifier>(context,listen:false).primaryColor4:Colors.transparent,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: rightPadd),
        child: Row(
          children: [
            AnimatedOpacity(
              duration: animeDuration,
              opacity: drawerOpen?1:0,
              child: AnimatedContainer(
                duration: animeDuration,
                curve: animeCurve,
                width: drawerOpen?169:0,
                child: FittedText(
                  height: 19,
                  width: 165,
                  text: "   $title",
                  alignment: Alignment.centerLeft,
                  textStyle: ts18(Colors.white,),
                ),
              ),
            ),
           // SizedBox(width: drawerOpen?0:15,),
            Spacer(),
            Container(
            //  width: 50,
              alignment: Alignment.center,

              child: widget==null?SvgPicture.asset(img,color: imgColor,height: imgHeight,):widget!,
            ),

          ],
        ),
      ),
    );
  }
}




