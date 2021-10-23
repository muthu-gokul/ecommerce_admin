import 'dart:io';

import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../constants.dart';

class PickImage extends StatefulWidget {
  XFile? image;
  String title;
  Function(XFile?) cb;
  PickImage({required this.image,required this.title,required this.cb});
  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  final ImagePicker _picker = ImagePicker();
 // XFile? image=null;
  pickImg() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    widget.cb(_image);
    // setState(() {
    //   widget.image=_image;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        pickImg();
      },
      child: Container(
        height: 150,
        width: 400,
        margin: marginAddNewTextField,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: addNewTextFieldBorder),
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            Container(
              width: 250,
              alignment: Alignment.centerLeft,
              child: Container(
                height: 130,
                width:200,
             //   child: widget.image==null?Container():Image.file(File(widget.image!.path)),
                child: widget.image==null?Container():kIsWeb?Image.network( widget.image!.path)
                    :Image.file(File(widget.image!.path)),
                // color: Colors.red,
              ),
            ),
            Icon(Icons.upload_file,color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,),
            Text("  ${widget.title}",
              style: TextStyle(color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor3,fontFamily: 'RR',fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}