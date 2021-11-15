import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../constants.dart';

class MultiTags extends StatefulWidget {
  List<dynamic> data;
  String hintText;
  double textFieldWidth;
  double width;
  MultiTags({required this.data,required this.hintText,this.textFieldWidth=400,required this.width});
  @override
  _MultiTagsState createState() => _MultiTagsState();
}

class _MultiTagsState extends State<MultiTags> {
  TextEditingController pTags=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    return Container(
      margin: EdgeInsets.only(right: 0,top: 10),
      padding: EdgeInsets.only(top: 10,bottom: 10),
      decoration: BoxDecoration(
       // border: Border.all(color: addNewTextFieldBorder),
        borderRadius: BorderRadius.circular(5),
        //color: Colors.white,
      ),
      width: widget.width,
      constraints: BoxConstraints(
        // maxWidth: 400,
        // minWidth: 400,
          minHeight: 50
      ),
      child: Wrap(
        runSpacing: 10,
        children: [
          for(int i=0;i<widget.data.length;i++)
            Container(
              padding: EdgeInsets.only(top: 3,bottom: 3,left: 5,right: 5),
              margin: EdgeInsets.only(left: 10),
              width: (widget.data[i].length*8.0)+40,
              alignment:Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2
              ),
              constraints: BoxConstraints(
                minHeight: 35,
                minWidth: 55,
                // maxWidth:(tagsList[i].length*11)+35
              ),
              child: Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${widget.data[i]}",style: ts16(Colors.white),),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        widget.data.removeAt(i);
                      });
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      //margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor4
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.clear,color: Colors.white,size: 18,),
                    ),
                  )
                ],
              ),
            ),

          AddNewLabelTextField(
            margin: EdgeInsets.only(left: 0),
            textEditingController: pTags,
            hintText:widget.hintText,
            onEditComplete: (){
              if(pTags.text.isNotEmpty){
                setState(() {
                  widget.data.add(pTags.text);
                  pTags.clear();
                });
                //  node.unfocus();
              }
              else{
                node.unfocus();
              }

            },
            onChange: (v){},
            width: widget.textFieldWidth,
            suffixIcon: InkWell(
              onTap: (){
                if(pTags.text.isNotEmpty){
                  setState(() {
                    widget.data.add(pTags.text);
                    pTags.clear();
                  });
                  //  node.unfocus();
                }
                else{
                  node.unfocus();
                }
              },
              child: Container(
                  height: 50,
                  width: 60,
                  color: Colors.transparent,
                  alignment: Alignment.centerLeft,
                  child: Text("Add",style: ts18(Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,fontfamily: 'RM'),)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
