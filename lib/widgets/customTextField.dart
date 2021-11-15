import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scutiwidgets/size.dart';

import '../constants.dart';


class AddNewLabelTextField extends StatelessWidget {
  bool isEnabled;
  String? labelText;
  String? hintText;
  TextEditingController? textEditingController;
  double scrollPadding;
  TextInputType textInputType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Function(String)? onChange;
  VoidCallback? ontap;
  TextInputFormatter? textInputFormatter;
  VoidCallback? onEditComplete;
  bool isObscure;
  int? maxlines;
  int? textLength;
  String regExp;
  double? width;
  EdgeInsets margin;

  AddNewLabelTextField({this.textEditingController,this.labelText,this.scrollPadding=0.0,this.textInputType:TextInputType.text,
    this.prefixIcon,this.ontap,this.onChange,this.textInputFormatter,this.isEnabled=true,this.suffixIcon,this.onEditComplete,
    this.isObscure=false,this.maxlines=1,this.textLength=null,this.regExp='[A-Za-z0-9@., ]',this.hintText,this.width=null,
    required this.margin});




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  maxlines!=null? Container(

      margin: margin,
      height: maxlines==1?50:maxlines!*30,
      width: width==null?double.maxFinite:width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent
      ),
      child:  TextFormField(
         enabled: isEnabled,
         onTap: ontap,
         obscureText: isObscure,
         obscuringCharacter: '*',
         scrollPadding: EdgeInsets.only(bottom: scrollPadding),
        style:  textFormTs1,
        controller: textEditingController,
        decoration: InputDecoration(
          fillColor:isEnabled?Colors.white:disableColor,
          filled: true,
          labelStyle: textFormHintTs1,
          hintStyle: textFormHintTs1,
          border:  OutlineInputBorder(
              borderSide: BorderSide(color: addNewTextFieldBorder)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: addNewTextFieldBorder)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:addNewTextFieldFocusBorder)
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:addNewTextFieldFocusBorder)
          ),
          labelText: labelText,
           hintText: hintText,

           contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon



        ),
        maxLines: maxlines,
        keyboardType: textInputType,
        textInputAction: TextInputAction.done,
        // inputFormatters:  <TextInputFormatter>[
        //
        //   //textInputFormatter
        // ],

        inputFormatters: [
          LengthLimitingTextInputFormatter(textLength),
          FilteringTextInputFormatter.allow(RegExp(regExp)),
        ],
        onChanged: (v){
           onChange!(v);
        },
        onEditingComplete: (){
           onEditComplete!();
        },
      ),

    ):
    Container(

      margin: margin,
  //    height: 50,
      width: width==null?double.maxFinite:width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.transparent
      ),
      child:  TextFormField(
        enabled: isEnabled,
        onTap: ontap,
        obscureText: isObscure,
        obscuringCharacter: '*',
        scrollPadding: EdgeInsets.only(bottom: scrollPadding),
        style: textFormTs1,
        controller: textEditingController,
        decoration: InputDecoration(
            fillColor:isEnabled?Colors.white: Color(0xFFe8e8e8),
            filled: true,
            labelStyle: textFormHintTs1,
            hintStyle: textFormHintTs1,
            border:  OutlineInputBorder(
                borderSide: BorderSide(color: addNewTextFieldBorder)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: addNewTextFieldBorder)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:addNewTextFieldFocusBorder)
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color:addNewTextFieldFocusBorder)
            ),
            labelText: labelText,
            contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon



        ),
        maxLines: maxlines,
        keyboardType: textInputType,
        textInputAction: TextInputAction.done,

        onChanged: (v){
          onChange!(v);
        },
        onEditingComplete: (){
          onEditComplete!();
        },
      ),

    )
    ;

  }
}
class AddNewLabelTextFieldMinLines extends StatelessWidget {
  bool isEnabled;
  String? labelText;
  String? hintText;
  TextEditingController? textEditingController;
  double scrollPadding;
  TextInputType textInputType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Function(String)? onChange;
  VoidCallback? ontap;
  TextInputFormatter? textInputFormatter;
  VoidCallback? onEditComplete;
  bool isObscure;
  int? maxlines;
  int? textLength;
  String regExp;
  double? width;
  EdgeInsets margin;
  int? minLines;
  AddNewLabelTextFieldMinLines({this.textEditingController,this.labelText,this.scrollPadding=0.0,this.textInputType:TextInputType.text,
    this.prefixIcon,this.ontap,this.onChange,this.textInputFormatter,this.isEnabled=true,this.suffixIcon,this.onEditComplete,
    this.isObscure=false,this.maxlines=1,this.textLength=null,this.regExp='[A-Za-z0-9@., ]',this.hintText,this.width=null,
    required this.margin,required this.minLines});




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Container(

      margin: margin,
     // height: maxlines==1?50:maxlines!*30,
      width: width==null?double.maxFinite:width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent
      ),
      child:  TextFormField(
         enabled: isEnabled,
         onTap: ontap,
         obscureText: isObscure,
         obscuringCharacter: '*',
         scrollPadding: EdgeInsets.only(bottom: scrollPadding),
        style:  textFormTs1,
        controller: textEditingController,
        decoration: InputDecoration(
          fillColor:isEnabled?Colors.white:disableColor,
          filled: true,
          labelStyle: textFormHintTs1,
          hintStyle: textFormHintTs1,
          border:  OutlineInputBorder(
              borderSide: BorderSide(color: addNewTextFieldBorder)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: addNewTextFieldBorder)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:addNewTextFieldFocusBorder)
          ),
          labelText: labelText,
           hintText: hintText,

           contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon



        ),
        maxLines: maxlines,
        minLines: minLines,
        keyboardType: textInputType,
        textInputAction: TextInputAction.done,
        // inputFormatters:  <TextInputFormatter>[
        //
        //   //textInputFormatter
        // ],

        inputFormatters: [
          LengthLimitingTextInputFormatter(textLength),
          FilteringTextInputFormatter.allow(RegExp(regExp)),
        ],
        onChanged: (v){
           onChange!(v);
        },
        onEditingComplete: (){
           onEditComplete!();
        },
      ),

    );

  }
}

class TextFieldHeader extends StatelessWidget {
  String title;
  EdgeInsets? padd;
  Color textColor;
  double width;
  TextFieldHeader({required this.title,this.padd= null,this.textColor=const Color(0xFF505050),this.width=250});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  padd==null?paddTextFieldHeader:padd!,
      child: Container(
        width: width,
        child: Text("$title",
            style: TextStyle(fontFamily: 'RR',fontSize: 20,color: textColor)
        ),
      ),
    );
  }
}

class ValidationErrorText extends StatelessWidget {
  final String? title;
  EdgeInsets? padd;
  ValidationErrorText({required this.title,this.padd= null});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padd==null?paddTextFieldHeader:padd!,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(title!,style: TextStyle(fontSize: 14,color: Colors.red,fontFamily: 'RR'),textAlign: TextAlign.left,)),
    );
  }
}

//EdgeInsets marginAddNewTextField=EdgeInsets.only(left:SizeConfig.width20!,right:SizeConfig.width20!,top:10,);
EdgeInsets marginAddNewTextField=EdgeInsets.only(left:20,right: 20,top:10,);
EdgeInsets marginAddNewTextField2=EdgeInsets.only(top:10,);
EdgeInsets paddTextFieldHeader=EdgeInsets.only(left:20,);
EdgeInsets paddTextFieldHeader2=EdgeInsets.only(left:0,);

