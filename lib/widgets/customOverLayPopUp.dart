import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'overlayContainer.dart';
import 'searchDropdown/dropdown_search.dart';

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
 CrossAxisAlignment crossAxisAlignment;
 bool isEnable;
 OverLayPopUp({required this.ontap,required this.width,required this.selectedValue,required this.showPopUp,
 required this.data,required this.onitemTap,required this.isToJson,this.propertyName="",required this.hinttext,
 this.crossAxisAlignment=CrossAxisAlignment.center,this.isEnable=true});

  @override
  State<OverLayPopUp> createState() => _OverLayPopUpState();
}

class _OverLayPopUpState extends State<OverLayPopUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.crossAxisAlignment,
      children: [
      //  SizedBox(height: 10,),
        GestureDetector(
          onTap:widget.ontap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            height: 50,
            width: widget.width-20,
            // margin: paddTextFieldHeader,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              //border: Border.all(color: widget.isEnable?addNewTextFieldBorder:Color(0xffC5C5C5),),
              border: Border.all(color:addNewTextFieldBorder),
              color: widget.isEnable?Colors.white:disableColor,
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(widget.selectedValue.isEmpty?"${widget.hinttext}":widget.selectedValue,
                  style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 16,fontFamily: widget.selectedValue.isEmpty?'RL':'RR'),
                ),
                Spacer(),
                Icon(Icons.keyboard_arrow_down,size: 30,color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,),
                SizedBox(width: 15,)
              ],
            ),
          ),
        ),
        OverlayContainer(
          show: widget.showPopUp,
          position: OverlayContainerPosition(0, 0,),
          child: Container(
            height:  widget.data.length*50.0,
            width: widget.width-20,
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




class SearchPopUp extends StatefulWidget {
//  VoidCallback ontap;
  VoidCallback scrollTap;
  double width;
  String selectedValue;
  List<dynamic> data;
  Function(int) onitemTap;
  bool isToJson;
  String propertyName;
  String hinttext;

  bool isEnable;
  SearchPopUp({required this.width,required this.selectedValue,
    required this.data,required this.onitemTap,required this.isToJson,this.propertyName="",required this.hinttext,
   this.isEnable=true,required this.scrollTap});

  @override
  State<SearchPopUp> createState() => _SearchPopUpState();
}

class _SearchPopUpState extends State<SearchPopUp> {
  FocusNode f4 = FocusNode();
  // List<dynamic> filterData=[];
  final ValueNotifier<List<dynamic>> tasksNotifier = ValueNotifier([]);
  @override
  Widget build(BuildContext context) {
  //  final node=FocusScope.of(context);
    return Container(
      width: textFormWidth,
      child: DropdownSearch<String>(
        // validator: (v) => v == null ? "required field" : null,
        //  dialogMaxWidth: 200,

        dropdownSearchDecoration: InputDecoration(
          hintText: widget.hinttext,
          //   labelText: "Menu mode *",
          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
          border: OutlineInputBorder(),
        ),
        mode: Mode.MENU,
        showSelectedItems: true,
        popupElevation: 2,
        //items: widget.data,
        showClearButton: true,
        showSearchBox: true,
        dropDownButton: Icon(Icons.eleven_mp),
        searchDelay: Duration(milliseconds: 0),
        ontap: (){
          widget.scrollTap();
          tasksNotifier.value=widget.data;
          // setState(() {
          //   filterData=widget.data;
          // });
        },
        selectWidget: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          height: 50,
          width: textFormWidth,
          // margin: paddTextFieldHeader,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            //border: Border.all(color: widget.isEnable?addNewTextFieldBorder:Color(0xffC5C5C5),),
            border: Border.all(color:addNewTextFieldBorder),
            // color: widget.isEnable?Colors.white:disableColor,
            color: Colors.white,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Text(widget.selectedValue.isEmpty?widget.hinttext:widget.selectedValue,
                style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 16,fontFamily: widget.selectedValue.isEmpty?'RL':'RR'),
              ),
              Spacer(),
              Icon(Icons.keyboard_arrow_down,size: 30,color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,),
              SizedBox(width: 15,)
            ],
          ),
        ),
        dialogWidget: Container(
          height:  widget.data.length*50.0,
          width: textFormWidth,
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
          constraints: BoxConstraints(
              maxHeight: 300
          ),
          child:  Column(
            children: [
              Container(
                height: 50,
                width: widget.width,
                margin: EdgeInsets.all(15),
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  style: textFormTs1,
                  focusNode: f4,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: textFormHintTs1,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15)
                  ),
                  onEditingComplete: (){
                    f4.unfocus();
                  },
                  onChanged: (v){
                   // print(v);
                   // print(widget.data.contains(v.toLowerCase()));
                   /* setState(() {
                      filterData.clear();
                    });

                    print(filterData);
                    print(widget.data);
                    widget.data.forEach((element) {
                      print(element);
                      if(element.toString().toLowerCase().contains(v.toLowerCase())){
                        setState(() {

                        });
                      }
                    });*/
                    tasksNotifier.value=widget.data.where((element) => element.toString().toLowerCase().contains(v.toLowerCase())).toList();
                    /*setState(() {
                      filterData=widget.data.where((element) => element.toString().contains(v)).toList();
                     // filterData=widget.data.where((element) => element.toString().toLowerCase().contains(v.toLowerCase())).toList();
                    });*/

                  },
                ),
              ),
              Flexible(
                child: ValueListenableBuilder<List<dynamic>>(
                  valueListenable: tasksNotifier,
                  builder: (_,t,c){
                    return ListView.builder(
                      itemCount: t.length,
                      itemBuilder: (ctx,index){
                        return   InkWell(
                          onTap:(){

                            Navigator.pop(ctx);
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
                            child:  Text(widget.isToJson?"${t[index].get(widget.propertyName)}":"${t[index]}",
                              style: TextStyle(fontFamily: 'RR',fontSize: 16,color: Colors.grey
                                // color:selectedValue==data![index]?Colors.white: Color(0xFF555555),letterSpacing: 0.1
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ),
            ],
          ),
        ),
        onChanged: (s){},
        /// popupItemDisabled: (String? s) => s?.startsWith('I') ?? false,
        clearButtonSplashRadius: 20,
        selectedItem:widget.selectedValue,
        onBeforeChange: (a, b) {
          return Future.value(true);
        },
      ),
    );
  }
}
