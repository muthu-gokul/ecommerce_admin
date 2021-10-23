class ProductShowCaseModel{
  String categoryName;
  String subCategoryName;
  String heading;
  int noOfDisplay;
  bool isDisplay;
  int sortOrder;

  ProductShowCaseModel({required this.categoryName, required this.subCategoryName,
    required this.heading, required this.noOfDisplay, required this.isDisplay, required this.sortOrder});
}