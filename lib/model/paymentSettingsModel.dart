class PaymentSettingsModel{
  String currency;
  String key;
  String secret;
  bool isActive;
  PaymentSettingsModel({required this.key,required this.isActive,required this.currency,required this.secret});
}