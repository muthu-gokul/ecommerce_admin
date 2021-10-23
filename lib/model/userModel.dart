class UserModel{
  String name;
  String email;
  String phoneNumber;
  String password;
  String mobileOTP;
  String emailOTP;
  String createdAt;
  String status;
  bool isActive;

  UserModel({required this.name,required this.email, required this.phoneNumber,required this.password,
    required this.mobileOTP,required this.emailOTP,required this.createdAt,required this.status,required this.isActive});
}
