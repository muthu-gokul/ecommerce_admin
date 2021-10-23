import 'package:ecommerce_admin/model/brandModel.dart';
import 'package:ecommerce_admin/model/categoryModel.dart';
import 'package:ecommerce_admin/model/customerModel.dart';
import 'package:ecommerce_admin/model/productModel.dart';
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

}