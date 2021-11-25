import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/widgets/singleDatePicker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class SingleDatePickerWidget extends StatefulWidget {
  String hintText;
  SingleDatePickerWidget({required this.hintText});

  @override
  State<SingleDatePickerWidget> createState() => _SingleDatePickerWidgetState();
}

class _SingleDatePickerWidgetState extends State<SingleDatePickerWidget> {
  DateTime? ExpectedPurchaseDate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        final DateTime? picked = await showDatePicker2(
            context: context,
            initialDate:  ExpectedPurchaseDate==null?DateTime.now():ExpectedPurchaseDate!, // Refer step 1
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),

            builder: (BuildContext context,Widget? child){
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary:  Provider.of<ThemeNotifier>(context,listen: false).primaryColor3, // header background color
                    onPrimary: Colors.white, // header text color
                    onSurface: grey1, // body text color
                  ),
                ),
                child: child!,
              );
            });
        if (picked != null)
          setState(() {
            ExpectedPurchaseDate = picked;
          });
      },
      child: Container(
        height: 50,
        width: textFormWidth,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 15),
       // margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
            border: Border.all(color: addNewTextFieldBorder),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white
        ),
        child: Text(ExpectedPurchaseDate==null?"${widget.hintText}":DateFormat(dbDateFormat).format(ExpectedPurchaseDate!),
          style: ts16(grey2),),
      ),
    );
  }
}
