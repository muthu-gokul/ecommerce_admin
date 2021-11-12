import 'package:ecommerce_admin/model/UOMSettingsModel/conversionModel.dart';
import 'package:ecommerce_admin/model/UOMSettingsModel/uomModel.dart';
import 'package:ecommerce_admin/model/attributeModel.dart';
import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/cardClassificationModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/model/colorModel.dart';
import 'package:ecommerce_admin/model/customer/customerModel.dart';
import 'package:ecommerce_admin/model/customer/customerOrderModel.dart';
import 'package:ecommerce_admin/model/deliveryBoysModel.dart';
import 'package:ecommerce_admin/model/deliveryChargeModel.dart';
import 'package:ecommerce_admin/model/emailSettingModel.dart';
import 'package:ecommerce_admin/model/featuredBrandModel.dart';
import 'package:ecommerce_admin/model/frontCoverModel.dart';
import 'package:ecommerce_admin/model/giftCouponsModel.dart';
import 'package:ecommerce_admin/model/goodsReceivedModel/goodsReceivedAddModel.dart';
import 'package:ecommerce_admin/model/goodsReceivedModel/goodsReceivedModel.dart';
import 'package:ecommerce_admin/model/installationModel.dart';
import 'package:ecommerce_admin/model/ordersList/ordersListModel.dart';
import 'package:ecommerce_admin/model/paymentSettingsModel.dart';
import 'package:ecommerce_admin/model/pincodeModel/pincodeModel.dart';
import 'package:ecommerce_admin/model/productModel.dart';
import 'package:ecommerce_admin/model/productShowCaseModel/productShowcaseModel.dart';
import 'package:ecommerce_admin/model/productStockModel.dart';
import 'package:ecommerce_admin/model/purchaseModel/materialCategoryModel.dart';
import 'package:ecommerce_admin/model/purchaseModel/purchaseGridModel.dart';
import 'package:ecommerce_admin/model/purchaseModel/vendorHistoryModel.dart';
import 'package:ecommerce_admin/model/ratingsModel.dart';
import 'package:ecommerce_admin/model/refundModel.dart';
import 'package:ecommerce_admin/model/returnProducts/returnProductsModel.dart';
import 'package:ecommerce_admin/model/shippingCharge/shippingChargeModel.dart';
import 'package:ecommerce_admin/model/sizeModel.dart';
import 'package:ecommerce_admin/model/staffsModel.dart';
import 'package:ecommerce_admin/model/topOfferModel.dart';
import 'package:ecommerce_admin/model/underAmountModel.dart';
import 'package:ecommerce_admin/model/vendor/vendorListModel.dart';
import 'package:ecommerce_admin/model/vendor/vendorRequestModel.dart';
import 'package:ecommerce_admin/model/wishListModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ProductNotifier extends ChangeNotifier{

  //BRAND
  List<BrandModel> brandList=[];

  void addBrand(String brand,String slug){
    brandList.add(
        BrandModel(
            title: brand,
            slug: slug,
            logo: "",
            createdAt: currentDate,
            updatedAt: currentDate
        )
    );
    notifyListeners();
  }

  //CATEGORY
  List<String> categoryDropDownList=["Top Category"];
  List<CategoryModel> categoryList=[];

  addCategory(String category,String parent){
   categoryList.add(
        CategoryModel(
            categoryName: category,
            parentCategory: parent,
            logo: "",
            createdAt: currentDate,
            updatedAt: currentDate
        )
    );
   categoryDropDownList.add(category);
   notifyListeners();
  }



  List<String> units=["Piece","Kg","Number"];


  //PRODUCTS
  List<ProductModel> products=[
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
    ProductModel(productId: "EC001", productImage: "", productName: "Slipper", createdAt: "09-99-4099", status: "In Stock", currentQty: 200, productActualPrice: 299, productOfferPrice: 199, productStock: 500, publish: true, todaysDeal: true, unit: "Pieces"),
  ];



  //CUSTOMERS
  List<CustomerModel> customers=[
    CustomerModel(name: "Raghu", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0001", totalAmount: 43434.9),
    CustomerModel(name: "Bala", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0002", totalAmount: 43434.9),
    CustomerModel(name: "Vivek", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus00013", totalAmount: 43434.9),
    CustomerModel(name: "Ramesh", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus00014", totalAmount: 43434.9),
    CustomerModel(name: "Radha", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0005", totalAmount: 43434.9),
    CustomerModel(name: "Muthu", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0007", totalAmount: 43434.9),
    CustomerModel(name: "Raghu", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0001", totalAmount: 43434.9),
    CustomerModel(name: "Bala", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0002", totalAmount: 43434.9),
    CustomerModel(name: "Vivek", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus00013", totalAmount: 43434.9),
    CustomerModel(name: "Ramesh", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus00014", totalAmount: 43434.9),
    CustomerModel(name: "Radha", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0005", totalAmount: 43434.9),
    CustomerModel(name: "Muthu", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0007", totalAmount: 43434.9),

    CustomerModel(name: "Raghu", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0001", totalAmount: 43434.9),
    CustomerModel(name: "Bala", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0002", totalAmount: 43434.9),
    CustomerModel(name: "Vivek", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus00013", totalAmount: 43434.9),
    CustomerModel(name: "Ramesh", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus00014", totalAmount: 43434.9),
    CustomerModel(name: "Radha", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0005", totalAmount: 43434.9),
    CustomerModel(name: "Muthu", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0007", totalAmount: 43434.9),
    CustomerModel(name: "Raghu", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0001", totalAmount: 43434.9),
    CustomerModel(name: "Bala", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0002", totalAmount: 43434.9),
    CustomerModel(name: "Vivek", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus00013", totalAmount: 43434.9),
    CustomerModel(name: "Ramesh", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus00014", totalAmount: 43434.9),
    CustomerModel(name: "Radha", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0005", totalAmount: 43434.9),
    CustomerModel(name: "Muthu", email: "raghu@gmail.com", phoneNumber: "9876543210", totalOrders: 12, customerId: "Cus0007", totalAmount: 43434.9),
  ];
  List<CustomerModel> filterCustomers=[];
  searchCustomer(String v){
    if(v.isEmpty){
      init(true);

    }
    else{
      filterCustomers=customers.where((element) =>
          element.customerId.toLowerCase().contains(v) ||
          element.name.toLowerCase().contains(v) ||
          element.email.toLowerCase().contains(v)
      ).toList();
    }
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  int perPage = 10;
  int currentPage=0;
  int totalPage=0;
  init(bool changePerPage){

    if(!changePerPage){
      perPage = 10;
    }

    currentPage=0;

    totalPage=(customers.length/perPage).ceil();
    filterCustomers.clear();
    if(((currentPage*perPage) + perPage)>customers.length){
      filterCustomers.addAll(customers.getRange(currentPage*perPage, customers.length));
    }
    else{
      filterCustomers.addAll(customers.getRange(currentPage*perPage, (currentPage*perPage) + perPage));
    }
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
  void next(){
    if(currentPage<totalPage-1){
      currentPage++;
      if(((currentPage*perPage) + perPage)>customers.length){
        filterCustomers.clear();
        filterCustomers.addAll(customers.getRange(currentPage*perPage, customers.length));
      }
      else{
        filterCustomers.clear();
        filterCustomers.addAll(customers.getRange(currentPage*perPage, (currentPage*perPage) + perPage));
      }
      notifyListeners();
    }

  }
  void prev(){
    if(currentPage>0){
      currentPage--;
      if(((currentPage*perPage) + perPage)>customers.length){
        filterCustomers.clear();
        filterCustomers.addAll(customers.getRange(currentPage*perPage, customers.length));
      }
      else{
        filterCustomers.clear();
        filterCustomers.addAll(customers.getRange(currentPage*perPage, (currentPage*perPage) + perPage));
      }
      notifyListeners();
    }
  }

  List<CustomerOrderModel> customerOrders=[
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
    CustomerOrderModel(id: "#Order-113232", price: 5454, item: "Notes,Dar..", orderedDate: "March 16,2021", paymentInfo: "Bank Emi"),
  ];

  List<OrdersListModel> orders=[
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: true, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order002", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: false, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: true, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: true, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: false, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: false, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: false, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: false, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: false, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: false, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: true, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: true, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: true, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: false, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: false, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: false, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: true, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: true, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
    OrdersListModel(orderId: "Order001", productName: "Phone", qty: 3, phoneNo: "9898989898", totalAmt: 123223, orderedDate: "44-44-4444", deviceType: "Smart Phone", isApp: true, orderStatus: "Processing", paymentStatus: "Processing", paymentType: "COD"),
  ];

  List<ProductShowCaseModel> productShowCaseList=[
    ProductShowCaseModel(categoryName: "Electronics", subCategoryName: "AC", heading: "Onida", noOfDisplay: 8, isDisplay: true, sortOrder: 1),
    ProductShowCaseModel(categoryName: "Electronics", subCategoryName: "AC", heading: "Onida", noOfDisplay: 8, isDisplay: true, sortOrder: 2),
    ProductShowCaseModel(categoryName: "Electronics", subCategoryName: "AC", heading: "Onida", noOfDisplay: 8, isDisplay: true, sortOrder: 3),
    ProductShowCaseModel(categoryName: "Electronics", subCategoryName: "AC", heading: "Onida", noOfDisplay: 8, isDisplay: true, sortOrder: 4),
  ];

  List<PaymentSettingsModel> paymentSettingsList=[
    PaymentSettingsModel(key: "FDFGDGGGGDGDG", isActive: true, currency: "INR", secret: "GDFDGDDGGGDG"),
    PaymentSettingsModel(key: "FDFGDGGGGDGDG", isActive: true, currency: "EURO", secret: "GDFDGDDGGGDG"),
    PaymentSettingsModel(key: "FDFGDGGGGDGDG", isActive: true, currency: "US DOLLAR", secret: "GDFDGDDGGGDG"),
  ];





  //FrontCover
  List<FrontCoverModel> frontCover=[
    FrontCoverModel(sliderTitle: "Festivel Offer ", url: "Mi/mobile/POCO M3 PRO 5G", sliderImage: "Image", sortOrders: 1, display: "Cus0001",),
    FrontCoverModel(sliderTitle: "Back Offer", url: "Mi/mobile/POCO M3 PRO 5G", sliderImage: "Image", sortOrders: 2, display: "Cus0001",),
    FrontCoverModel(sliderTitle: "Product Offer", url: "Mi/mobile/POCO M3 PRO 5G", sliderImage: "Image", sortOrders: 3, display: "Cus0001",),

  ];

  //FeaturedBrand
  List<FeaturedBrandModel> featuredBrand=[
    FeaturedBrandModel(brandname: "Mi ", url: "mobile/Mi/", sliderImage: "Image", sortOrders: 1, display: "Cus0001",),
    FeaturedBrandModel(brandname: "Mi", url: "mobile/Mi/", sliderImage: "Image", sortOrders: 2, display: "Cus0001",),
    FeaturedBrandModel(brandname: "Mi", url: "mobile/Mi/", sliderImage: "Image", sortOrders: 3, display: "Cus0001",),

  ];

  //UnderAmount
  List<UnderAmountModel> underAmount=[
    UnderAmountModel(enterAmount: "100", url: "Mi/mobile", image: "Image", sortOrders: 1, display: "Cus0001",),
    UnderAmountModel(enterAmount: "200", url: "Mi/mobile", image: "Image", sortOrders: 2, display: "Cus0001",),
    UnderAmountModel(enterAmount: "300", url: "Mi/mobile", image: "Image", sortOrders: 3, display: "Cus0001",),

  ];

  //TopOffers
  List<TopOfferModel> topOffer=[
    TopOfferModel(offerName: "Mi", url: "Mi/mobile", sliderImage: "Image", sortOrders: 1, display: "Cus0001",),
    TopOfferModel(offerName: "Mi", url: "Mi/mobile",  sliderImage: "Image", sortOrders: 2, display: "Cus0001",),
    TopOfferModel(offerName: "Mi", url: "Mi/mobile",  sliderImage: "Image", sortOrders: 3, display: "Cus0001",),

  ];


  //EmailSetting
  List<EmailSettingModel> emailSetting=[
    EmailSettingModel(smptHost: "smtp.zoho.in", smptPost: "465", smptUsername: "Balasubramaniyan@Scutisoft.com", smptPassword:"123456" , fullName: "saravanastore", fromEmail:"saravanastore@gmail.com",),
    EmailSettingModel(smptHost: "smtp.zoho.in", smptPost: "168", smptUsername: "Muthu@scutisoft.com", smptPassword: "123456", fullName: "saravanastore", fromEmail:"saravanastore@gmail.com", ),
    EmailSettingModel(smptHost: "smtp.zoho.in", smptPost: "990", smptUsername: "vivek@scutisoft.com", smptPassword: "123456", fullName: "saravanastore", fromEmail:"saravanastore@gmail.com",),

  ];

  //UOM Settings
  List<UomModel> uomList=[
    UomModel(description: "Bottle", mnemonic: "BT"),
    UomModel(description: "Case", mnemonic: "CS"),
    UomModel(description: "Bag", mnemonic: "BG"),
    UomModel(description: "Cylinder", mnemonic: "CL"),
    UomModel(description: "Kilogram", mnemonic: "KG"),
    UomModel(description: "Liter", mnemonic: "LI"),
  ];

  List<ConversionModel> conversionList=[
    ConversionModel(fromUnit: "CS", toUnit: 12, unitName: "Beer"),
    ConversionModel(fromUnit: "CS", toUnit: 12, unitName: "Water"),
    ConversionModel(fromUnit: "CS", toUnit: 12, unitName: "Beer"),
    ConversionModel(fromUnit: "CS", toUnit: 12, unitName: "Water"),
  ];


  //Purchase
List<PurchaseGridModel> purchaseList=[
  PurchaseGridModel(expectedDate: "19-11-2021", pNo: "PC001", vendorCompany: "GRT", vendorType: "District"),
  PurchaseGridModel(expectedDate: "19-11-2021", pNo: "PC001", vendorCompany: "GRT", vendorType: "District"),
  PurchaseGridModel(expectedDate: "19-11-2021", pNo: "PC001", vendorCompany: "GRT", vendorType: "District"),
  PurchaseGridModel(expectedDate: "19-11-2021", pNo: "PC001", vendorCompany: "GRT", vendorType: "District"),
  PurchaseGridModel(expectedDate: "19-11-2021", pNo: "PC001", vendorCompany: "GRT", vendorType: "District"),
  PurchaseGridModel(expectedDate: "19-11-2021", pNo: "PC001", vendorCompany: "GRT", vendorType: "District"),
  PurchaseGridModel(expectedDate: "19-11-2021", pNo: "PC001", vendorCompany: "GRT", vendorType: "District"),
  PurchaseGridModel(expectedDate: "19-11-2021", pNo: "PC001", vendorCompany: "GRT", vendorType: "District"),
];

var t=[{"VendorId":4,"MaterialId":1539,"MaterialName":"Guest Rice","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":1,"UnitShortCode":"KG","PricePerUnit":100.00,"FixedPrice":70.00,"IsTax":1,"TaxId":3,"TaxValue":5.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1067,"MaterialName":"STAFF RICE","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":50.00,"FixedPrice":30.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":30.00},{"VendorId":4,"MaterialId":1070,"MaterialName":"RAW RICE","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":60.00,"FixedPrice":25.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1096,"MaterialName":"IDLY RICE 1 KG","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":50.00,"FixedPrice":35.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1097,"MaterialName":"MELAS RICE 1 KG","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":80.00,"FixedPrice":66.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1166,"MaterialName":"BASUMATHI RICE","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":1,"UnitShortCode":"KG","PricePerUnit":70.00,"FixedPrice":55.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1186,"MaterialName":"INDIA FORM BRIYANI RICE","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":75.00,"FixedPrice":52.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1202,"MaterialName":"ROYAL TREEY CLASSIC (B.RICE)","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":82.00,"FixedPrice":51.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1211,"MaterialName":"JEERAGA SAMPA RICE","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":97.00,"FixedPrice":79.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1216,"MaterialName":"LOTUS RICES (FRIED RICE)","MaterialCategoryId":25,"MaterialCategoryName":"PROVISION","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":62.00,"FixedPrice":40.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1225,"MaterialName":"CHA CHA FRIED RICE","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":54.00,"FixedPrice":30.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1226,"MaterialName":"B.ENTRY RICE","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":96.00,"FixedPrice":69.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1231,"MaterialName":"MEALS RICE(75KG)","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":89.00,"FixedPrice":45.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1232,"MaterialName":"MEALS RICE(25KG)","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":63.00,"FixedPrice":42.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1233,"MaterialName":"RAW RICE(50KG)","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":60.00,"FixedPrice":40.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1253,"MaterialName":"INDIAN QUEEN RICE","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":82.00,"FixedPrice":41.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00},{"VendorId":4,"MaterialId":1255,"MaterialName":"G.T.M(FRIED) RICE","MaterialCategoryId":2,"MaterialCategoryName":"Rice","MaterialBrandId":null,"MaterialBrandName":null,"BuyingUnit":6,"UnitShortCode":"KGS","PricePerUnit":74.00,"FixedPrice":51.00,"IsTax":0,"TaxId":3,"TaxValue":0.00,"TaxAmount":0.00,"IsDiscount":0,"IsPercentage":0,"IsAmount":0,"DiscountValue":0.00,"DiscountAmount":0.00,"TotalAmount":0.00}];
 var t1=[
   {
     "MaterialCategoryId": 1,
     "MaterialCategoryName": "Spices"
   }, {
     "MaterialCategoryId": 2,
     "MaterialCategoryName": "Rice"
   }, {
     "MaterialCategoryId": 3,
     "MaterialCategoryName": "Oil"
   }, {
     "MaterialCategoryId": 4,
     "MaterialCategoryName": "CREAM"
   }, {
     "MaterialCategoryId": 5,
     "MaterialCategoryName": "WATER"
   }, {
     "MaterialCategoryId": 6,
     "MaterialCategoryName": "STATIONARY"
   }, {
     "MaterialCategoryId": 7,
     "MaterialCategoryName": "DHALL"
   }, {
     "MaterialCategoryId": 8,
     "MaterialCategoryName": "VEGETABLE"
   }, {
     "MaterialCategoryId": 9,
     "MaterialCategoryName": "POOJAI"
   }, {
     "MaterialCategoryId": 10,
     "MaterialCategoryName": "PACKING MET"
   }, {
     "MaterialCategoryId": 11,
     "MaterialCategoryName": "POOJA ITEM"
   }, {
     "MaterialCategoryId": 12,
     "MaterialCategoryName": "HOUSE KEEPING ITEMS"
   }, {
     "MaterialCategoryId": 13,
     "MaterialCategoryName": "OIL"
   }, {
     "MaterialCategoryId": 14,
     "MaterialCategoryName": "STATIONERY "
   }, {
     "MaterialCategoryId": 15,
     "MaterialCategoryName": "GAS"
   }, {
     "MaterialCategoryId": 16,
     "MaterialCategoryName": "PARCEL COVER"
   }, {
     "MaterialCategoryId": 17,
     "MaterialCategoryName": "PLASTIC CONT"
   }, {
     "MaterialCategoryId": 18,
     "MaterialCategoryName": "PROVISON"
   }, {
     "MaterialCategoryId": 19,
     "MaterialCategoryName": "COOKING"
   }, {
     "MaterialCategoryId": 20,
     "MaterialCategoryName": "FOLLODA ITEMS"
   }, {
     "MaterialCategoryId": 21,
     "MaterialCategoryName": "MEAT ITEM"
   }, {
     "MaterialCategoryId": 22,
     "MaterialCategoryName": "Cooked Food"
   }, {
     "MaterialCategoryId": 23,
     "MaterialCategoryName": "COOL DRINKS"
   }, {
     "MaterialCategoryId": 24,
     "MaterialCategoryName": "RICE"
   },

 ];

  List<VendorHistoryMaterialDetails> PO_vendorMaterials=[];
  List<VendorHistoryMaterialDetails> PO_filtervendorMaterials=[];
  List<MaterialCategory> materialCategoriesProcessed=[];
  late TabController PO_materialsController;

  void initPurchase(){
    PO_vendorMaterials = t.map((e) => VendorHistoryMaterialDetails.fromJSONMaterials(e)).toList();
    PO_filtervendorMaterials = t.map((e) => VendorHistoryMaterialDetails.fromJSONMaterials(e)).toList();
    materialCategoriesProcessed=t1.map((e) => MaterialCategory.fromJson(e)).toList();
    materialCategoriesProcessed.insert(0, MaterialCategory(
        MaterialCategoryName: "All Items",
    ),);
    notifyListeners();
  }

  late int PO_tempMaterialcategorylId;
  PO_initTickerProvider(TickerProviderStateMixin tickerProviderStateMixin){
    PO_materialsController=TabController(length: materialCategoriesProcessed.length,vsync: tickerProviderStateMixin,);

    PO_materialsController.addListener(() {
      if(PO_materialsController.index==0){
        PO_filtervendorMaterials=List.from(PO_vendorMaterials);
      }
      else{
        print("TAb");
        PO_tempMaterialcategorylId=materialCategoriesProcessed[PO_materialsController.index].MaterialCategoryId!;
        PO_filtervendorMaterials=PO_vendorMaterials.where((element) => element.MaterialCategoryId==PO_tempMaterialcategorylId).toList();

      }
      notifyListeners();
      //print(processedController.index);
    });
  }

  //Goods Received
  List<GoodsReceivedModel> goodsRecList=[
    GoodsReceivedModel(vendorCompany: "Shanriya", vendorType: "District", date: "19-20-2020", orderNo: "ORDER 243", purNo: "PO0001"),
    GoodsReceivedModel(vendorCompany: "Shanriya", vendorType: "District", date: "19-20-2020", orderNo: "ORDER 243", purNo: "PO0001"),
    GoodsReceivedModel(vendorCompany: "Shanriya", vendorType: "District", date: "19-20-2020", orderNo: "ORDER 243", purNo: "PO0001"),
    GoodsReceivedModel(vendorCompany: "Shanriya", vendorType: "District", date: "19-20-2020", orderNo: "ORDER 243", purNo: "PO0001"),
    GoodsReceivedModel(vendorCompany: "Shanriya", vendorType: "District", date: "19-20-2020", orderNo: "ORDER 243", purNo: "PO0001"),
    GoodsReceivedModel(vendorCompany: "Shanriya", vendorType: "District", date: "19-20-2020", orderNo: "ORDER 243", purNo: "PO0001"),
    GoodsReceivedModel(vendorCompany: "Shanriya", vendorType: "District", date: "19-20-2020", orderNo: "ORDER 243", purNo: "PO0001"),
    GoodsReceivedModel(vendorCompany: "Shanriya", vendorType: "District", date: "19-20-2020", orderNo: "ORDER 243", purNo: "PO0001"),
  ];

  List<GoodsReceivedAddNewModel> goodsAddNewList=[
    GoodsReceivedAddNewModel(itemName: "Dress", amount: 2324, orderedQty: 12, receivedQty: 11),
    GoodsReceivedAddNewModel(itemName: "Dress", amount: 2324, orderedQty: 12, receivedQty: 11),
    GoodsReceivedAddNewModel(itemName: "Dress", amount: 2324, orderedQty: 12, receivedQty: 11),
    GoodsReceivedAddNewModel(itemName: "Dress", amount: 2324, orderedQty: 12, receivedQty: 11),
    GoodsReceivedAddNewModel(itemName: "Dress", amount: 2324, orderedQty: 12, receivedQty: 11),
    GoodsReceivedAddNewModel(itemName: "Dress", amount: 2324, orderedQty: 12, receivedQty: 11),
  ];

  //Return Products
  List<ReturnProductsModel> returnList=[
    ReturnProductsModel(itemName: "Frock", date: "4-09-2302", price: 4343, id: "RE0001", customer: "Raghu"),
    ReturnProductsModel(itemName: "Frock", date: "4-09-2302", price: 4343, id: "RE0001", customer: "Raghu"),
    ReturnProductsModel(itemName: "Frock", date: "4-09-2302", price: 4343, id: "RE0001", customer: "Raghu"),
    ReturnProductsModel(itemName: "Frock", date: "4-09-2302", price: 4343, id: "RE0001", customer: "Raghu"),
    ReturnProductsModel(itemName: "Frock", date: "4-09-2302", price: 4343, id: "RE0001", customer: "Raghu"),
    ReturnProductsModel(itemName: "Frock", date: "4-09-2302", price: 4343, id: "RE0001", customer: "Raghu"),
  ];

//Shipping Charges
  List<ShippingChargeModel> shippingChargesList=[
    ShippingChargeModel(date: "19-29-2021", charge: 45, priceFrom: 0, priceTo: 500),
    ShippingChargeModel(date: "19-29-2021", charge: 45, priceFrom: 0, priceTo: 500),
    ShippingChargeModel(date: "19-29-2021", charge: 45, priceFrom: 0, priceTo: 500),
    ShippingChargeModel(date: "19-29-2021", charge: 45, priceFrom: 0, priceTo: 500),
    ShippingChargeModel(date: "19-29-2021", charge: 45, priceFrom: 0, priceTo: 500),
  ];



  //VendorList
  List<VendorListModel> vendorList=[
    VendorListModel(id: "#SP-00002", cmpyName: "SaravanaStore", vendrName: "Balasubramaniyan", vendrType:"State" , registorDate: "19-10-2021", CmpyCatgery:"Cloth",mail:"balasubramaniyan@Scutisoft.com",mbleNo:"7556789099",address:"Chennai",gst:"GST1234567232323"),
    VendorListModel(id: "#SP-00003", cmpyName: "SaravanaStore", vendrName: "MuthuGokul", vendrType:"State" , registorDate: "19-10-2021", CmpyCatgery:"Cloth",mail:"muthugokul@Scutisoft.com",mbleNo:"7544478909",address:"Chennai",gst:"GST1234567232323"),
    VendorListModel(id: "#SP-00004", cmpyName: "SaravanaStore", vendrName: "RameshShankar", vendrType:"State" , registorDate: "19-10-2021", CmpyCatgery:"Cloth",mail:"mameshshankar@Scutisoft.com",mbleNo:"7333789099",address:"Chennai",gst:"GST1234567232323"),
  ];

  //VendorRequest
  List<VendorRequestModel> vendorRequest=[
    VendorRequestModel(cmpyName: "SaravanaStore", Name: "Balasubramaniyan",mbleNo:"7556789099",),
    VendorRequestModel(cmpyName: "SaravanaStore", Name: "Muthu",mbleNo:"7556789099",),
    VendorRequestModel(cmpyName: "SaravanaStore", Name: "Ramesh",mbleNo:"7556789099",),
  ];

  //Pincode
  List<PincodeModel> pincodeList=[
    PincodeModel(days: 2, from: "600001", to: "600200"),
    PincodeModel(days: 2, from: "600001", to: "600200"),
    PincodeModel(days: 2, from: "600001", to: "600200"),
    PincodeModel(days: 2, from: "600001", to: "600200"),
    PincodeModel(days: 2, from: "600001", to: "600200"),
  ];

  //cardclassification
  List<CardClassificationModel> cardClassification=[
    CardClassificationModel(cardName: "Visa Debit Card", cardType : "Visa",bankName:"HDFC",),
    CardClassificationModel(cardName: "Visa Debit Card", cardType : "Visa",bankName:"HDFC",),
    CardClassificationModel(cardName: "Visa Debit Card", cardType : "Visa",bankName:"HDFC",),
  ];

  List<GiftCouponsModel> giftCoupons=[
    GiftCouponsModel(couponCode:"SZCRYNDSBN", couponValid : "All users",couponEffect:"Rupees",redeemAmount:"200",startDate:"22.10.21",endDate:"22.11.21",couponOffer:"buy 1000 above",minimumPurchase:"1000",),
    GiftCouponsModel(couponCode:"SZCRYNDSBN", couponValid : "All users",couponEffect:"Rupees",redeemAmount:"200",startDate:"22.10.21",endDate:"22.11.21",couponOffer:"buy 1000 above",minimumPurchase:"1000",),
    GiftCouponsModel(couponCode:"SZCRYNDSBN", couponValid : "All users",couponEffect:"Rupees",redeemAmount:"200",startDate:"22.10.21",endDate:"22.11.21",couponOffer:"buy 1000 above",minimumPurchase:"1000",),

  ];

//wishlist
  List<WishListModel> wishList=[
    WishListModel(productName : "T-shirt",cusMail:"Shan@gmail.com",cusNames:"Aishu ",creDate:"27/10/21",),
    WishListModel(productName : "T-shirt",cusMail:"Shan@gmail.com",cusNames:"Aishu ",creDate:"27/10/21",),
    WishListModel(productName : "T-shirt",cusMail:"Shan@gmail.com",cusNames:"Aishu ",creDate:"27/10/21",),
    WishListModel(productName : "T-shirt",cusMail:"Shan@gmail.com",cusNames:"Aishu ",creDate:"27/10/21",),
  ];

  //staffs
  List<StaffsModel> staffs=[
    StaffsModel(name : "Aishu",idNo:"23456",email:"aishu@gmail.com ",phone:"7904130912",role:"Manager",addres: "Chennai",),
    StaffsModel(name : "Bala",idNo:"23457",email:"bala@gmail.com ",phone:"7904130232",role:"Staff",addres: "Chennai",),
    StaffsModel(name : "Muthu",idNo:"23458",email:"Muthu@gmail.com ",phone:"7904131111",role:"Admin",addres: "Chennai",),
  ];

  //refunds
  List<RefundModel> refunds=[
    RefundModel(orderId : "#1234",product:"T-shirt",cusname:"aishu",cusmail:"aishu@gmail.com",refundConfi:"No refund for this product. Bcz 3 days ago",),
    RefundModel(orderId : "#1234",product:"T-shirt",cusname:"aishu",cusmail:"aishu@gmail.com",refundConfi:"No refund for this product. Bcz 3 days ago",),
    RefundModel(orderId : "#1234",product:"T-shirt",cusname:"aishu",cusmail:"aishu@gmail.com",refundConfi:"No refund for this product. Bcz 3 days ago",),
  ];

  //ProductStockModel
  List<ProductStockModel> productStocks=[
    ProductStockModel(id : "#1234",productName:"T-shirt",category:"Dress",stock: "5650",sales:"4400",inStock:"1250",addedDate: "19-10-2021",status:"sell",),
    ProductStockModel(id : "#1234",productName:"T-shirt",category:"Dress",stock: "5650",sales:"4400",inStock:"1250",addedDate: "19-10-2021",status:"offer process",),
    ProductStockModel(id : "#1234",productName:"T-shirt",category:"Dress",stock: "5650",sales:"4400",inStock:"1250",addedDate: "19-10-2021",status:"out of stock",),
  ];

  //AttributesModel
  List<AttributesModel> attributes=[
    AttributesModel(name : "Color",slug:"Color",type:"color",description: "Color Description",sortOrder:"Custom ordering",),
    AttributesModel(name : "Size",slug:"size",type:"button",description: "Size Description",sortOrder:"Name (Numeric)",),
    AttributesModel(name : "Mobile Color",slug:"size",type:"image",description: "Size Description",sortOrder:"Custom ordering",),
  ];

  //ColorMode
  List<ColorModel> addColor=[
    ColorModel(name : "Black",slug:"black",description: "Color Description",count:"5",),
    ColorModel(name : "Red",slug:"Red",description: "Size Description",count:"8",),
  ];

  //AddSizeModel
  List<AddSizeModel> addSize=[
    AddSizeModel(name : "S",slug:"S",description: "Color Description",count:"5",),
    AddSizeModel(name : "M",slug:"M",description: "Size Description",count:"6",),
    AddSizeModel(name : "L",slug:"XL",description: "Size Description",count:"7",),
    AddSizeModel(name : "XL",slug:"XL",description: "Size Description",count:"7",),
  ];


  //DeliverBoysModel
  List<DeliverBoysModel> deliveryBoys=[
    DeliverBoysModel(name : "Aathrava",onlineOffline:"Online ",mobileNo: "658458875",collection:"456000",ordersDelivered: "4500",ratings: "4.6 ",paymentConfig: "15,000",),
    DeliverBoysModel(name : "Bala",onlineOffline:"Online ",mobileNo: "658458876",collection:"450000",ordersDelivered: "3500",ratings: "4.0 ",paymentConfig: "12,000",),
    DeliverBoysModel(name : "Muthu",onlineOffline:"Online ",mobileNo: "658458877",collection:"4000",ordersDelivered: "400",ratings: "4.1 ",paymentConfig: "12,000",),
  ];

  //DeliveryChargeModel
  List<DeliveryChargeModel> deliveryCharges=[
    DeliveryChargeModel(amount: 50, to: 200, from: 0, createdAt: "02/11/21"),
    DeliveryChargeModel(amount: 45, to: 400, from: 200, createdAt: "03/11/21"),
  ];

  //InstallationModel
  List<InstallationModel> installationList=[
    InstallationModel(Product: "AC", days: 2, amount: 43444, covered: "Lorem Ipasun", notCovered: "Enter into house"),
    InstallationModel(Product: "AC", days: 2, amount: 43444, covered: "Lorem Ipasun", notCovered: "Enter into house"),
    InstallationModel(Product: "AC", days: 2, amount: 43444, covered: "Lorem Ipasun", notCovered: "Enter into house"),
    InstallationModel(Product: "AC", days: 2, amount: 43444, covered: "Lorem Ipasun", notCovered: "Enter into house"),
    InstallationModel(Product: "AC", days: 2, amount: 43444, covered: "Lorem Ipasun", notCovered: "Enter into house"),
    InstallationModel(Product: "AC", days: 2, amount: 43444, covered: "Lorem Ipasun", notCovered: "Enter into house"),
    InstallationModel(Product: "AC", days: 2, amount: 43444, covered: "Lorem Ipasun", notCovered: "Enter into house"),
  ];

  //RatingsModel
List<RatingsModel> ratings=[
  RatingsModel(productName: "T shirt", rating: 4.7, noOfRatings: 14, noOfReviews: 5),
  RatingsModel(productName: "T shirt", rating: 4.7, noOfRatings: 14, noOfReviews: 5),
  RatingsModel(productName: "T shirt", rating: 4.7, noOfRatings: 14, noOfReviews: 5),
  RatingsModel(productName: "T shirt", rating: 4.7, noOfRatings: 14, noOfReviews: 5),
  RatingsModel(productName: "T shirt", rating: 4.7, noOfRatings: 14, noOfReviews: 5),
  RatingsModel(productName: "T shirt", rating: 4.7, noOfRatings: 14, noOfReviews: 5),
];



  List<UserAccessModel> data=[];
  List<dynamic> v=[
    {"ModuleId":1,"ModuleName":"ManageUser","AccessUrl":"api","ModuleAction":"View","1":0,"2":1,"3":0,"4":0},
    {"ModuleId":2,"ModuleName":"ManageUser","AccessUrl":"api","ModuleAction":"Manage","1":1,"2":0,"3":0,"4":0},
    {"ModuleId":3,"ModuleName":"UserAccess","AccessUrl":"api","ModuleAction":"View","1":1,"2":1,"3":0,"4":0},
    {"ModuleId":4,"ModuleName":"UserAccess","AccessUrl":"api","ModuleAction":"Manage","1":1,"2":0,"3":0,"4":0},
    {"ModuleId":5,"ModuleName":"DashBoard","AccessUrl":"api","ModuleAction":"View","1":1,"2":0,"3":0,"4":0},
    {"ModuleId":6,"ModuleName":"Sale","AccessUrl":"api","ModuleAction":"View","1":1,"2":0,"3":1,"4":1},
    {"ModuleId":7,"ModuleName":"Sale","AccessUrl":"api","ModuleAction":"Manage","1":1,"2":0,"3":1,"4":1},
    {"ModuleId":8,"ModuleName":"Purchase","AccessUrl":"api","ModuleAction":"View","1":0,"2":1,"3":1,"4":1},
    {"ModuleId":9,"ModuleName":"Purchase","AccessUrl":"api","ModuleAction":"Manage","1":1,"2":0,"3":1,"4":0},{"ModuleId":10,"ModuleName":"GoodsReceived","AccessUrl":"api","ModuleAction":"View","1":0,"2":1,"3":1,"4":1},{"ModuleId":11,"ModuleName":"GoodsReceived","AccessUrl":"api","ModuleAction":"Manage","1":1,"2":1,"3":1,"4":0},{"ModuleId":12,"ModuleName":"Production","AccessUrl":"api","ModuleAction":"View","1":0,"2":1,"3":1,"4":1},{"ModuleId":13,"ModuleName":"Production","AccessUrl":"api","ModuleAction":"Manage","1":0,"2":1,"3":1,"4":1},{"ModuleId":14,"ModuleName":"EmployeeMaster","AccessUrl":"api","ModuleAction":"View","1":0,"2":1,"3":1,"4":1},{"ModuleId":15,"ModuleName":"EmployeeMaster","AccessUrl":"api","ModuleAction":"Manage","1":0,"2":1,"3":1,"4":1},{"ModuleId":16,"ModuleName":"EmployeeAttendance","AccessUrl":"api","ModuleAction":"View","1":0,"2":1,"3":1,"4":1},{"ModuleId":17,"ModuleName":"EmployeeAttendance","AccessUrl":"api","ModuleAction":"Manage","1":0,"2":1,"3":1,"4":1},{"ModuleId":18,"ModuleName":"EmployeeAdvance","AccessUrl":"api","ModuleAction":"View","1":0,"2":1,"3":1,"4":1},{"ModuleId":19,"ModuleName":"EmployeeAdvance","AccessUrl":"api","ModuleAction":"Manage","1":0,"2":1,"3":1,"4":1},{"ModuleId":20,"ModuleName":"EmployeeSalary","AccessUrl":"api","ModuleAction":"View","1":0,"2":1,"3":1,"4":1},{"ModuleId":21,"ModuleName":"EmployeeSalary","AccessUrl":"api","ModuleAction":"Manage","1":1,"2":1,"3":1,"4":1},{"ModuleId":22,"ModuleName":"MachineManagement","AccessUrl":"api","ModuleAction":"View","1":1,"2":1,"3":1,"4":1},{"ModuleId":23,"ModuleName":"MachineManagement","AccessUrl":"api","ModuleAction":"Manage","1":1,"2":1,"3":1,"4":1},{"ModuleId":24,"ModuleName":"Invoice","AccessUrl":"api","ModuleAction":"View","1":1,"2":1,"3":1,"4":1},{"ModuleId":25,"ModuleName":"Invoice","AccessUrl":"api","ModuleAction":"Manage","1":1,"2":1,"3":1,"4":1},{"ModuleId":26,"ModuleName":"Payment","AccessUrl":"api","ModuleAction":"View","1":1,"2":1,"3":1,"4":1},{"ModuleId":27,"ModuleName":"Payment","AccessUrl":"api","ModuleAction":"Manage","1":1,"2":1,"3":1,"4":1},{"ModuleId":28,"ModuleName":"Report","AccessUrl":"api","ModuleAction":"View","1":1,"2":1,"3":1,"4":1},{"ModuleId":29,"ModuleName":"Report","AccessUrl":"api","ModuleAction":"Export","1":1,"2":1,"3":1,"4":1},{"ModuleId":30,"ModuleName":"Settings","AccessUrl":"api","ModuleAction":"View","1":1,"2":1,"3":1,"4":1},{"ModuleId":31,"ModuleName":"Settings","AccessUrl":"api","ModuleAction":"Manage","1":1,"2":1,"3":1,"4":1}];

  addData(){
    data.clear();
    v.forEach((element) {
      int index=data.indexWhere((ele) => ele.parent['ModuleName']==element['ModuleName']).toInt();
      if(index==-1){
        data.add(UserAccessModel(parent: element, children: [],isOpen: false));
      }
      else{
        data[index].children.add(element);
      }
    });
    notifyListeners();
  }

}

class UserAccessModel{
  Map parent;
  List<dynamic> children;
  bool isOpen;
  UserAccessModel({required this.parent,required this.children,required this.isOpen});
}