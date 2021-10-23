import 'package:flutter/material.dart';

import '../constants.dart';
import 'overlayContainer.dart';

class OverLayPopUp extends StatefulWidget {
 VoidCallback ontap;
 double width;
 String selectedValue;
 bool showPopUp;
 List<dynamic> data;
 Function(int) onitemTap;
 bool isToJson;
 String propertyName;
 String hinttext;
 OverLayPopUp({required this.ontap,required this.width,required this.selectedValue,required this.showPopUp,
 required this.data,required this.onitemTap,required this.isToJson,this.propertyName="",required this.hinttext});

  @override
  State<OverLayPopUp> createState() => _OverLayPopUpState();
}

class _OverLayPopUpState extends State<OverLayPopUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        GestureDetector(
          onTap:widget.ontap,
          child: Container(
            height: 50,
            width: widget.width-20,
            // margin: paddTextFieldHeader,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: addNewTextFieldBorder),
              color: Colors.white,
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(widget.selectedValue.isEmpty?"${widget.hinttext}":widget.selectedValue,
                  style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 16,fontFamily: widget.selectedValue.isEmpty?'RL':'RR'),
                ),
                Spacer(),
                Icon(Icons.arrow_drop_down,size: 25,)
              ],
            ),
          ),
        ),
        OverlayContainer(
          show: widget.showPopUp,
          position: OverlayContainerPosition(0, 0,),
          child: Container(
            height:  widget.data.length*50.0,
            width: textFormWidth-20,
            margin: const EdgeInsets.only(top: 5),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: Offset(0,0)
                  )
                ]
            ),
            child:  ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (ctx,index){
                return   InkWell(
                  onTap:(){
                    setState(() {
                      widget.showPopUp=false;
                    });
                    widget.onitemTap(index);
                  },
                  child: Container(
                    height: 50,
                    width:textFormWidth,
                    padding: EdgeInsets.only(left: 20,),
                    //  margin: EdgeInsets.only(bottom: 3),
                    alignment: Alignment.centerLeft,
                    // color:selectedValue==data![index]?AppTheme.red: Color(0xFFf6f6f6),
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child:  Text(widget.isToJson?"${widget.data[index].get(widget.propertyName)}":"${widget.data[index]}",
                      style: TextStyle(fontFamily: 'RR',fontSize: 16,color: Colors.grey
                        // color:selectedValue==data![index]?Colors.white: Color(0xFF555555),letterSpacing: 0.1
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
