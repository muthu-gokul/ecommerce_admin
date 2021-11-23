class ProductReportModel{
  String productName;
  String productBuyPrice;
  String productActualPrice;
  String productOfferPrice;
  String onhand;
  String committed;
  String available;
  String profit;
  String profitpercent;
  String salesRevenue;
  String tax;
  String createdAt;


  ProductReportModel({required this.productName,required this.productBuyPrice,required this.productActualPrice,required this.productOfferPrice,
    required this.onhand,required this.committed,required this.available,required this.profit,required this.profitpercent,required this.salesRevenue,
    required this.tax,required this.createdAt,});


  Map<String, dynamic> toJson() => {
    "productName": productName,
    "productBuyPrice": productBuyPrice,
    "productActualPrice": productActualPrice,
    "productOfferPrice": productOfferPrice,
    "onhand": onhand,
    "committed": committed,
    "available": available,
    "profit": profit,
    "profitpercent": profitpercent,
    "salesRevenue": salesRevenue,
    "tax": tax,
    "createdAt": createdAt,

  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}