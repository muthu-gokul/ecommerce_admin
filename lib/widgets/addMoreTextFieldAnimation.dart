import 'dart:async';

import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import 'buttons/addBtn.dart';

class AddMoreTextFieldAnimation extends StatefulWidget {
  List<dynamic> data;
  Function(int) deleteCB;
  VoidCallback addCB;
  String hintText;
  double wid;
  AddMoreTextFieldAnimation({required this.data,required this.hintText,required this.addCB,required this.deleteCB,this.wid=300});
  @override
  _AddMoreTextFieldAnimationState createState() => _AddMoreTextFieldAnimationState();
}

class _AddMoreTextFieldAnimationState extends State<AddMoreTextFieldAnimation> {
  final GlobalKey<AnimatedListState> key = GlobalKey<AnimatedListState>();
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        key.currentState!.insertItem(0, duration: const Duration(milliseconds: 1));
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.data.length*60,
      width: widget.wid,
      child: AnimatedList(
        key: key,
        initialItemCount: widget.data.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, i, animation) {
          return slideIt(context, i, animation,true);
        },
      ),
    );
  }

  Widget slideIt(BuildContext context, int i, animation,bool isAdd) {
    return SlideTransition(
      position: Tween<Offset>(
        //begin: const Offset(-1, 0),
          begin: isAdd?const Offset(0, 1):const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(
            begin: 0,
            end: 1
        ).animate(animation),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          height:50,
          child: Row(
            children: [
              AddNewLabelTextField(
                margin: EdgeInsets.only(right: 20),
                width: 400,
                hintText: widget.hintText,
                textEditingController: widget.data[i],
              ),
             // Spacer(),

              i==0?Container():AddBtn(ontap: (){
                setState(() {
                  key.currentState!.removeItem(
                      i, (_, animation) => slideIt(context, i, animation,false),
                      duration: const Duration(milliseconds: 300)
                  );
                  Timer(Duration(milliseconds: 300), (){
                    widget.deleteCB(i);
                    // setState(() {
                    //   covered.removeAt(i);
                    // });
                  });
                  //coveredKey.currentState!.removeItem(i,Container() ,duration: const Duration(milliseconds: 500));

                });

              },
                color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
                margin: EdgeInsets.only(right: 10,top: 0),
                widget: Icon(Icons.clear,color: Colors.white,),
              ),
            //  Spacer(),
              AddBtn(ontap: (){
                setState(() {
                  key.currentState!.insertItem(widget.data.length, duration: const Duration(milliseconds: 300));
                });
                widget.addCB();
              },
                color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
                margin: EdgeInsets.only(right: 0,top: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}