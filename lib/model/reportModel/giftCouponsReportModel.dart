class GiftCouponReportModel{
  String couponCode;
  String couponValidType;
  String couponEffectType;
  String redeemAmtValue;
  String startDate;
  String endDate;
  String couponOffer;
  String miniPurchaseAmt;

  GiftCouponReportModel({required this.couponCode,required this.couponValidType,required this.couponEffectType,required this.redeemAmtValue,
    required this.startDate,required this.endDate,required this.couponOffer,required this.miniPurchaseAmt,});


  Map<String, dynamic> toJson() => {
    "couponCode": couponCode,
    "couponValidType": couponValidType,
    "couponEffectType": couponEffectType,
    "redeemAmtValue": redeemAmtValue,
    "startDate": startDate,
    "endDate": endDate,
    "couponOffer": couponOffer,
    "miniPurchaseAmt": miniPurchaseAmt,
  };
  dynamic get(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }


}