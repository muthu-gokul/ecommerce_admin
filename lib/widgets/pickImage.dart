import 'dart:io';

import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/widgets/circle.dart';
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
  bool isPick;
  String nullImage;
  double nullImageHei;
  PickImage({required this.image,required this.title,required this.cb,this.isPick=true,this.nullImage="assets/images/addnew-brand.jpg",
  this.nullImageHei=50});
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
      onTap: widget.isPick?(){
          pickImg();
      }:null,
      child: Container(
        height: 170,
        width: 170,
        margin: marginAddNewTextField,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        //  borderRadius: BorderRadius.circular(5)1
          border: Border.all(color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor4),
          color: Colors.transparent,
        ),
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        child: widget.image==null?Container(
          child: Image.asset(widget.nullImage,height: widget.nullImageHei,),
        ):kIsWeb?Image.network( widget.image!.path)
            :Image.file(File(widget.image!.path),fit: BoxFit.cover,),
        /*child: Row(
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
        ),*/
      ),
    );
  }
}



class PickMultiImage extends StatefulWidget {
  List<XFile>? images;
  String title;
  Function(List<XFile>?) cb;
  Function(int) deleteCb;
  bool isPick;
  String nullImage;
  double nullImageHei;
  double wid;
  PickMultiImage({required this.images,required this.title,required this.cb,this.isPick=true,this.nullImage="assets/images/addnew-brand.jpg",
    this.nullImageHei=50,required this.wid,required this.deleteCb});

  @override
  _PickMultiImageState createState() => _PickMultiImageState();
}

class _PickMultiImageState extends State<PickMultiImage> {
  final ImagePicker _picker = ImagePicker();
  pickImg() async {
    final List<XFile>? _image = await _picker.pickMultiImage(imageQuality: 20);
    widget.cb(_image);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.wid,
      child: Wrap(
        children: [
          for(int i=0;i<widget.images!.length;i++)
            kIsWeb?Image.network( widget.images![i].path,height: 70,)
                :Container(
                  height: 100,
                  width: 90,
                  margin: EdgeInsets.only(right: 15),
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 80,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Image.file(File(widget.images![i].path,),width: 80,fit: BoxFit.cover,)
                      ),
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap:(){
                            widget.deleteCb(i);
                          },
                          child: Circle(
                              hei: 25,
                              color: Provider.of<ThemeNotifier>(context,listen: false).primaryColor2,
                              widget: Icon(Icons.clear,color: Colors.white,size: 15,),
                          ),
                        ),
                      )
                    ],
                  )
            ),
          GestureDetector(
            onTap: (){
              pickImg();
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(widget.nullImage,height: widget.nullImageHei,),
                  SizedBox(height: 10,),
                  Text(widget.title,style: ts18(grey2,fontsize: 10),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

