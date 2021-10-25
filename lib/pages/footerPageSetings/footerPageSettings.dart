import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/widgets/buttons/actionBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';
class FooterPageSettings extends StatefulWidget {
  const FooterPageSettings({Key? key}) : super(key: key);

  @override
  _FooterPageSettingsState createState() => _FooterPageSettingsState();
}

class _FooterPageSettingsState extends State<FooterPageSettings> {
  late double width;
  bool isAboutUsEdit=false;
  bool isMailUsEdit=false;
  bool isblock4Edit=false;

  @override
  Widget build(BuildContext context) {
    width=SizeConfig.screenWidth!-100;

    return Consumer<ThemeNotifier>(
      builder: (context,th,child)=>Consumer<ProductNotifier>(
        builder: (context,pn,child)=>  Container(
          height: SizeConfig.screenHeight!-50,
          width: width,
          color: bgColor,
          padding: EdgeInsets.only(left: 20,right: 20),
          child: ListView(
            children: [
              block(
                  "Block 1",
                  "About Us",
                  isAboutUsEdit,
                  () {
                        setState(() {
                          isAboutUsEdit=true;
                        });
                      },
                  () {
                        setState(() {
                          isAboutUsEdit=false;
                        });
                      }
                 ),

              block(
                  "Block 3",
                  "Mail Us",
                  isMailUsEdit,
                      () {
                    setState(() {
                      isMailUsEdit=true;
                    });
                  },
                      () {
                    setState(() {
                      isMailUsEdit=false;
                    });
                  }
              ),

              block(
                  "Block 4",
                  "Registered Office Address",
                  isblock4Edit,
                      () {
                    setState(() {
                      isblock4Edit=true;
                    });
                  },
                      () {
                    setState(() {
                      isblock4Edit=false;
                    });
                  }
              ),

            ],
          ),
        ),
      ),
    );
  }

  block(String title1,String title2,bool isEdit,VoidCallback v1,VoidCallback v2){
    final node=FocusScope.of(context);
    return Column(
      children: [
        Container(
            padding:  EdgeInsets.only(top: 30,bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("$title1:",style: ts18(grey1,fontsize: 22,fontfamily: 'RM'),)
        ),
        Container(
            padding:  EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("$title2",style: ts18(grey3,fontsize: 18,fontfamily: 'RR'),)
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddNewLabelTextFieldMinLines(
                margin: EdgeInsets.only(left: 0),
              //  scrollPadding: 500.0,
                width: width*0.6,
                hintText: "Enter $title2",
                maxlines: 5,
                minLines: 3,
                isEnabled: isEdit,
                onChange: (v){},
                onEditComplete: (){
                  node.unfocus();
                },
              ),
              SizedBox(width: 50,),
              ActionIcon(
                ontap: v1,
                imgColor: Colors.grey,
                img: "assets/icons/edit.svg",
                imgHeight: 50,
              ),
              SizedBox(width: 20,),
              AddBtn(
                ontap: v2,
                color: Colors.transparent,
                widget: Icon(Icons.save,size: 35,color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,),
              )
            ],
          ),
        ),
      ],
    );
  }
}
