import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';


import '../../constants.dart';
import '../customTextField.dart';

// ignore: must_be_immutable
class MaterialTabBar extends StatefulWidget {

  bool isOpen;
  String title;
  VoidCallback cartIconClick;
  VoidCallback closeClick;
  Function(int) materialTap;
  Function(String) searchFunc;
  int totalItems;
  TabController materialTabController;

  List<dynamic> materialCategoryList;
  List<dynamic> materialsList;

  bool isClose;
  String materialKey;
  bool withBrand;

  MaterialTabBar({required this.isOpen,required this.title,required this.cartIconClick,required this.closeClick,
    required this.totalItems,required this.materialTap, required this.materialTabController,required this.materialCategoryList
    ,required this.searchFunc,required this.materialsList,this.isClose=true,
  this.materialKey="MaterialName",this.withBrand=false});

  @override
  _MaterialTabBarState createState() => _MaterialTabBarState();
}

class _MaterialTabBarState extends State<MaterialTabBar> with TickerProviderStateMixin{

  ScrollController materialsController=new ScrollController();


  late AnimationController moveController;
  late Animation moveAnimation;

  late Position? fromPosition;
  GlobalKey starKey = GlobalKey();
  String name="";

  @override
  void initState() {
    moveController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    moveAnimation = CurvedAnimation(parent: moveController, curve: Curves.easeInOut);

    moveController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          fromPosition = null;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    moveController.dispose();
    super.dispose();
  }




  Widget buildFlyWidget() {
    if (fromPosition == null) {
      return SizedBox.shrink();
    }
    return Container(
      key: starKey,
      height: 50,
      width: 200,


      child: AnimatedBuilder(
        animation: moveAnimation,
        builder: (context, child) {
          Position currentPosition;
          double x = 0, y = 0;
          if (starKey.currentContext?.findRenderObject() != null) {
            currentPosition = getPositionByKey(starKey);
            x = fromPosition!.x - currentPosition.x;
            y = fromPosition!.y - currentPosition.y;
          }
          if (x == 0) return Container();
          return Transform.translate(
            offset: Offset(
                x * (1 - moveAnimation.value), y * (1-  moveAnimation.value)),
            child: Opacity(
                opacity: fromPosition == null ? 0.0 : 1.0,
                child:  Container(
                  margin: EdgeInsets.only(left: 10),
                 // color: AppTheme.addNewTextFieldText,
                  child: Text(name,
                    style: TextStyle(fontSize: 20,fontFamily: 'RR',color: addNewTextFieldText),
                  ),
                )
            ),
          );
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      width: SizeConfig.screenWidth,
      height: 800,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,
      ),
      clipBehavior: Clip.antiAlias,

      margin: EdgeInsets.only(left: SizeConfig.width50!,right: SizeConfig.width50!,),
      transform: Matrix4.translationValues(widget.isOpen?0:SizeConfig.screenWidth!, 0, 0),
      child: Stack(
        children: [

          Container(
            height: 720,
            width: SizeConfig.screenWidth!-SizeConfig.width100!,
            margin: EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
                borderRadius:BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                color: Color(0xFFF2F4FA)
            ),
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: SizeConfig.screenWidth!-SizeConfig.width100!,
                  child: TabBar(
                    controller: widget.materialTabController,
                    isScrollable: true,
                    unselectedLabelColor: grey1,
                    labelColor: addNewTextFieldText,
                    indicator: BoxDecoration(
                        color: Color(0xFF42425E),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                    ),
                    indicatorPadding: EdgeInsets.only(bottom: 70,),
                    indicatorSize: TabBarIndicatorSize.label,


                    unselectedLabelStyle: TextStyle(fontFamily: 'RR',fontSize: 20,color: grey1),
                    tabs: [
                      for(int i=0;i<widget.materialCategoryList.length;i++)
                        Tab(
                          child: Text(widget.materialCategoryList[i].MaterialCategoryName,
                            style: TextStyle(fontFamily: 'RR',fontSize: 20),
                          ),

                        ),

                    ],
                  ),
                ),
                Container(
                  height: 640,
                  width: SizeConfig.screenWidth!-SizeConfig.width100!,
                  child: TabBarView(
                      controller: widget.materialTabController,
                      children: [
                        for(int i=0;i<widget.materialCategoryList.length;i++)
                          Container(
                            height: 600,
                            width: SizeConfig.screenWidth!-SizeConfig.width100!,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AddNewLabelTextField(
                                  onChange: (v){
                                    widget.searchFunc(v.toLowerCase());
                                    // print(v);
                                  },
                                  labelText: 'Search',
                                  scrollPadding: SizeConfig.screenHeight!*(650/1280),
                                  prefixIcon: Container(
                                    margin: EdgeInsets.only(left: SizeConfig.width20!,right: SizeConfig.width20!),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFDEE2FE)
                                    ),
                                    child: Center(
                                      child: Icon(Icons.search,color: searchIconColor,),
                                    ),
                                  ), margin: EdgeInsets.only(left: 0),

                                ),
                               widget.materialsList.isNotEmpty?Container(
                                  height: 520,
                                 width: SizeConfig.screenWidth!-SizeConfig.width100!,
                                  padding: EdgeInsets.only(right: 20),
                                  child: RawScrollbar(
                                    controller: materialsController,
                                    isAlwaysShown: true,
                                    radius: Radius.circular(10),
                                    thumbColor: Colors.grey[500],
                                    child: ListView.builder(
                                        controller: materialsController,
                                        itemCount: widget.materialsList.length,
                                        itemBuilder: (context,index){
                                          return MaterialName(
                                            materialsList: widget.materialsList,
                                            materialKey: widget.materialKey,
                                            withBrand: widget.withBrand,
                                            index: index,
                                            ontap: (globalKey){
                                              fromPosition = getPositionByKey(globalKey);
                                              name=widget.materialsList[index].MaterialName;
                                              moveController.reset();
                                              moveController.forward();
                                              widget.materialTap(index);

                                            },
                                          );
                                        }),
                                  ),
                                ):Container()
                              ],
                            ),
                          )
                      ]
                  ),
                )

              ],
            ),
          ),
          Container(
            height: 80,
            width: double.maxFinite,
            color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,
            padding: EdgeInsets.only(left: SizeConfig.width20!,right: SizeConfig.width20!,),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${widget.title}',style: ts18(Colors.white),),
                SizedBox(width: SizeConfig.width10,),
                GestureDetector(
                  onTap:widget.cartIconClick,
                  child: Container(
                    height: 70,
                    width: 70,

                    child: Stack(
                      children: [
                        //buildFlyWidget(),
                        Align(
                            alignment:Alignment.center,
                            child: Icon(Icons.shopping_cart,color: Colors.white,size: 45,)
                        ),
                        Positioned(
                            right: 0,
                            child: Container(
                              // width: 20,
                              // height: 20,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.purple
                              ),
                              child: Center(
                                child: Text("${widget.totalItems}",style: TextStyle(fontFamily: 'RR',color: Colors.white),),
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
               widget.isClose? GestureDetector(
                  onTap:widget.closeClick,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white

                    ),
                    child: Center(
                      child:  Icon(Icons.close,
                        color: Color(0xFF6769F0),size: 28,),
                    ),
                  ),
                ):Container()

              ],
            ),

          ),

        ],
      ),
    );
  }
}


