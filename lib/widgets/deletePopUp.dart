import 'package:ecommerce_admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scutiwidgets/size.dart';

import 'circle.dart';

class DeletePopUp extends StatelessWidget {
  bool showDelete;
  VoidCallback cancelCb;
  VoidCallback deleteCb;
  DeletePopUp({required this.showDelete,required this.deleteCb,required this.cancelCb});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !showDelete,
      child: AnimatedOpacity(
        duration: animeDuration,
        opacity: showDelete?1:0,
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          color:Colors.black45,
          alignment: Alignment.center,
          child: Container(
            height: 290,
            width: 380,
            decoration: BoxDecoration(
              //    color: Colors.red
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom:0,
                  child: Container(
                    height: 250,
                    width: 380,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("You are about to delete a product",
                          style: ts18(Color(0xff222222),fontfamily: 'RM'),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 300,
                          child: Text("This will delete your product from catalog",
                            style: TextStyle(color:Color(0xff9B9B9B),fontFamily: 'RR',fontSize: 16,),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(" Are you sure ?",
                            style: TextStyle(color:Color(0xff9B9B9B),fontFamily: 'RM',fontSize: 16,)
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap:cancelCb,
                              child: Container(
                                width: 100,
                                height: 37,
                                decoration: BoxDecoration(

                                ),
                                alignment: Alignment.center,
                                child: Text("Cancel",style: ts18(Color(0xff222222),fontfamily: 'RM',fontsize: 15.7,ls: 0.5),),
                              ),
                            ),
                            GestureDetector(
                              onTap: deleteCb,
                              child: Container(
                                width: 100,
                                height: 37,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                alignment: Alignment.center,
                                child: Text("Delete",style: ts16(Colors.white,fontfamily: 'RM'),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Circle(
                        hei:80,
                        color: Color(0xff8c8c8c),

                        //   color: Color(0xffffffff),
                        widget: Center(
                            child: Circle(
                              hei: 60,
                              color: Colors.red,
                              bs: [
                                BoxShadow(
                                    color:  Color(0xff8c8c8c).withOpacity(1),
                                    blurRadius: 15,
                                    spreadRadius: 2,
                                    offset: Offset(0,10)
                                )
                              ],
                              widget: Center(child: SvgPicture.asset("assets/icons/delete.svg",color: Colors.white,height: 30,)),
                            )
                        )
                    )
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
