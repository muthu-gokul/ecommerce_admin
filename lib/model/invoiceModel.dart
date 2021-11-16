class InvoiceModel{
  String invNo;
  String date;
  String customerName;
  dynamic grossAmount;
  String paymentStatus;
  InvoiceModel({required this.invNo,required this.date,required this.paymentStatus,required this.customerName,required this.grossAmount});
}