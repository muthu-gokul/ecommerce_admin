import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover_direction.dart';
import 'package:flutter/material.dart';
import 'package:scutiwidgets/size.dart';

import '../constants.dart';

class CustomPopup extends StatelessWidget {
  List<dynamic>? data;
  Function(String)? onSelect;
  dynamic selectedValue;
  String hintText;
  double width;
  double leftMargin;
  EdgeInsets edgeInsets;
  CustomPopup({this.data,this.onSelect,this.selectedValue,required this.hintText,
    required this.width,this.leftMargin=20,this.edgeInsets=const EdgeInsets.only(left:20,)});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext ctx1) =>
          GestureDetector(
            onTap: (){
              showPopover(
                barrierColor: Colors.transparent,
                context: ctx1,
                transitionDuration: const Duration(milliseconds: 150),
                bodyBuilder: (context) => ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (ctx,index){
                    return   InkWell(
                      onTap: () {
                        Navigator.pop(ctx1);
                        onSelect!(data![index]);

                        //  onSelect!(data![index]);


                      },
                      child: Container(
                        height: 50,
                        width:width,
                        padding: EdgeInsets.only(left: 20,),
                        //  margin: EdgeInsets.only(bottom: 3),
                        alignment: Alignment.centerLeft,
                        // color:selectedValue==data![index]?AppTheme.red: Color(0xFFf6f6f6),
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child:  Text("${data![index]}",
                          style: TextStyle(fontFamily: 'RR',fontSize: 16,color: Color(0xFF505050)
                            // color:selectedValue==data![index]?Colors.white: Color(0xFF555555),letterSpacing: 0.1
                          ),
                        ),
                      ),
                    );
                  },
                ),
                onPop: () => print('Popover was popped!'),
                direction: PopoverDirection.bottom,
               // width: 245,
                width: width+leftMargin,
                height: data!.length*50.0,
                arrowHeight: 0,
                arrowWidth: 0,
                //  backgroundColor: Color(0xFFf6f6f6),
                backgroundColor: Colors.transparent,
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
                margin: 0,
                isCustom: true,
                leftMargin: leftMargin,
                constraints: BoxConstraints(
                    maxHeight: 180
                ),
              );
            },
            child: Container(
              height: 50,
              width: width,
              margin: edgeInsets,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: addNewTextFieldBorder),
                color: Colors.transparent,
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(selectedValue.isEmpty?hintText:selectedValue,
                    style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 16,fontFamily: selectedValue.isEmpty?'RL':'RR'),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down,size: 25,)
                ],
              ),
            ),
          ),
    );
  }
}
