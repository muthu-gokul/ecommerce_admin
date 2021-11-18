import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/pages/settings/companySettings.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/pageRoutes.dart'as pr;
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with TickerProviderStateMixin{
  @override
  late  double width,height,width2,height2;

  TextEditingController pageTitle=new TextEditingController();
  TextEditingController urlSlug=new TextEditingController();
  TextEditingController heading=new TextEditingController();
  TextEditingController content=new TextEditingController();

  XFile? image=null;
  final HtmlEditorController controller = HtmlEditorController();

  @override

  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-100;
    width2=(SizeConfig.screenWidth!*0.85)+(drawerOpen?0:100);

    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=>Consumer<ProductNotifier>(
        builder: (context,pn,child)=> Container(

         child: Container(
           width: SizeConfig.screenWidth!*0.9,
           alignment: Alignment.center,
           padding: EdgeInsets.only(top:20.0),
           child: Wrap(
             runSpacing: 10.0,
             spacing: 10.0,
             direction: Axis.horizontal,
             alignment: WrapAlignment.start,
             children: [
               for(int i=0;i<10;i++)
                    Container(
                      width: 250,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Color(0XFFECECEC),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
             ],
           ),
         ),
         )


      ),
    );
  }
}
