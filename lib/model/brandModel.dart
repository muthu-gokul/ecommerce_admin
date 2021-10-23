class BrandModel{
  String title;
  String slug;
  String logo;
  String createdAt;
  String updatedAt;
  BrandModel({required this.title,required this.slug,required this.logo,required this.createdAt,
  required this.updatedAt,});


  Map<String, dynamic> toJson() => {
    "title": title,
  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }



}