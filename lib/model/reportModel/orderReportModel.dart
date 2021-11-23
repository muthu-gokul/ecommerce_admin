class OrderReportModel{
  String orderId;
  String orderDate;
  String orderOrigin;
  String cusName;
  String phone;
  String email;
  String address;
  String balanceDue;
  String payments;
  String status;
  String shipping;
  String subtotal;
  String tax;
  String overtax;
  String total;

  OrderReportModel({required this.orderId,required this.orderDate,required this.orderOrigin,required this.cusName,required this.phone,
    required this.email,required this.address,required this.balanceDue,required this.payments,required this.status,required this.shipping,
    required this.subtotal,required this.tax,required this.overtax,required this.total,});


  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "orderDate": orderDate,
    "orderOrigin": orderOrigin,
    "cusName": cusName,
    "phone": phone,
    "email": email,
    "address": address,
    "balanceDue": balanceDue,
    "payments": payments,
    "status": status,
    "shipping": shipping,
    "subtotal": subtotal,
    "tax": tax,
    "overtax": overtax,
    "total": total,

  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}