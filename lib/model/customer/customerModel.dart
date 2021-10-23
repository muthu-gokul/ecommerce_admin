class CustomerModel{
  String name;
  String email;
  String phoneNumber;
  int totalOrders;
  String customerId;
  double totalAmount;

  CustomerModel({required this.name,required this.email, required this.phoneNumber,required this.totalOrders,
    required this.customerId,required this.totalAmount});
}