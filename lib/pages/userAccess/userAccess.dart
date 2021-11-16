import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandAddNew.dart';
import 'package:ecommerce_admin/pages/customers/customerView.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/pages/paymentSettings/paymentSettingsAddNew.dart';
import 'package:ecommerce_admin/pages/pincode/pincodeAddNew.dart';
import 'package:ecommerce_admin/pages/ratingsReviews/ratingsView.dart';
import 'package:ecommerce_admin/pages/shippingCharges/shippingChargesAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/grid/gridFooter.dart';
import 'package:ecommerce_admin/widgets/grid/gridWithWidgetParam.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';
import 'package:scutiwidgets/pageRoutes.dart' as pr;
import '../../constants.dart';




class UserAcessGrid extends StatefulWidget {


  @override
  _UserAcessGridState createState() => _UserAcessGridState();
}

class _UserAcessGridState extends State<UserAcessGrid> {
  late double width;
  ScrollController header=new ScrollController();
  ScrollController body=new ScrollController();

  @override
  void initState() {
    Provider.of<ProductNotifier>(context,listen: false).init(false);
    Provider.of<ProductNotifier>(context,listen: false).addData();
    header.addListener(() {
      if(body.offset!=header.offset){
        body.jumpTo(header.offset);
      }
    });

    body.addListener(() {
      if(header.offset!=body.offset){
        header.jumpTo(body.offset);
      }
    });
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-100;
    List<double> widthList=[280,70,200,200,200];
    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=>Consumer<ProductNotifier>(
        builder: (context,pn,child)=>  Container(
          height: SizeConfig.screenHeight!-appBarHei,
          width: width,
          color: bgColor,
          padding: bodyPadding,
          child: Column(
            children: [

              Container(
                height: 50,
                width: SizeConfig.screenWidth,
               // color: AppTheme.bgColor,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: header,
                    child:Row(
                      children: [
                        Container(
                          width: widthList[0],
                          height: 50,
                          alignment: Alignment.centerLeft,
                          child: Text("   Module",style: ts18(grey1),),
                        ),
                        Container(
                          width: widthList[1],
                          height: 50,
                          alignment: Alignment.centerLeft,
                          child: Text("Actions",style: ts18(grey1)),
                        ),
                        Container(
                          width: widthList[2],
                          height: 50,
                          alignment: Alignment.center,
                          child: Text("Super Admin",style: ts18(grey1)),
                        ),
                        Container(
                          width: widthList[3],
                          height: 50,
                          alignment: Alignment.center,
                          child: Text("Admin",style:ts18(grey1)),
                        ),
                        Container(
                          width: widthList[4],
                          height: 50,
                          alignment: Alignment.center,
                          child: Text("General User",style: ts18(grey1)),
                        ),

                      ],
                    )
                ),
              ),

              Container(
                height: SizeConfig.screenHeight!-150,
                width: SizeConfig.screenWidth,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: body,
                  child: Container(
                    height: SizeConfig.screenHeight!-100,
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: pn.data.asMap().map((key, value) => MapEntry(key,
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                              height:value.isOpen?((value.children.length)*50)+50: 50,
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                       /// border: AppTheme.gridBottomborder
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: widthList[0],
                                          height: 50,
                                          // alignment: Alignment.centerLeft,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              value.children.isEmpty?Container(

                                                margin: EdgeInsets.only(left: 5,right: 5),
                                              ):
                                              GestureDetector(
                                                onTap:(){
                                                  setState(() {
                                                    value.isOpen=!value.isOpen;
                                                  });
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  margin: EdgeInsets.only(left: 5,right: 5),
                                                  decoration: BoxDecoration(
                                                      color: th.primaryColor3,
                                                      shape: BoxShape.circle
                                                  ),
                                                  child: Center(
                                                    child: Icon( value.isOpen?Icons.remove:Icons.add,color: Colors.white,size: 16,),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  width: widthList[0]-50,
                                                  height: 50,
                                                  alignment: Alignment.centerLeft,
                                                  child: Text("${value.parent['ModuleName']}",
                                                    style: TextStyle(fontSize: 17,color: grey3,fontFamily: 'RR'),
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: widthList[1],
                                          height: 50,
                                          alignment: Alignment.centerLeft,
                                          child: Text("${value.parent['ModuleAction']}",style: TextStyle(fontSize: 17,color: grey3,fontFamily: 'RR')),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            // if(userAccessList[3].isHasAccess){
                                            //   uan.updateUserAccess(context, value.parent['ModuleId'], 1, value.parent['1']);
                                            // }
                                            // else{
                                            //   CustomAlert().accessDenied(context,);
                                            // }

                                          },
                                          child: Container(
                                              width: widthList[2],
                                              height: 50,
                                              alignment: Alignment.center,
                                              child: AccessIcon(value: value.parent['1'])
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            // if(userAccessList[3].isHasAccess){
                                            //   uan.updateUserAccess(context, value.parent['ModuleId'], 2, value.parent['2']);
                                            // }
                                            // else{
                                            //   CustomAlert().accessDenied(context);
                                            // }
                                          },
                                          child: Container(
                                              width: widthList[3],
                                              height: 50,
                                              alignment: Alignment.center,
                                              child: AccessIcon(value: value.parent['2'])
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            // if(userAccessList[3].isHasAccess){
                                            //   uan.updateUserAccess(context, value.parent['ModuleId'], 3, value.parent['3']);
                                            // }
                                            // else{
                                            //   CustomAlert().accessDenied(context);
                                            // }

                                          },
                                          child: Container(
                                              width: widthList[4],
                                              height: 50,
                                              alignment: Alignment.center,
                                              child: AccessIcon(value: value.parent['3'])
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  for(int i=0;i<value.children.length;i++)
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          //border: AppTheme.gridBottomborder
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: widthList[0],
                                            height: 50,
                                          ),
                                          Container(
                                            width: widthList[1],
                                            height: 50,
                                            alignment: Alignment.centerLeft,
                                            child: Text("${value.children[i]['ModuleAction']}",style: TextStyle(fontSize: 17,color: grey3,fontFamily: 'RR')),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              // if(userAccessList[3].isHasAccess){
                                              //   uan.updateUserAccess(context, value.children[i]['ModuleId'], 1, value.children[i]['1']);
                                              // }
                                              // else{
                                              //   CustomAlert().accessDenied(context);
                                              // }
                                            },
                                            child: Container(
                                                width: widthList[2],
                                                height: 50,
                                                alignment: Alignment.center,
                                                child: AccessIcon(value: value.children[i]['1'])
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              // if(userAccessList[3].isHasAccess){
                                              //   uan.updateUserAccess(context, value.children[i]['ModuleId'], 2, value.children[i]['2']);
                                              // }
                                              // else{
                                              //   CustomAlert().accessDenied(context);
                                              // }
                                            },
                                            child: Container(
                                                width: widthList[3],
                                                height: 50,
                                                alignment: Alignment.center,
                                                child: AccessIcon(value: value.children[i]['2'])
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              // if(userAccessList[3].isHasAccess){
                                              //   uan.updateUserAccess(context, value.children[i]['ModuleId'], 3, value.children[i]['3']);
                                              // }
                                              // else{
                                              //   CustomAlert().accessDenied(context);
                                              // }
                                            },
                                            child: Container(
                                                width: widthList[4],
                                                height: 50,
                                                alignment: Alignment.center,
                                                child: AccessIcon(value: value.children[i]['3'])
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ))).values.toList(),
                      ),
                    ),
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
class AccessIcon extends StatelessWidget {
  int value;
  AccessIcon({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value==1?Color(0xFF60C6AD):Colors.grey[300]
      ),
      alignment: Alignment.center,
      child: value==1?Icon(Icons.done,color: Colors.white,size: 18,):
      Icon(Icons.clear,color: Colors.grey,),
      //child: Text("${value['1']}",style: AppTheme.gridTextColorTS)
    );
  }
}