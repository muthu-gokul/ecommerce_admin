import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'searchDropdown/dropdown_search.dart';
class CustomSearchPopUp extends StatefulWidget {
  double width;
  String hintText;
  List<String> data;
  VoidCallback? scrollTap;
  Function(String) onTap;
  String selectedValue;
  CustomSearchPopUp({required this.width,required this.hintText,required this.data,this.scrollTap,required this.onTap,
  required this.selectedValue});

  @override
  _CustomSearchPopUpState createState() => _CustomSearchPopUpState();
}

class _CustomSearchPopUpState extends State<CustomSearchPopUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: DropdownSearch<String>(
        // validator: (v) => v == null ? "required field" : null,
        //  dialogMaxWidth: 200,

        dropdownSearchDecoration: InputDecoration(
          hintText: widget.hintText,
          //   labelText: "Menu mode *",
          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
          border: OutlineInputBorder(),
        ),
        mode: Mode.MENU,
        showSelectedItems: true,
        popupElevation: 2,
        items: widget.data,
        showClearButton: true,
        showSearchBox: true,
        dropDownButton: Icon(Icons.eleven_mp),
        searchDelay: Duration(milliseconds: 0),

        ontap: (){
          if(widget.scrollTap!=null){
            widget.scrollTap!();
          }

        },
        selectWidget: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          height: 50,
          width: widget.width,
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
              Text(widget.selectedValue.isEmpty?widget.hintText:widget.selectedValue,
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
          width: widget.width,
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
          child:  ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: (ctx,index){
              return   InkWell(
                onTap:(){
                  widget.onTap(widget.data[index]);
                  Navigator.pop(ctx);
                  //widget.onitemTap(index);
                },
                child: Container(
                  height: 50,
                  width:widget.width,
                  padding: EdgeInsets.only(left: 20,),
                  //  margin: EdgeInsets.only(bottom: 3),
                  alignment: Alignment.centerLeft,
                  // color:selectedValue==data![index]?AppTheme.red: Color(0xFFf6f6f6),
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child:  Text("${widget.data[index]}",
                    style: TextStyle(fontFamily: 'RR',fontSize: 16,color: Colors.grey
                      // color:selectedValue==data![index]?Colors.white: Color(0xFF555555),letterSpacing: 0.1
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        onChanged: (s){},
        /// popupItemDisabled: (String? s) => s?.startsWith('I') ?? false,
        clearButtonSplashRadius: 20,
        //selectedItem:selectedCategory,
        onBeforeChange: (a, b) {
          return Future.value(true);
        },
      ),
    );
  }
}
