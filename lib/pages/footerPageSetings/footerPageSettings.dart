import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/settings/companySettings.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/pageRoutes.dart'as pr;
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';
class FooterPageSettings extends StatefulWidget {
  const FooterPageSettings({Key? key}) : super(key: key);

  @override
  _FooterPageSettingsState createState() => _FooterPageSettingsState();
}

class _FooterPageSettingsState extends State<FooterPageSettings> with TickerProviderStateMixin{
  @override
  late TabController _tabController;
  late TabController _tabControllers;
  late  double width,height,width2,height2;

  TextEditingController pageTitle=new TextEditingController();
  TextEditingController urlSlug=new TextEditingController();
  TextEditingController heading=new TextEditingController();
  TextEditingController content=new TextEditingController();

  XFile? image=null;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4,  vsync: this);
    _tabControllers = TabController(length: 5,  vsync: this);
  }

  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-100;

    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=>Consumer<ProductNotifier>(
        builder: (context,pn,child)=> Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 500,
                padding: EdgeInsets.only(left: 25,right: 25),
                child: TabBar(
                    controller: _tabController,
                    // give the indicator a decoration (color and border radius)
                    indicatorPadding: EdgeInsets.only(top: 0),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0,),
                      color: Color(0xff873CFB),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 0,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    unselectedLabelStyle: TextStyle(fontSize: 14,fontFamily: 'RR'),
                    labelStyle: TextStyle(fontSize: 14,fontFamily: 'RR'),
                    tabs: [
                      Tab(text:"Block 1"),
                      Tab(text:"Block 2"),
                      Tab(text:"Block 3"),
                      Tab(text:"Block 4"),
                    ]
                ),
              ),
              Container(
                height: SizeConfig.screenHeight!-170,
                width: SizeConfig.screenWidth!*1,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Align(
                      alignment:Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.only(left: 25,right: 25),
                        width: SizeConfig.screenWidth!*1,
                        child:Column(
                          children: [
                            SizedBox(height: 30,),
                            Row(
                             children: [
                               Container(
                                 width:SizeConfig.screenWidth!*0.16,
                                 height: 250,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10.0,),
                                   color: Color(0xff873CFB),
                                 ),
                                 child: Container(
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Container(
                                         child: Image.asset("assets/images/image-white.png"),
                                       ),
                                       SizedBox(height: 30,),
                                       GestureDetector(
                                         onTap: (){
                                           // Navigator.push(context, pr.PageRoute().fade(CompanySettings()));
                                         },
                                         child: Container(
                                           alignment: Alignment.center,
                                           width: 100,
                                          height: 50,
                                          color: Colors.transparent,
                                          child: Text("Edit",style: TextStyle(fontSize: 14,fontFamily: 'RR',color: Colors.white),),
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                               ),
                               SizedBox(width: 20,),
                               Container(
                                 width:SizeConfig.screenWidth!*0.70,
                                 height: 250,
                                 padding: EdgeInsets.only(left: 50,right: 50,top: 50),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10.0,),
                                   color: Color(0xffECECEC),
                                 ),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                    Text("About Us",style: TextStyle(fontSize: 18,fontFamily: 'RB',color: Color(0XFF5F5F5F)),),
                                     SizedBox(height: 30,),
                                     Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum!",style: TextStyle(fontSize: 14,fontFamily: 'RR',color: Color(0XFFA4A0A1)),),
                                     SizedBox(height: 20,),
                                    Container(
                                      alignment: Alignment.centerRight,
                                        child: Text("Edit",style: TextStyle(fontSize: 14,fontFamily: 'RR',color:Color(0xff7E7E7E)),)),
                                   ],
                                 ),
                               ),
                             ],
                            ),
                            SizedBox(height: 30,),
                            Container(
                              width:SizeConfig.screenWidth!*1,
                              height: 100,
                              padding: EdgeInsets.only(left: 50,right: 50,),
                              margin: EdgeInsets.only(right: 10,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0,),
                                color: Color(0xffECECEC),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Color(0XFF485896),
                                          ),
                                          child: Icon(Icons.facebook, color: Colors.white,),
                                        ),
                                        Container(
                                          width:50,
                                          height: 50,
                                          margin: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Color(0XFF76A9EB),
                                          ),
                                          child: Icon(Icons.facebook, color: Colors.white,),
                                        ),
                                        Container(
                                          width:50,
                                          height: 50,
                                          margin: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Color(0XFFC04D3B),
                                          ),
                                          child: Icon(Icons.facebook, color: Colors.white,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                      alignment: Alignment.centerRight,
                                      child: Text("Edit",style: TextStyle(fontSize: 14,fontFamily: 'RR',color:Color(0xff7E7E7E)),)),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            Container(
                              width:SizeConfig.screenWidth!*1,
                              height: 100,
                              padding: EdgeInsets.only(left: 50,right: 50,),
                              margin: EdgeInsets.only(right: 10,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0,),
                                color: Color(0xffECECEC),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Copyright @ 2021, All Right Reseverd {Company Name}",style: TextStyle(fontSize: 14,fontFamily: 'RR',color:Color(0xff7E7E7E)),)
                                  ),
                                  Spacer(),
                                  Container(
                                      alignment: Alignment.centerRight,
                                      child: Text("Edit",style: TextStyle(fontSize: 14,fontFamily: 'RR',color:Color(0xff7E7E7E)),)),
                                ],
                              ),
                            ),
                          ],
                        ) ,
                      ),
                    ),
                    Align(
                      alignment:Alignment.topCenter,
                      child: Container(
                        width: SizeConfig.screenWidth!*1,
                        child:Column(
                          children: [
                            SizedBox(height: 30,),
                            Container(
                              width:SizeConfig.screenWidth!*0.85,
                              height: 60,
                              padding: EdgeInsets.only(left: 50,right: 50,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0,),
                                color: Color(0xffECECEC),
                              ),
                               child:Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Policy",style: TextStyle(fontSize: 18,fontFamily: 'RR',color:Color(0xff434343)),)),
                            ),
                            SizedBox(height: 30,),
                            Container(
                              width:SizeConfig.screenWidth!*0.85,
                              height: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0,),
                                color: Color(0xff873CFB),
                              ),
                              child: Container(
                                  padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                                child: Row(
                                  crossAxisAlignment:CrossAxisAlignment.center ,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          AddNewLabelTextField(
                                            width:textFormWidth,
                                              margin: EdgeInsets.only(top:10.0),
                                            textEditingController: pageTitle,
                                            hintText: "Page Title",
                                          ),
                                          SizedBox(height: 10,),
                                          AddNewLabelTextField(
                                            width:textFormWidth,
                                            margin: EdgeInsets.only(top:10.0),
                                            textEditingController: urlSlug,
                                            hintText: "URL Slug",
                                          ),
                                          SizedBox(height: 10,),
                                          PickImage(image: image, title: "Image",cb: (v){
                                            setState(() {
                                              image=v;
                                            });
                                          },),
                                          SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width:SizeConfig.screenWidth!*0.45,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 30,right: 30,),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text("Text Paragraph",style: TextStyle(fontSize: 14,fontFamily: 'RR',color:Color(0xffffffff)),),
                                                Spacer(),
                                                Text("Close",style: TextStyle(fontSize: 14,fontFamily: 'RR',color:Color(0xffffffff)),),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            width: 1000,
                                             child:TabBar(
                                                     controller: _tabControllers,
                                                     // give the indicator a decoration (color and border radius)
                                                     indicatorPadding: EdgeInsets.only(top: 0),
                                                     indicator: BoxDecoration(
                                                       borderRadius: BorderRadius.circular(10.0,),
                                                       color: Color(0xff873CFB),
                                                     ),
                                                     indicatorSize: TabBarIndicatorSize.tab,
                                                     indicatorWeight: 0,
                                                     labelColor: Color(0xffB092DE),
                                                     unselectedLabelColor: Colors.white,
                                                     unselectedLabelStyle: TextStyle(fontSize: 14,fontFamily: 'RR'),
                                                     labelStyle: TextStyle(fontSize: 14,fontFamily: 'RR'),
                                                     tabs: [
                                                       Tab(text:"Standard"),
                                                       Container(height: 10,width: 1,color: Colors.white,),
                                                       Tab(text:"Custom"),
                                                       Container(height: 10,width: 1,color: Colors.white,),
                                                       Tab(text:"Upload"),

                                                     ]
                                                 ),

                                          ),
                                          Container(
                                            height: 250,
                                            width: SizeConfig.screenWidth!*0.45,
                                            child: TabBarView(
                                            controller: _tabControllers,
                                            children: [
                                              Align(
                                                alignment:Alignment.topCenter,
                                                child:Column(
                                                  children: [
                                                    SizedBox(height: 10,),
                                                    AddNewLabelTextField(
                                                      width:textFormWidth,
                                                      margin: EdgeInsets.only(top:10.0),
                                                      textEditingController: heading,
                                                      hintText: "Heading",
                                                    ),
                                                    SizedBox(height: 10,),
                                                    AddNewLabelTextField(
                                                      width:textFormWidth,
                                                      margin: EdgeInsets.only(top:10.0),
                                                      textEditingController: content,
                                                      hintText: "Content",
                                                      maxlines: 4,
                                                    ),
                                                    Container(
                                                        width:SizeConfig.screenWidth!*0.45,
                                                        alignment: Alignment.centerRight,
                                                        padding: EdgeInsets.only(right: 90),
                                                        child: Text("Add",style: TextStyle(fontSize: 18,fontFamily: 'RR',color:Color(0xffffffff)),)),
                                                  ],
                                                ) ,
                                             ),
                                              Container(),
                                              Align(
                                                alignment:Alignment.topCenter,
                                                child: Text('dsdcsghg'),
                                              ),
                                              Container(),
                                              Align(
                                                alignment:Alignment.topCenter,
                                                child:Column(
                                                  children: [
                                                    SizedBox(height: 10,),
                                                    AddNewLabelTextField(
                                                      width:textFormWidth,
                                                      margin: EdgeInsets.only(top:10.0),
                                                      textEditingController: heading,
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Container(
                                                        width:SizeConfig.screenWidth!*0.45,
                                                        alignment: Alignment.centerRight,
                                                        padding: EdgeInsets.only(right: 90),
                                                        child: Text("Add Document",style: TextStyle(fontSize: 18,fontFamily: 'RR',color:Color(0xffffffff)),)),
                                                  ],
                                                ) ,
                                              ),
                                            ],
                                            )
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width:SizeConfig.screenWidth!*0.85,
                                alignment: Alignment.centerRight,
                                child: Text("Add",style: TextStyle(fontSize: 18,fontFamily: 'RR',color:Color(0xff7E7E7E)),)),
                          ],
                        ) ,
                      ),
                    ),
                    Align(
                      alignment:Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.only(left: 50,right: 50,),
                        width: SizeConfig.screenWidth!*1,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30,),
                            Container(
                              width:SizeConfig.screenWidth!*0.40,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0,),
                                color: Color(0xff873CFB),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                       Row(
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                             Text("Mail Us",style: TextStyle(fontSize: 18,fontFamily: 'RR',color:Color(0xffffffff)),),
                                           Spacer(),
                                           Text("Edit",style: TextStyle(fontSize: 18,fontFamily: 'RR',color:Color(0xffffffff)),),
                                         ],
                                       ),
                                   SizedBox(height: 30,),
                                   Text("Mail Us",style: TextStyle(fontSize: 18,fontFamily: 'RR',color:Color(0xffffffff)),),
                                   SizedBox(height: 5,),
                                    Container(
                                      width: 250,
                                      child: Text("No: 4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai - 600095",style: TextStyle(fontSize: 18,fontFamily: 'RR',color:Color(0xffffffff)),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ) ,
                      ),
                    ),
                    Align(
                      alignment:Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.only(left: 50,right: 50,),
                        width: SizeConfig.screenWidth!*1,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30,),
                            Container(
                              width:SizeConfig.screenWidth!*0.40,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0,),
                                color: Color(0xff873CFB),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Registered Office Address",style: TextStyle(fontSize: 18,fontFamily: 'RR',color:Color(0xffffffff)),),
                                        Spacer(),
                                        Text("Edit",style: TextStyle(fontSize: 18,fontFamily: 'RR',color:Color(0xffffffff)),),
                                      ],
                                    ),
                                    SizedBox(height: 30,),
                                    Text("Registered Office Address",style: TextStyle(fontSize: 18,fontFamily: 'RR',color:Color(0xffffffff)),),
                                    SizedBox(height: 5,),
                                    Container(
                                      width: 250,
                                      child: Text("No: 4B/7, 1st Floor, MMDA 1st Main Road, Maduravoyal, Chennai - 600095",style: TextStyle(fontSize: 18,fontFamily: 'RR',color:Color(0xffffffff)),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ) ,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
         )


      ),
    );
  }
}
