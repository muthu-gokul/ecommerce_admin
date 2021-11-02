class ProductStockModel{
  String id;
  String productName;
  String category;
  String stock;
  String sales;
  String inStock;
  String addedDate;
  String status;

  ProductStockModel({required this.id,required this.productName, required this.category,required this.stock,
    required this.sales,required this.inStock,required this.addedDate,required this.status});
}