class PurchaseReport{
  String billDate;
  String dueDate;
  String deliveryDate;
  String purchase;
  String goodsReceived;
  String vendorName;
  String amtStatus;
  String pymtMethod;
  String curStatus;
  String qtyOrdered;
  String qtyReceived;
  String qtyBilled;
  String billAmt;
  String excessAmt;
  String balAmt;
  PurchaseReport({required this.billDate,required this.dueDate,required this.deliveryDate,required this.purchase,required this.goodsReceived,
    required this.vendorName,required this.amtStatus,required this.pymtMethod,required this.curStatus,required this.qtyOrdered,required this.qtyReceived,
    required this.qtyBilled,required this.billAmt,required this.excessAmt,required this.balAmt,});


  Map<String, dynamic> toJson() => {
    "billDate": billDate,
    "dueDate": dueDate,
    "deliveryDate": deliveryDate,
    "purchase": purchase,
    "goodsReceived": goodsReceived,
    "vendorName": vendorName,
    "amtStatus": amtStatus,
    "pymtMethod": pymtMethod,
    "curStatus": curStatus,
    "qtyOrdered": qtyOrdered,
    "qtyReceived": qtyReceived,
    "qtyBilled": qtyBilled,
    "billAmt": billAmt,
    "excessAmt": excessAmt,
    "balAmt": balAmt,
  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}