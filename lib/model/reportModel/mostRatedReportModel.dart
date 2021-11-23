class MostRatedReportModel{
  String productName;
  String noofUsers;
  String title;
  String ratingValue;
  String dateTime;

  MostRatedReportModel({required this.productName,required this.noofUsers,required this.title,required this.ratingValue,
    required this.dateTime,});


  Map<String, dynamic> toJson() => {
    "productName": productName,
    "noofUsers": noofUsers,
    "title": title,
    "ratingValue": ratingValue,
    "dateTime": dateTime,
  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}