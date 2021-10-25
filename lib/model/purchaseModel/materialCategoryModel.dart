import 'package:flutter/material.dart';

class MaterialCategory{
  late int? MaterialCategoryId;
  late  String? MaterialCategoryName;
  late  ScrollController? scrollController;


  MaterialCategory({ this.MaterialCategoryId, this.MaterialCategoryName, this.scrollController});

  factory MaterialCategory.fromJson(Map<dynamic, dynamic> json) {
    return new MaterialCategory(
        MaterialCategoryId: json['MaterialCategoryId'],
        MaterialCategoryName: json['MaterialCategoryName'],
        scrollController: ScrollController()
    );
  }

}