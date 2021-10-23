import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandGrid.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';
class BrandAddNew extends StatefulWidget {
  @override
  State<BrandAddNew> createState() => _BrandAddNewState();
}

class _BrandAddNewState extends State<BrandAddNew> {
  TextEditingController title=new TextEditingController();
  TextEditingController slug=new TextEditingController();
  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);
  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,
        elevation: 0,
        leadingWidth: 100,
        leading: BackBtn(ontap: (){
          Navigator.pop(context);
        }),
        title: Container(
          height: 50,
        //  color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,
          child: Row(
            children: [
              Text("Brand / Add New",style: ts18(Colors.white,fontsize: 20,fontfamily: 'RM'),),
            ],
          ),
        ),
      ),
      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>Consumer<ProductNotifier>(
          builder: (context,pn,child)=>  Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                TextFieldHeader(
                  title: "Brand Name",
                ),
                AddNewLabelTextField(
                  margin: marginAddNewTextField,
                  width: textFormWidth,
                  textEditingController: title,
                  hintText: "Brand Title",
                  ontap: (){

                  },
                  onChange: (v){

                  },
                  onEditComplete: (){
                    node.unfocus();
                    setState(() {
                      slug.text=title.text.replaceAll(" ", "-").replaceAll(",", "");
                    });
                  },
                ),
                validationList[0]?ValidationErrorText(title: validationText,):Container(),
                SizedBox(height: 20,),
                TextFieldHeader(
                  title: "URL Slug",
                ),
                AddNewLabelTextField(
                  width: textFormWidth,
                  margin: marginAddNewTextField,
                  textEditingController: slug,
                  hintText: "URL Slug",
                  ontap: (){

                  },
                  onChange: (v){

                  },
                  onEditComplete: (){
                    node.unfocus();
                  },
                ),
                validationList[1]?ValidationErrorText(title: validationText,):Container(),
                SizedBox(height: 20,),
                PickImage(image: image, title: "Select Logo",cb: (v){
                  setState(() {
                    image=v;
                  });
                },),
                validationList[2]?ValidationErrorText(title: validationText,):Container(),
                SizedBox(height: 50,),
                Container(
                  width: textFormWidth+(SizeConfig.width40!),
                  alignment: Alignment.center,
                  child: SaveBtn(ontap: (){
                    if(title.text.isEmpty){setState(() {validationList[0]=true;});}
                    else{setState(() {validationList[0]=false;});}

                    if(slug.text.isEmpty){setState(() {validationList[1]=true;});}
                    else{setState(() {validationList[1]=false;});}

                    if(image==null){setState(() {validationList[2]=true;});}
                    else{setState(() {validationList[2]=false;});}

                    int length=validationList.where((element) => element==false).toList().length;
                    if(length==validationList.length){
                      pn.addBrand(title.text, slug.text);



                      Navigator.pop(context);
                    }


                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
