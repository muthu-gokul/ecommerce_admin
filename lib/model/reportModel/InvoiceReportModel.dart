class InvoiceReportModel{
  String invoiceNo;
  String invoiceType;
  String invoiceDate;
  String partyName;
  String grossAmt;
  String paidReceivedAmt;
  String pymtStatus;
  String pymtType;



  InvoiceReportModel({required this.invoiceNo,required this.invoiceType,required this.invoiceDate,required this.partyName,
    required this.grossAmt,required this.paidReceivedAmt,required this.pymtStatus,required this.pymtType,});


  Map<String, dynamic> toJson() => {
    "invoiceNo": invoiceNo,
    "invoiceType": invoiceType,
    "invoiceDate": invoiceDate,
    "partyName": partyName,
    "grossAmt": grossAmt,
    "paidReceivedAmt": paidReceivedAmt,
    "pymtStatus": pymtStatus,
    "pymtType": pymtType,
  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}