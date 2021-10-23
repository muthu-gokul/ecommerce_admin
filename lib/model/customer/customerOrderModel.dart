class CustomerOrderModel{
  String id;
  String item;
  String paymentInfo;
  String orderedDate;
  double price;
  CustomerOrderModel({required this.id,required this.price,required this.item,required this.orderedDate,
  required this.paymentInfo});
}
