import 'package:ecommerce_admin/constants.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/brand/brandGrid.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/addBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/circle.dart';
import 'package:ecommerce_admin/widgets/customAppBar.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/deletePopUp.dart';
import 'package:ecommerce_admin/widgets/multiTags.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:ecommerce_admin/widgets/singleDatePickerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

class HolidayAddNew extends StatefulWidget {
  @override
  State<HolidayAddNew> createState() => _HolidayAddNewState();
}

class _HolidayAddNewState extends State<HolidayAddNew> {
  TextEditingController key=new TextEditingController();
  TextEditingController dummyTextController=new TextEditingController();
  TextEditingController secret=new TextEditingController();

  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  bool showDelete=false;




  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    return Scaffold(

      body: Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                color:th.addNewBodyColor,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: cA1,
                    children: [
                      CustomAppBarAddNew(
                        title: "Add New Holiday",
                      ),
                      SizedBox(height: inBetweenHeight,),


                      ProductTextField(
                        width: textFormWidth,
                        title: "Name",
                        validation: validationList[1],

                        onComplete: (){
                          node.unfocus();
                        },
                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "From",
                        validation: validationList[1],
                        onComplete: (){
                          node.unfocus();
                        },
                        isTextField: false,
                        widget: SingleDatePickerWidget(hintText: "Select From Date"),

                      ),
                      SizedBox(height: inBetweenHeight,),
                      ProductTextField(
                        width: textFormWidth,
                        title: "To",
                        validation: validationList[1],
                        onComplete: (){
                          node.unfocus();
                        },
                        isTextField: false,
                        widget: SingleDatePickerWidget(hintText: "Select To Date"),
                      ),
                      SizedBox(height: inBetweenHeight,),
                      // CustomPaint(
                      //   size: Size( 400, 200),
                      //   painter: RPSCustomPainter(),
                      //
                      // ),




                      SizedBox(height: 50,),
                      Container(
                        width: textFormWidth+(40),
                        alignment: Alignment.center,
                        child: SaveBtn(ontap: (){
                          setState(() {
                            showDelete=!showDelete;
                          });
                        }),
                      ),

                    ],
                  ),
                ),
              ),
              DeletePopUp(
                  showDelete: showDelete,
                  deleteCb: (){
                    setState(() {
                      showDelete=false;
                    });
                  },
                  cancelCb: (){
                    setState(() {
                      showDelete=false;
                    });
                  }
             ),
            ],
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
   // path_0.moveTo(size.width*0.7519167,size.height*0.05466667);
    path_0.lineTo(size.width*0.7519167,size.height*0.05466667);

    path_0.cubicTo(size.width*0.6884167,size.height*0.05466667,size.width*0.6562222,size.height*0.2845000,size.width*0.6251111,size.height*0.5065000);
    path_0.cubicTo(size.width*0.5943056,size.height*0.7263333,size.width*0.5624444,size.height*0.9538333,size.width*0.4999444,size.height*0.9538333);
    path_0.cubicTo(size.width*0.4374444,size.height*0.9538333,size.width*0.4055833,size.height*0.7265000,size.width*0.3747778,size.height*0.5065000);
    path_0.cubicTo(size.width*0.3436667,size.height*0.2845000,size.width*0.3115000,size.height*0.05500000,size.width*0.2481111,size.height*0.05466667);


    /*



    path_0.lineTo(0,size.height*0.05466667);
    path_0.lineTo(0,size.height*0.06766667);
    path_0.lineTo(size.width*0.2480833,size.height*0.06766667);
    path_0.lineTo(size.width*0.2480833,size.height*0.06766667);
    path_0.cubicTo(size.width*0.3105000,size.height*0.06800000,size.width*0.3423333,size.height*0.2951667,size.width*0.3731111,size.height*0.5150000);
    path_0.cubicTo(size.width*0.4042500,size.height*0.7370000,size.width*0.4364444,size.height*0.9666667,size.width*0.4999444,size.height*0.9666667);
    path_0.cubicTo(size.width*0.5634444,size.height*0.9666667,size.width*0.5956389,size.height*0.7370000,size.width*0.6267500,size.height*0.5148333);
    path_0.cubicTo(size.width*0.6575556,size.height*0.2950000,size.width*0.6894167,size.height*0.06750000,size.width*0.7519167,size.height*0.06750000);
    path_0.lineTo(size.width*0.7519167,size.height*0.06750000);
    path_0.lineTo(size.width,size.height*0.06750000);
    path_0.lineTo(size.width,size.height*0.05466667);
   */
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.stroke;
    paint_0_fill.color = Color(0xff000000);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

