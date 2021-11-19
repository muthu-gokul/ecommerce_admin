import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:ecommerce_admin/widgets/overlayContainer.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover.dart';
import 'package:ecommerce_admin/widgets/popOver/src/popover_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class GridWithWidgetParam extends StatefulWidget {
  double headerHeight;
  double headerWidth;
  Widget headerWidget;
  double bodyHeight;
  double bodyWidth;
  Widget bodyWidget;
  bool showDeleteAll;
  VoidCallback addBtnTap;
  Function(String) searchFunc;
  Function(int) filterOnTap;
  List<GridHeaderModel> gridHeaderList;
  bool showAdd;
  bool showFilter;
  bool showExport;
  bool showSearchAll;
  Color searchBg;

  GridWithWidgetParam({required this.headerHeight,required this.headerWidth,required this.headerWidget,
    required this.bodyHeight,required this.bodyWidth,required this.bodyWidget,this.showDeleteAll=false,
    required this.addBtnTap,required this.searchFunc,required this.gridHeaderList,required this.filterOnTap,
   this.showAdd=false,this.searchBg=Colors.white,this.showExport=true,this.showFilter=true,this.showSearchAll=true});

  @override
  _GridWithWidgetParamState createState() => _GridWithWidgetParamState();
}

class _GridWithWidgetParamState extends State<GridWithWidgetParam> {

  ScrollController header=new ScrollController();
  ScrollController body=new ScrollController();

  bool showPopUp=false;

  @override
  void initState() {
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
    return Stack(
      children: [
        !widget.showSearchAll?Container():Container(
          height: widget.headerHeight,
          width: widget.headerWidth,
          alignment: Alignment.topCenter,
          child:Row(
            children: [
              Spacer(),
              Container(
                height: 45,
                width: 250,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: widget.searchBg,
                    borderRadius: BorderRadius.circular(5)
                ),
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(fontFamily: 'RR',fontSize: 16,color: Colors.grey),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.search)
                  ),
                  onChanged: (v){
                    widget.searchFunc(v.toLowerCase());
                  },
                ),
              ),
              widget.showExport?AddBtn(
                ontap: (){},
                color: Colors.transparent,
                widget: Image.asset("assets/icons/export.jpg",fit: BoxFit.cover,height: 40,),
                margin: EdgeInsets.only(right: 20),
              ):Container(
                width: 50,
              ),
              Column(
                children: [
                  widget.showFilter?AddBtn(
                    ontap: (){
                      setState(() {
                        showPopUp=!showPopUp;
                      });
                    },
                    color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor1.withOpacity(0.2),
                    widget: SvgPicture.asset("assets/icons/filter.svg",height: 30,color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,),
                    margin: EdgeInsets.only(right: 20),
                  ):Container(),
                  OverlayContainer(
                    show: showPopUp,
                    position: OverlayContainerPosition(widget.showAdd?-100:-180, 0,),
                    child: Container(
                      height:  (widget.gridHeaderList.length*45.0)+5,
                      width: 200,
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
                        itemCount: widget.gridHeaderList.length,
                        itemBuilder: (ctx,index){
                          return   InkWell(
                            onTap:(){

                              widget.filterOnTap(index);
                            },
                            child: Container(
                              height: 40,
                              width:200,
                              padding: EdgeInsets.only(left: 20,),
                              margin: EdgeInsets.only(bottom: 5,left: 5,right: 5,top: index==0?5:0),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:widget.gridHeaderList[index].isActive? Provider.of<ThemeNotifier>(context,listen: false).primaryColor2:Colors.white,
                              ),
                              child:  Text("${widget.gridHeaderList[index].columnName}",
                                style: TextStyle(fontFamily: 'RR',fontSize: 16,color: widget.gridHeaderList[index].isActive?Colors.white:grey3
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
              ),
              widget.showAdd?AddBtn(
                ontap: widget.addBtnTap,
                color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
              ):Container(),
            ],
          ),
        ),
        Container(
          height: widget.headerHeight,
          width: widget.headerWidth,
          margin: EdgeInsets.only(top: widget.showSearchAll?widget.headerHeight:0),
          alignment: Alignment.topCenter,
          child:Theme(
            data: glowTransparent(context),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: header,
              child: widget.headerWidget,
            ),
          ),
        ),
        Container(
          height: widget.bodyHeight,
          width: widget.bodyWidth,
          margin: EdgeInsets.only(top: widget.showSearchAll?widget.headerHeight*2.0:widget.headerHeight),
          alignment: Alignment.topCenter,
          child: Theme(
            data: glowTransparent(context),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: body,
              child: Theme(
                data: glowTransparent(context),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: widget.bodyWidget,
                ),
              )
            ),
          ),
        ),

        AnimatedPositioned(
          duration: animeDuration,
          curve: animeCurve,
          right: widget.showDeleteAll?0:-100,
          top: (widget.bodyHeight*0.5).toDouble(),
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25))
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/icons/delete.svg',height: 25,color: Colors.white,),
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              showPopUp=false;
            });
          },
          child: Container(
            height:showPopUp? widget.bodyHeight+(widget.headerHeight*2.0):0,
            width: widget.bodyWidth,
            color: Colors.transparent
          ),
        )
      ],
    );
  }
}


//Grid Constants
double headerHeight=50;
EdgeInsets bodyPadd=EdgeInsets.only(top: 10,bottom: 10);
EdgeInsets bodyMargin=EdgeInsets.only(bottom: 5);
BoxDecoration bodyDecoration=BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(7),
);
BoxConstraints bodyConstraints=BoxConstraints(
    minHeight: 42
);