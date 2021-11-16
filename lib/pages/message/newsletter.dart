import 'package:ecommerce_admin/notifiers/productNotifier.dart';
import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:ecommerce_admin/pages/homePage.dart';
import 'package:ecommerce_admin/pages/product/productAddNew.dart';
import 'package:ecommerce_admin/widgets/buttons/backBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/saveBtn.dart';
import 'package:ecommerce_admin/widgets/buttons/swtich.dart';
import 'package:ecommerce_admin/widgets/customOverLayPopUp.dart';
import 'package:ecommerce_admin/widgets/customTextField.dart';
import 'package:ecommerce_admin/widgets/pickImage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scutiwidgets/size.dart';

import '../../constants.dart';

class NewsLette extends StatefulWidget {
  const NewsLette({Key? key}) : super(key: key);

  @override
  _NewsLetteState createState() => _NewsLetteState();
}

class _NewsLetteState extends State<NewsLette> {
  TextEditingController vendorName=new TextEditingController();
  TextEditingController vendorType=new TextEditingController();
  TextEditingController cmpyName=new TextEditingController();
  TextEditingController gstNo=new TextEditingController();
  TextEditingController mail=new TextEditingController();
  TextEditingController mblNo=new TextEditingController();
  TextEditingController address=new TextEditingController();
  TextEditingController district=new TextEditingController();
  TextEditingController city=new TextEditingController();
  TextEditingController state=new TextEditingController();
  TextEditingController pincode=new TextEditingController();
  TextEditingController postOffice=new TextEditingController();
  TextEditingController wkHour=new TextEditingController();
  TextEditingController deliveryslot=new TextEditingController();
  TextEditingController spotdelivery=new TextEditingController();
  TextEditingController preparingDays=new TextEditingController();
  TextEditingController packingChrg=new TextEditingController();
  TextEditingController delvrymthd=new TextEditingController();
  TextEditingController delvrychrg=new TextEditingController();
  TextEditingController pickMthd=new TextEditingController();
  TextEditingController pickOffer=new TextEditingController();



  TextEditingController SCatg=new TextEditingController();
  TextEditingController items=new TextEditingController();
  TextEditingController status=new TextEditingController();
  TextEditingController regdate=new TextEditingController();



  String selectedCategory="";
  String selectedCategoryType="";
  String selectedSubCategory="";
  String selectedBrand="";
  String selectedProduct="";
  XFile? image=null;
  List<bool> validationList= List<bool>.generate(3, (i) => false);

  bool showCategoryDropDown=false;
  bool showCategoryTypeDropDown=false;
  bool showSubCategoryDropDown=false;
  bool showBrandDropDown=false;
  bool showProductDropDown=false;

