class VendorReportModel{
  String vendorId;
  String sellersName;
  String sellerMobileNo;
  String sellerMail;
  String cmpnyname;
  String vendorType;
  String category;
  String serviceStatus;
  String gstNo;



  VendorReportModel({required this.vendorId,required this.sellersName,required this.sellerMobileNo,required this.sellerMail,
    required this.cmpnyname,required this.vendorType,required this.category,required this.serviceStatus,required this.gstNo,});


  Map<String, dynamic> toJson() => {
    "vendorId": vendorId,
    "sellersName": sellersName,
    "sellerMobileNo": sellerMobileNo,
    "sellerMail": sellerMail,
    "cmpnyname": cmpnyname,
    "vendorType": vendorType,
    "category": category,
    "serviceStatus": serviceStatus,
    "gstNo": gstNo,
  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}