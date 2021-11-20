import 'package:ecommerce_admin/model/appModel.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:flutter/material.dart';
class ReportNotifier extends ChangeNotifier{
  List<GridHeaderModel> gridHeaderList=[];
  List<dynamic> gridData=[];
  assignData(String reportName){
    if(reportName=="Report 1"){
      gridHeaderList=[
        GridHeaderModel(columnName: "Download Type",propertyName: 'downldType'),
        GridHeaderModel(columnName: "Download Link",propertyName: 'downldLink'),

      ];
      gridData=[
        AppModel(downldType: "Play Store", downldLink: "URL Link"),
        AppModel(downldType: "Play Store", downldLink: "URL Link"),
        AppModel(downldType: "Play Store", downldLink: "URL Link"),
        AppModel(downldType: "Play Store", downldLink: "URL Link"),
      ];
    }
    notifyListeners();
  }



}