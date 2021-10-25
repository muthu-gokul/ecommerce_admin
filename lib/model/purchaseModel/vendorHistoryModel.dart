import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

// class VendorHistoryModel{
//
//   int goodsReceivedId;
//   double grandTotalAmount;
//   int purchaseOrderId;
//   String purchaseOrderNumber;
//   int vendorId;
//
//   List<VendorHistoryMaterialDetails> materialsList=[];
//
//   VendorHistoryModel.fromJSON(Map<String, dynamic> parsedJson) {
//     this.goodsReceivedId = parsedJson['GoodsReceivedId'];
//     this.grandTotalAmount = parsedJson['GrandTotalAmount'];
//     this.purchaseOrderId = parsedJson['PurchaseOrderId'];
//     this.purchaseOrderNumber = parsedJson['PurchaseOrderNumber'];
//     this.vendorId = parsedJson['VendorId'];
//     materialsList=[];
//   }
// }


class PurchaseOrdersIndentDetailModel{
 late int indentOrderId;
 late String indentOrderNumber;
 late String date;
 late int storeId;
 late String destination;
 late int deliveryTypeId;
 late String deliveryType;

 late bool isAdd;

  List<VendorHistoryMaterialDetails> materialsList=[];


  PurchaseOrdersIndentDetailModel({
      required this.indentOrderId,
    required this.indentOrderNumber,
    required this.date,
    required this.storeId,
    required  this.destination,
    required  this.deliveryTypeId,
    required   this.deliveryType,
    required  this.materialsList,
    required this.isAdd
      });

  PurchaseOrdersIndentDetailModel.fromJSON(Map<String, dynamic> parsedJson) {
    this.indentOrderId = parsedJson['IndentOrderId'];
    this.indentOrderNumber = parsedJson['IndentOrderNumber'];
    this.date = parsedJson['Date'];
    this.storeId = parsedJson['StoreId'];
    this.destination = parsedJson['Destination'];
    this.deliveryTypeId = parsedJson['DeliveryTypeId'];
    this.deliveryType = parsedJson['DeliveryType'];
    materialsList=[];
    isAdd=false;
  }
}



class PurchaseOrdersGridModel {
  late DateTime expectedDate;
  late String notes;
  late String purchaseOrder;
  late int purchaseOrderId;
  late int storeId;
  late String storeName;
  late int vendorId;
  late String vendorName;

  List<VendorHistoryMaterialDetails> materialsList=[];

  PurchaseOrdersGridModel.fromJSON(Map<String, dynamic> parsedJson) {
    // this.expectedDate = parsedJson['ExpectedDate'];
    this.expectedDate =(parsedJson['ExpectedDate']==null?null: DateFormat("yyyy-MM-dd").parse(parsedJson['ExpectedDate']!))!;
    this.notes = parsedJson['Notes'];
    this.purchaseOrder = parsedJson['PurchaseOrder'];
    this.purchaseOrderId = parsedJson['PurchaseOrderId'];
    this.storeId = parsedJson['StoreId'];
    this.storeName = parsedJson['StoreName'];
    this.vendorId = parsedJson['VendorId'];
    this.vendorName = parsedJson['VendorName'];
    this.materialsList=[];
  }
}


///////////////////////////////////////////             materials              /////////////////////////////////////////

class VendorHistoryMaterialDetails {
  late double amount;//Sub Total
  late double totalAmount;//Total
  late double discountAmount;
  late double discountedAmount;
  late double discountValue;
  late int goodsReceivedId;
  late int isAmount;
  late  int isDiscount;
  late int isPercentage;
  late int isTax;
  late int? materialBrandId;
  late int MaterialCategoryId;
  late String? materialBrandName;
  late int materialId;
  late String MaterialName;
  late double materialPrice;
  late int purchaseOrderId;
  late double receivedQuantity;
  late double taxAmount;
  late int taxId;

  late double taxValue;
  late String unitShortCode;
  late int vendorId;
  late int primaryUnitId;

  late TextEditingController purchaseQuantity =new TextEditingController();


  //purchase List
  late int PurchaseOrderMaterialMappingId;
  late  int PurchaseOrderId;
  late  bool CheckBoxValue;

  // Indent ORders
  late int IndentOrderId;
  late double IndentQuantity;
  late int IsVendor;


