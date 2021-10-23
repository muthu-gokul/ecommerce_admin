class ProductModel{
  String productId;
  String productImage;
  String productName;
  double productActualPrice;
  double productOfferPrice;
  String createdAt;
  String status;
  String unit;
  double productStock;
  double currentQty;
  bool publish;
  bool todaysDeal;
  bool isSelect;


  ProductModel({required this.productId,required this.productImage,required this.productName,required this.createdAt,
  required this.status,required this.currentQty,required this.productActualPrice,required this.productOfferPrice,
  required this.productStock,required this.publish,required this.todaysDeal,required this.unit,this.isSelect=false});

}