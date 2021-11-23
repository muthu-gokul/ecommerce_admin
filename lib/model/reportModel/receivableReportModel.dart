class ReceivableReportModel{
  String pymtNo;
  String accountType;
  String receivedDate;
  String partyName;
  String grossAmt;
  String receivedAmt;
  String status;
  String balAmt;
  String paymentType;


  ReceivableReportModel({required this.pymtNo,required this.accountType,required this.receivedDate,required this.partyName,
    required this.grossAmt,required this.receivedAmt,required this.status,required this.balAmt,required this.paymentType,});


  Map<String, dynamic> toJson() => {
    "pymtNo": pymtNo,
    "accountType": accountType,
    "receivedDate": receivedDate,
    "partyName": partyName,
    "grossAmt": grossAmt,
    "receivedAmt": receivedAmt,
    "status": status,
    "balAmt": balAmt,
    "paymentType": paymentType,
  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}