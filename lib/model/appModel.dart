class AppModel{
  String downldType;
  String downldLink;
  AppModel({required this.downldType,required this.downldLink,});


  Map<String, dynamic> toJson() => {
    "downldType": downldType,
    "downldLink": downldLink,
  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}