import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/model/customer/customerModel.dart';
import 'package:ecommerce_admin/model/customer/customerOrderModel.dart';
import 'package:ecommerce_admin/model/ordersList/ordersListModel.dart';
import 'package:ecommerce_admin/model/paymentSettingsModel.dart';
import 'package:ecommerce_admin/model/productModel.dart';
import 'package:ecommerce_admin/model/productShowCaseModel/productShowcaseModel.dart';
import 'package:flutter/cupertino.dart';

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
  
}