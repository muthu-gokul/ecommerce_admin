import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover_direction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
class GridFooter extends StatelessWidget {
  double width;
  int perPage;
  int currentPage;
  int totalPage;
  VoidCallback prev;
  VoidCallback next;
  Function(int) ontap;
  Function(int)? ontap2;
  GridFooter({required this.width,required this.perPage,required this.currentPage,
  required this.prev,required this.next,required this.ontap,this.totalPage=1,this.ontap2});

  List<int> pages=[10,20,50,100];
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 50,
        width: width,
        margin: EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
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
                        for(int i=0;i<pages.length;i++)
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            ontap(pages[i]);
                            // setState(() {
                            //   pn.perPage=10;
                            // });
                            // pn.init(true);
                          },
                          child: Container(
                              height: 25,
                              width: 80,
                              alignment: Alignment.center,
                              color: Colors.transparent,
                              child: Text("${pages[i]}")
                          ),
                        ),


                        SizedBox(height: 10,),
                      ],
                    ),
                    onPop: () => print('Popover was popped!'),
                    direction: PopoverDirection.bottom,
                    width: 80,
                    height: 120,
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
                    margin: 0,
                    isCustom: true,
                    leftMargin: 0,
                    constraints: BoxConstraints(
                        maxHeight: 350
                    ),
                  );
                },
                child: Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      color: grey3.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  alignment: Alignment.center,
                  child: Text("Show - $perPage"),
                ),
              ),
            ),
            Spacer(),
            Text("Current Page - $currentPage",style: ts14(grey3),),
            Spacer(),
            IconButton(
                onPressed:prev,
                icon: Icon(Icons.keyboard_arrow_left,size: 30,)
            ),
            Flexible(
              child: Container(
                child: ListView.builder(
                  itemCount: totalPage,
                  itemExtent: 30,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx,i){
                    return GestureDetector(
                      onTap: (){
                        ontap2!(i);
                      },
                      child: Container(
                          height: 30,
                          margin: EdgeInsets.only(top: 9,bottom: 9),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: i+1==currentPage?Provider.of<ThemeNotifier>(context,listen: false).primaryColor4:Colors.transparent
                          ),
                          child: Text("${i+1}",
                            style: ts16(i+1==currentPage?Colors.white:grey1),
                          )
                      ),
                    );
                  }
                ),
              ),
            ),
            IconButton(
                onPressed:next,
                icon: Icon(Icons.keyboard_arrow_right,size: 30,)
            ),
          ],
        ),
      ),
    );
  }
}
