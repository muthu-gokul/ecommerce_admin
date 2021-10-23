import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CustomSwitch extends StatefulWidget {
  bool value;
  Function(bool) onchange;
  CustomSwitch({required this.value,required this.onchange});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
          trackColor: Color(0xFF9E9E9E),
          activeColor: Provider.of<ThemeNotifier>(context,listen:false).primaryColor3,
          value: widget.value,
          onChanged: (v){
            widget.onchange(v);
            // setState(() {
            //   widget.value=v;
            // });
          }
      ),
    );
  }
}