class MaterialName extends StatefulWidget {

  List<dynamic> materialsList;
  int index;
  Function(GlobalKey) ontap;
  String materialKey;
  bool withBrand;

  MaterialName({required this.materialsList, required this.index,required this.ontap,required this.materialKey,
    required this.withBrand});

  @override
  _MaterialNameState createState() => _MaterialNameState();
}

class _MaterialNameState extends State<MaterialName> {
  @override
  Widget build(BuildContext context) {

    GlobalKey globalKey=GlobalKey();

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        widget.ontap(globalKey);

      },
      child: widget.withBrand?Container(
          key: globalKey,
          width: double.maxFinite,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: SizeConfig.width50!,top: 10,bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.materialsList[widget.index].MaterialName,
                style: TextStyle(fontSize: 20,fontFamily: 'RR',color: addNewTextFieldText),
              ),
              SizedBox(height: 5,),
              widget.materialsList[widget.index].materialBrandId!=null?Text(widget.materialsList[widget.index].materialBrandName,
                style: TextStyle(fontSize: 16,fontFamily: 'RR',color: grey3),
              ):Container(width: 1,),
            ],
          )
      ):Container(
        key: globalKey,
        height: 50,
        width: double.maxFinite,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: SizeConfig.width50!),
        child: Text(widget.materialsList[widget.index].MaterialName,
          style: TextStyle(fontSize: 20,fontFamily: 'RR',color:addNewTextFieldText),
        ),
      ),
    );
  }
}


Position getPositionByKey(GlobalKey key) {
  final renderObject = key.currentContext!.findRenderObject();
  var translation = renderObject!.getTransformTo(null).getTranslation();
  final rect =
  renderObject.paintBounds.shift(Offset(translation.x, translation.y));
  return Position(rect.left, rect.top, rect.size);
}

class Position {
  double x;
  double y;
  Size size;

  Position(this.x, this.y, this.size);
}
