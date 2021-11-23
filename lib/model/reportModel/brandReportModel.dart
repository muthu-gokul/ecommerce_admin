class BrandReportModel{
  String brandName;
  String date;
  String orders;
  String customers;
  String revenue;
  String margins;

  BrandReportModel({required this.brandName,required this.date,required this.orders,required this.customers,
    required this.revenue,required this.margins,});


  Map<String, dynamic> toJson() => {
    "brandName": brandName,
    "date": date,
    "orders": orders,
    "customers": customers,
    "revenue": revenue,
    "margins": margins,
  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}