class EmailSettingModel{
  String smptHost;
  String smptPost;
  String smptUsername;
  String smptPassword;
  String fullName;
  String fromEmail;


  EmailSettingModel({required this.smptHost,required this.smptPost, required this.smptUsername, required this.smptPassword,required this.fullName,
    required this.fromEmail,});
}