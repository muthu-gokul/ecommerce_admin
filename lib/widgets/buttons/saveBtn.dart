import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SaveBtn extends StatelessWidget {
  VoidCallback ontap;
  SaveBtn({required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color:  Provider.of<ThemeNotifier>(context,listen: false).loginBtn,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text("Save",style: TextStyle(fontFamily: 'RM',color: Colors.white,fontSize: 20),),
      ),
    );
  }
}
