class PaymentReportModel{
  String  pymntDate;
  String cusName;
  String cusMoblNo;
  String cusemailId;
  String pymntType;
  String pymntAmt;

  PaymentReportModel({required this.pymntDate,required this.cusName,required this.cusMoblNo,required this.cusemailId,
    required this.pymntType,required this.pymntAmt,});


  Map<String, dynamic> toJson() => {
    "pymntDate": pymntDate,
    "cusName": cusName,
    "cusMoblNo": cusMoblNo,
    "cusemailId": cusemailId,
    "pymntType": pymntType,
    "pymntAmt": pymntAmt,
  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}