  List<FilterModel> filters=[];
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    final node=FocusScope.of(context);
    SizeConfig().init(context);
    return Consumer<ThemeNotifier>(
        builder: (context,th,child)=>  Consumer<ProductNotifier>(
          builder: (context,pn,child)=> Container(
            height: SizeConfig.screenHeight!-appBarHei,
            width: SizeConfig.screenWidth!-100,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: cA1,
                children: [
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "User Email ",
                      validation: validationList[1],
                      textEditingController: vendorName,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "From Email Address",
                      validation: validationList[1],
                      textEditingController: mail,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 10,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Newsletter Subject",
                      validation: validationList[1],
                      textEditingController: mblNo,
                      onComplete: (){
                        node.unfocus();
                      }
                  ),
                  SizedBox(height: 20,),
                  ProductTextField(
                      width: textFormWidth,
                      title: "Newsletter Content",
                      validation: validationList[1],
                      textEditingController: mblNo,
                      onComplete: (){
                        node.unfocus();
                      },
                      isTextField: false,
                      widget: Container(),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 20,left: 50,right: 50),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: HtmlEditor(
                        controller: controller,
                        htmlEditorOptions: HtmlEditorOptions(
                          hint: 'Your text here...',
                          shouldEnsureVisible: true,
                          adjustHeightForKeyboard: false,
                          autoAdjustHeight: false,

                          //initialText: "<p>text content initial, if any</p>",
                        ),
                        htmlToolbarOptions: HtmlToolbarOptions(
                          toolbarPosition: ToolbarPosition.aboveEditor, //by default
                          toolbarType: ToolbarType.nativeScrollable, //by default
                          defaultToolbarButtons: [
                            StyleButtons(),
                            FontSettingButtons(fontSizeUnit: false),
                            FontButtons(clearAll: false),
                            ColorButtons(),
                            ListButtons(listStyles: false),
                            ParagraphButtons(
                                textDirection: false, lineHeight: false, caseConverter: false),

                          ],
                          onButtonPressed: (ButtonType type, bool? status,
                              Function()? updateStatus) {
                            return true;
                          },
                          onDropdownChanged: (DropdownType type, dynamic changed,
                              Function(dynamic)? updateSelectedItem) {
                            return true;
                          },
                          mediaLinkInsertInterceptor:
                              (String url, InsertFileType type) {
                            print(url);
                            return true;
                          },
                          mediaUploadInterceptor:
                              (PlatformFile file, InsertFileType type) async {
                            print(file.name); //filename
                            print(file.size); //size in bytes
                            print(file.extension); //file extension (eg jpeg or mp4)
                            return true;
                          },
                        ),
                        otherOptions: OtherOptions(
                            height: 230,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            )
                        ),
                        callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
                          print('html before change is $currentHtml');
                        }, onChangeContent: (String? changed) {
                          print('content changed to $changed');
                        }, onChangeCodeview: (String? changed) {
                          print('code changed to $changed');
                        }, onChangeSelection: (EditorSettings settings) {
                          print('parent element is ${settings.parentElement}');
                          print('font name is ${settings.fontName}');
                        }, onDialogShown: () {
                          print('dialog shown');
                        }, onEnter: () {
                          print('enter/return pressed');
                        }, onFocus: () {
                          print('editor focused');
                        }, onBlur: () {
                          print('editor unfocused');
                        }, onBlurCodeview: () {
                          print('codeview either focused or unfocused');
                        }, onInit: () {
                          print('init');
                        },
                            //this is commented because it overrides the default Summernote handlers
                            /*onImageLinkInsert: (String? url) {
                    print(url ?? "unknown url");
                  },
                  onImageUpload: (FileUpload file) async {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                    print(file.base64);
                  },*/
                            onImageUploadError: (FileUpload? file, String? base64Str,
                                UploadError error) {
                              print(base64Str ?? '');
                              if (file != null) {
                                print(file.name);
                                print(file.size);
                                print(file.type);
                              }
                            }, onKeyDown: (int? keyCode) {
                              print('$keyCode key downed');
                              print(
                                  'current character count: ${controller.characterCount}');
                            }, onKeyUp: (int? keyCode) {
                              print('$keyCode key released');
                            }, onMouseDown: () {
                              print('mouse downed');
                            }, onMouseUp: () {
                              print('mouse released');
                            }, onNavigationRequestMobile: (String url) {
                              print(url);
                              return NavigationActionPolicy.ALLOW;
                            }, onPaste: () {
                              print('pasted into editor');
                            }, onScroll: () {
                              print('editor scrolled');
                            }),
                        plugins: [
                          SummernoteAtMention(
                              getSuggestionsMobile: (String value) {
                                var mentions = <String>['test1', 'test2', 'test3'];
                                return mentions
                                    .where((element) => element.contains(value))
                                    .toList();
                              },
                              mentionsWeb: ['test1', 'test2', 'test3'],
                              onSelect: (String value) {
                                print(value);
                              }),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 50,),

                  Container(
                    alignment:Alignment.center,
                    child: SaveBtn(
                      title: "Send",
                      ontap: (){},
                    ),
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        ),
      );
  }
}

class FilterModel{
  TextEditingController title;
  List<dynamic> data;
  FilterModel({required this.title,required this.data});
}
