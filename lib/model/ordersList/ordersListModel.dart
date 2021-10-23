class OrdersListModel{
  String orderId;
  String productName;
  int qty;
  double totalAmt;
  String phoneNo;
  String orderedDate;
  String deviceType;
  bool isApp;
  String paymentType;
  String paymentStatus;
  String orderStatus;

  OrdersListModel({required this.orderId,required this.productName,required this.qty,required this.phoneNo,required this.totalAmt,
  required this.orderedDate,required this.deviceType,required this.isApp,required this.orderStatus,required this.paymentStatus,
  required this.paymentType});
}
