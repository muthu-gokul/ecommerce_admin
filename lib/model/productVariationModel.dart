class ProductVariationModel{
  String productName;
  String color;
  String size;
  dynamic regularPrice;
  dynamic offerPrice;
  int stock;
  ProductVariationModel({required this.productName,required this.color,required this.size,required this.regularPrice,
  required this.offerPrice,required this.stock});
}