  //
  // VendorHistoryMaterialDetails({
  //     this.amount,
  //     this.totalAmount,
  //     this.discountAmount,
  //     this.discountedAmount,
  //     this.discountValue,
  //     this.goodsReceivedId,
  //     this.isAmount,
  //     this.isDiscount,
  //     this.isPercentage,
  //     this.isTax,
  //     this.materialBrandId,
  //     this.MaterialCategoryId,
  //     this.materialBrandName,
  //     this.materialId,
  //     this.MaterialName,
  //     this.materialPrice,
  //     this.purchaseOrderId,
  //     this.receivedQuantity,
  //     this.taxAmount,
  //     this.taxId,
  //     this.taxValue,
  //     this.unitShortCode,
  //     this.vendorId,
  //     this.primaryUnitId,
  //     this.purchaseQuantity,
  //     this.PurchaseOrderMaterialMappingId,
  //     this.PurchaseOrderId,
  //     this.CheckBoxValue,
  //     this.IndentOrderId,
  //     this.IndentQuantity,this.IsVendor,}); //VendorHistoryMaterialDetails({this.purchaseQuantity,this.unitShortCode,this.materialName,this.taxAmount,this.isDiscount,this.});


  VendorHistoryMaterialDetails.fromJSONVendorHistoryMaterials(Map<String, dynamic> parsedJson) {
    this.amount = parsedJson['Subtotal'];
    this.totalAmount = parsedJson['TotalAmount'];
    this.discountAmount = parsedJson['DiscountAmount'];
    this.discountedAmount = parsedJson['DiscountedAmount'];
    this.discountValue = parsedJson['DiscountValue'];
    this.goodsReceivedId = parsedJson['GoodsReceivedId'];
    this.isAmount = parsedJson['IsAmount'];
    this.isDiscount = parsedJson['IsDiscount'];
    this.isPercentage = parsedJson['IsPercentage'];
    this.materialBrandId = parsedJson['MaterialBrandId'];
    // this.MaterialCategoryId = parsedJson['MaterialCategoryId'];
    this.materialBrandName = parsedJson['MaterialBrandName'];
    this.materialId = parsedJson['MaterialId'];
    this.MaterialName = parsedJson['MaterialName'];
    this.materialPrice = parsedJson['Price'];
    this.purchaseOrderId = parsedJson['PurchaseOrderId'];
    this.receivedQuantity = parsedJson['Quantity'];
    this.taxAmount = parsedJson['TaxAmount'];
    this.taxId = parsedJson['TaxId'];
    this.taxValue = parsedJson['TaxValue'];
    this.unitShortCode = parsedJson['UnitShortCode'];
    this.vendorId = parsedJson['VendorId'];
    this.primaryUnitId = parsedJson['PrimaryUnitId'];
    this.CheckBoxValue= true;
    this.purchaseQuantity..text=parsedJson['Quantity'].toString();
    this.IndentQuantity=0.0;
  }


  VendorHistoryMaterialDetails.fromJSONMaterials(Map<String, dynamic> parsedJson) {
    this.vendorId = parsedJson['VendorId'];
    this.materialId = parsedJson['MaterialId'];
    this.MaterialName = parsedJson['MaterialName'];
    this.materialBrandId = parsedJson['MaterialBrandId'];
    this.materialBrandName = parsedJson['MaterialBrandName'];
    this.primaryUnitId = parsedJson['BuyingUnit'];
    this.unitShortCode = parsedJson['UnitShortCode'];

    this.isTax = parsedJson['IsTax'];
    this.taxId = parsedJson['TaxId'];
    this.taxValue = parsedJson['TaxValue'];

    this.isAmount = parsedJson['IsAmount'];
    this.isDiscount = parsedJson['IsDiscount'];
    this.isPercentage = parsedJson['IsPercentage'];
    this.discountValue = parsedJson['DiscountValue'];
    this.discountedAmount = parsedJson['DiscountedAmount']??0.0;

    this.discountAmount = 0.0;
    this.taxAmount = 0.0;
    this.amount = 0.0;
    this.totalAmount = 0.0;
    this.IndentQuantity = 0.0;

    this.MaterialCategoryId = parsedJson['MaterialCategoryId'];

    // this.goodsReceivedId = parsedJson['GoodsReceivedId'];
    this.materialPrice = parsedJson['FixedPrice'];
    // this.purchaseOrderId = parsedJson['PurchaseOrderId'];
    // this.receivedQuantity = parsedJson['Quantity'];
    // this.vendorId = parsedJson['VendorId'];

    this.CheckBoxValue= true;
    this.purchaseQuantity..text="";
  }


