class PaymentModel{
  String payNo;
  String date;
  String customerName;
  dynamic grossAmount;
  dynamic receivedOrPaidAmount;
  dynamic balanceAmount;
  String paymentStatus;
  PaymentModel({required this.payNo,required this.date,required this.paymentStatus,required this.customerName,
    required this.grossAmount,required this.balanceAmount,required this.receivedOrPaidAmount});
}