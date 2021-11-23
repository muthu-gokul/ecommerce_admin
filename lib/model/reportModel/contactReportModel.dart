class ContactReportModel{
  String name;
  String date;
  String mobileNno;
  String email;
  String queries;

  ContactReportModel({required this.name,required this.date,required this.mobileNno,required this.email,
    required this.queries,});


  Map<String, dynamic> toJson() => {
    "name": name,
    "date": date,
    "mobileNno": mobileNno,
    "email": email,
    "queries": queries,
  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}