  VendorHistoryMaterialDetails.fromJSONIndentMaterials(Map<String, dynamic> parsedJson) {
    this.vendorId = parsedJson['VendorId'];
    this.IndentOrderId = parsedJson['IndentOrderId'];


    this.materialId = parsedJson['MaterialId'];
    this.MaterialName = parsedJson['MaterialName'];
    this.materialBrandId = parsedJson['MaterialBrandId'];
    this.materialBrandName = parsedJson['MaterialBrandName'];
    this.materialPrice = parsedJson['Price'];

    this.receivedQuantity = parsedJson['Quantity'];
    this.IndentQuantity = parsedJson['IndentQuantity'];
    this.purchaseQuantity..text="";
    this.primaryUnitId = parsedJson['PrimaryUnitId'];
    this.unitShortCode = parsedJson['UnitShortCode'];

    this.isAmount = parsedJson['IsAmount'];
    this.isDiscount = parsedJson['IsDiscount'];
    this.isPercentage = parsedJson['IsPercentage'];

    this.taxId = parsedJson['TaxId'];
    this.taxValue = parsedJson['TaxValue'];
    this.taxAmount = parsedJson['TaxAmount'];

    this.discountAmount = parsedJson['DiscountAmount'];
    this.discountedAmount = parsedJson['DiscountedAmount'];
    this.discountValue = parsedJson['DiscountValue'];

    this.amount = parsedJson['Amount'];
    this.totalAmount = parsedJson['TotalAmount'];

    this.IsVendor = parsedJson['IsVendor'];
    this.CheckBoxValue= false;
    this.purchaseQuantity..text="";


  }


  VendorHistoryMaterialDetails.fromJSONGetPurchaseOrders(Map<String, dynamic> parsedJson) {
    this.vendorId = parsedJson['VendorId'];
    this.purchaseOrderId = parsedJson['PurchaseOrderId'];
    this.materialId = parsedJson['MaterialId'];
    this.MaterialName = parsedJson['MaterialName'];
    this.materialBrandId = parsedJson['MaterialBrandId'];
    this.materialBrandName = parsedJson['MaterialBrandName'];

    this.receivedQuantity = parsedJson['Quantity'];
    this.purchaseQuantity..text=parsedJson['Quantity'].toString();

    this.IndentQuantity = parsedJson['IndentQuantity'];

    this.primaryUnitId = parsedJson['PrimaryUnitId'];
    this.unitShortCode = parsedJson['UnitShortCode'];

    this.amount = parsedJson['Amount'];

    this.materialPrice = parsedJson['Price'];
    this.isAmount = parsedJson['IsAmount'];
    this.isDiscount = parsedJson['IsDiscount'];
    this.isPercentage = parsedJson['IsPercentage'];

    this.discountAmount = parsedJson['DiscountAmount'];
    this.discountedAmount = parsedJson['DiscountedAmount'];
    this.discountValue = parsedJson['DiscountValue'];
    this.taxAmount = parsedJson['TaxAmount'];
    this.taxId = parsedJson['TaxId'];
    this.taxValue = parsedJson['TaxValue'];
    this.totalAmount = parsedJson['TotalAmount'];

  }


  Map<dynamic,dynamic> toJsonPurchaseOrdersMappingList(){
    var map = <String, dynamic>{
        'PurchaseOrderMaterialMappingId':PurchaseOrderMaterialMappingId,
        'PurchaseOrderId':PurchaseOrderId,
        'IndentOrderId':IndentOrderId,
        'MaterialId':materialId,
        'MaterialBrandId':materialBrandId,
        'UnitId':primaryUnitId,
        'Price':materialPrice,
        'Quantity':purchaseQuantity.text.isNotEmpty?double.parse(purchaseQuantity.text):0.00,
        'IndentQuantity':IndentQuantity,
        'Amount':amount,
        'IsDiscount':isDiscount,
        'IsPercentage':isPercentage,
        'IsAmount':isAmount,
        'DiscountValue':discountValue,
        'DiscountAmount':discountAmount,
        'DiscountedAmount':discountedAmount,
        'TaxId':taxId,
        'TaxValue':taxValue,
        'TaxAmount':taxAmount,
        'TotalAmount':totalAmount,
        'IsActive':1,


    };
    return map;
  }

}