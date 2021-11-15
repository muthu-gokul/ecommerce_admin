import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProfilePic extends StatefulWidget {
  Alignment alignment;
  EdgeInsets margin;
  ProfilePic({this.alignment=Alignment.topLeft,this.margin=const EdgeInsets.only(left: 150)});

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: widget.alignment,
      child: Stack(
        children: [
          Container(
            height: 150,
            width: 150,
            margin: widget.margin,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Provider.of<ThemeNotifier>(context,listen:false).primaryColor3,width: 3.5),
                //  color: AppTheme.yellowColor,
                boxShadow: [
                  // BoxShadow(
                  //   color: AppTheme.yellowColor.withOpacity(0.4),
                  //   spreadRadius: 1,
                  //   blurRadius: 5,
                  //   offset: Offset(1, 8), // changes position of shadow
                  // ),
                ]
            ),
            child:Image.asset("assets/images/avatar.png",fit: BoxFit.cover,),
          ),
          Positioned(
              bottom: 0,
              right:15,
              child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.cyanAccent
                  ),
                  child: Icon(Icons.edit_outlined,color: Colors.black,size: 20,)
              )
          )
        ],
      ),
    );
  }
}
