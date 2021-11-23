class CustomerReportModel{
  String rankingOrders;
  String cusName;
  String cusMoblNo;
  String cusemailId;
  String noOfOrders;
  String totalPur;

  CustomerReportModel({required this.rankingOrders,required this.cusName,required this.cusMoblNo,required this.cusemailId,
    required this.noOfOrders,required this.totalPur,});


  Map<String, dynamic> toJson() => {
    "rankingOrders": rankingOrders,
    "cusName": cusName,
    "cusMoblNo": cusMoblNo,
    "cusemailId": cusemailId,
    "noOfOrders": noOfOrders,
    "totalPur": totalPur,
  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}