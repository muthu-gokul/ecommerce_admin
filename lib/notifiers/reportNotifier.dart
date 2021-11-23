import 'package:ecommerce_admin/model/appModel.dart';
import 'package:ecommerce_admin/model/reportModel/InvoiceReportModel.dart';
import 'package:ecommerce_admin/model/reportModel/brandReportModel.dart';
import 'package:ecommerce_admin/model/reportModel/contactReportModel.dart';
import 'package:ecommerce_admin/model/reportModel/customerReportModel.dart';
import 'package:ecommerce_admin/model/reportModel/giftCouponsReportModel.dart';
import 'package:ecommerce_admin/model/reportModel/mostRatedReportModel.dart';
import 'package:ecommerce_admin/model/reportModel/orderReportModel.dart';
import 'package:ecommerce_admin/model/reportModel/payablePayReportModel.dart';
import 'package:ecommerce_admin/model/reportModel/paymentReportModel.dart';
import 'package:ecommerce_admin/model/reportModel/productReportModel.dart';
import 'package:ecommerce_admin/model/reportModel/purchaseReportModel.dart';
import 'package:ecommerce_admin/model/reportModel/receivableReportModel.dart';
import 'package:ecommerce_admin/model/reportModel/vendorReportModel.dart';
import 'package:ecommerce_admin/widgets/grid/gridContents.dart';
import 'package:flutter/material.dart';
class ReportNotifier extends ChangeNotifier{
  List<GridHeaderModel> gridHeaderList=[];
  List<dynamic> gridData=[];

  assignData(String reportName){
    if(reportName=="Report 1"){
      gridHeaderList=[
        GridHeaderModel(columnName: "Download Type",propertyName: 'downldType'),
        GridHeaderModel(columnName: "Download Link",propertyName: 'downldLink'),

      ];
      gridData=[
        AppModel(downldType: "Play Store", downldLink: "URL Link"),
        AppModel(downldType: "Play Store", downldLink: "URL Link"),
        AppModel(downldType: "Play Store", downldLink: "URL Link"),
        AppModel(downldType: "Play Store", downldLink: "URL Link"),
      ];
    }
    else if(reportName=="Purchase Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: "BILL DATE",propertyName: 'billDate'),
        GridHeaderModel(columnName: "DUE DATE",propertyName: 'dueDate'),
        GridHeaderModel(columnName: "DELIVERY DATE",propertyName: 'deliveryDate'),
        GridHeaderModel(columnName: "Purchase",propertyName: 'purchase'),
        GridHeaderModel(columnName: "Goods Received",propertyName: 'goodsReceived'),
        GridHeaderModel(columnName: "VENDOR NAME",propertyName: 'vendorName'),
        GridHeaderModel(columnName: "Amount STATUS",propertyName: 'amtStatus'),
        GridHeaderModel(columnName: "PAYMENT METHOD",propertyName: 'pymtMethod'),
        GridHeaderModel(columnName: "CURRENT STATUS",propertyName: 'curStatus'),
        GridHeaderModel(columnName: "QTY ORDERED",propertyName: 'qtyOrdered'),
        GridHeaderModel(columnName: "QTY RECEIVED",propertyName: 'qtyReceived'),
        GridHeaderModel(columnName: "QTY TO BE BILLED",propertyName: 'qtyBilled'),
        GridHeaderModel(columnName: "BILL AMOUNT",propertyName: 'billAmt'),
        GridHeaderModel(columnName: "Excess Amount",propertyName: 'excessAmt'),
        GridHeaderModel(columnName: "BALANCE AMOUNT",propertyName: 'balAmt'),

      ];
      gridData=[
        PurchaseReport(billDate: "19-10-2021", dueDate: "29-11-2021",deliveryDate: "20/11/21",purchase: "PC001",goodsReceived: "GR0401",vendorName: "Aishu",amtStatus: "PENDING",pymtMethod: "Bank Transfer",curStatus: "Delivered",qtyOrdered: "150",qtyReceived: "105",qtyBilled: "110",billAmt: "10456",excessAmt: "1000",balAmt: "6500",),

      ];

    }
    else if(reportName=="Orders Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: "Order ID",propertyName: 'orderId'),
        GridHeaderModel(columnName: "Order Date",propertyName: 'orderDate'),
        GridHeaderModel(columnName: "Order Origin",propertyName: 'orderOrigin'),
        GridHeaderModel(columnName: "Customer Name",propertyName: 'cusName'),
        GridHeaderModel(columnName: "Phone",propertyName: 'phone'),
        GridHeaderModel(columnName: "Email",propertyName: 'email'),
        GridHeaderModel(columnName: "Address",propertyName: 'address'),
        GridHeaderModel(columnName: "Balance Due",propertyName: 'balanceDue'),
        GridHeaderModel(columnName: "Payments",propertyName: 'payments'),
        GridHeaderModel(columnName: "Status",propertyName: 'status'),
        GridHeaderModel(columnName: "Shipping",propertyName: 'shipping'),
        GridHeaderModel(columnName: "Subtotal",propertyName: 'subtotal'),
        GridHeaderModel(columnName: "Tax",propertyName: 'tax'),
        GridHeaderModel(columnName: "Over all Tax",propertyName: 'overtax'),
        GridHeaderModel(columnName: "Total",propertyName: 'total'),

      ];
      gridData=[
        OrderReportModel(orderId: "Order0001", orderDate: "16/11/21",orderOrigin: "Chennai",cusName: "Aishu",phone: "7904130912",email: "aishu@gmail.com",address: "No 2 ,Shruthi apartment",balanceDue: "0",payments: "Online payment",status: "delivered",shipping: "40",subtotal: "250 ",tax: "5",overtax: "10",total: "340",),

      ];

    }
    else if(reportName=="Product Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: " Product Name",propertyName: 'productName'),
        GridHeaderModel(columnName: "	Product Buy Price",propertyName: 'productBuyPrice'),
        GridHeaderModel(columnName: "Product Actual Price",propertyName: 'productActualPrice'),
        GridHeaderModel(columnName: "Product Offer Price",propertyName: 'productOfferPrice'),
        GridHeaderModel(columnName: "On hand",propertyName: 'onhand'),
        GridHeaderModel(columnName: "Committed",propertyName: 'committed'),
        GridHeaderModel(columnName: "Available",propertyName: 'available'),
        GridHeaderModel(columnName: "Profit",propertyName: 'profit'),
        GridHeaderModel(columnName: "Profit %",propertyName: 'profitpercent'),
        GridHeaderModel(columnName: "Sales Revenue Tax",propertyName: 'salesRevenue'),
        GridHeaderModel(columnName: "Tax",propertyName: 'tax'),
        GridHeaderModel(columnName: "Created At",propertyName: 'createdAt'),

      ];
      gridData=[
        ProductReportModel(productName: "Frock", productBuyPrice: "199", productActualPrice: "999", productOfferPrice: "499", onhand: "2000 pieces", committed: "567 Pieces", available: "1,433 Pieces", profit: "6,00,000", profitpercent: "90%", salesRevenue: "2.5", tax: "", createdAt: "19-10-2021"),

      ];

    }
    else if(reportName=="Gift Coupons Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: "Coupon Code",propertyName: 'couponCode'),
        GridHeaderModel(columnName: "Coupon Valid Type",propertyName: 'couponValidType'),
        GridHeaderModel(columnName: "Coupon Effect Type",propertyName: 'couponEffectType'),
        GridHeaderModel(columnName: "Redeem Amount Value",propertyName: 'redeemAmtValue'),
        GridHeaderModel(columnName: "Start Date",propertyName: 'startDate'),
        GridHeaderModel(columnName: "End Date",propertyName: 'endDate'),
        GridHeaderModel(columnName: "Coupon Offer",propertyName: 'couponOffer'),
        GridHeaderModel(columnName: "Minimum Purchase amount",propertyName: 'miniPurchaseAmt'),

      ];
      gridData=[
        GiftCouponReportModel(couponCode: "SZCRYNDSBN", couponValidType: "All users", couponEffectType: "Rupees", redeemAmtValue: "200", startDate: "22.10.21", endDate: "22.10.21", couponOffer: "buy 1000 above", miniPurchaseAmt: "1000"),

      ];

    }
    else if(reportName=="Most Rated Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: "Product Name",propertyName: 'productName'),
        GridHeaderModel(columnName: "No of Users",propertyName: 'noofUsers'),
        GridHeaderModel(columnName: "Title",propertyName: 'title'),
        GridHeaderModel(columnName: "Rating Value",propertyName: 'ratingValue'),
        GridHeaderModel(columnName: "Date & Time",propertyName: 'dateTime'),
      ];
      gridData=[
        MostRatedReportModel(productName: "T shirt", noofUsers: "150", title: "Super good", ratingValue: "4", dateTime: "27/10/21 12.56 PM"),

      ];

    }
    else if(reportName=="Contact Detail Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: "Name",propertyName: 'name'),
        GridHeaderModel(columnName: "	Date",propertyName: 'date'),
        GridHeaderModel(columnName: "Mobile no",propertyName: 'mobileNno'),
        GridHeaderModel(columnName: "Email ID",propertyName: 'email'),
        GridHeaderModel(columnName: "Queries",propertyName: 'queries'),
      ];
      gridData=[
        ContactReportModel(name: "Aishu", date: "12/11/21", mobileNno: "9259926576", email: "aishu@gmail.com", queries: "Well done………….."),
      ];

    }
    else if(reportName=="Brand Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: "Brand Name",propertyName: 'brandName'),
        GridHeaderModel(columnName: "	Date",propertyName: 'date'),
        GridHeaderModel(columnName: "Orders",propertyName: 'orders'),
        GridHeaderModel(columnName: "Customers",propertyName: 'customers'),
        GridHeaderModel(columnName: "Revenue",propertyName: 'revenue'),
        GridHeaderModel(columnName: "Margins",propertyName: 'margins'),
      ];
      gridData=[
        BrandReportModel(brandName: "Mi", date: "17/11/21", orders: "23456", customers: "202561", revenue: "10456", margins: "3456"),
      ];

    }
    else if(reportName=="Payment Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: "Payment Date",propertyName: 'pymntDate'),
        GridHeaderModel(columnName: "Customers Name",propertyName: 'cusName'),
        GridHeaderModel(columnName: "Customers Mobile No",propertyName: 'cusMoblNo'),
        GridHeaderModel(columnName: "Customers Mail Id",propertyName: 'cusemailId'),
        GridHeaderModel(columnName: "Payment Type",propertyName: 'pymntType'),
        GridHeaderModel(columnName: "Payment Amount",propertyName: 'pymntAmt'),
      ];
      gridData=[
        PaymentReportModel(pymntDate: "23/10/21", cusName: "Aishu", cusMoblNo: "7904130912", cusemailId: "aishu@gmail.com", pymntType: "COD", pymntAmt: "460"),
      ];

    }
    else if(reportName=="Payment Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: " Ranking in orders",propertyName: 'pymntDate'),
        GridHeaderModel(columnName: "Customers Name",propertyName: 'cusName'),
        GridHeaderModel(columnName: "Customers Mobile No",propertyName: 'cusMoblNo'),
        GridHeaderModel(columnName: "Customers Mail Id",propertyName: 'cusemailId'),
        GridHeaderModel(columnName: "No of Orders",propertyName: 'pymntType'),
        GridHeaderModel(columnName: "Total Purchased",propertyName: 'pymntAmt'),
      ];
      gridData=[
        CustomerReportModel(rankingOrders: "1", cusName: "Aishu", cusMoblNo: "7904130912", cusemailId: "aishu@gmail.com", noOfOrders: "450", totalPur: "4 Lakhs"),
      ];

    }
    else if(reportName=="Vendor Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: "Vendor Id",propertyName: 'vendorId'),
        GridHeaderModel(columnName: "Sellers Name",propertyName: 'sellersName'),
        GridHeaderModel(columnName: "Seller Mobile No",propertyName: 'sellerMobileNo'),
        GridHeaderModel(columnName: "Seller Mail Id",propertyName: 'sellerMail'),
        GridHeaderModel(columnName: "Company name",propertyName: 'cmpnyname'),
        GridHeaderModel(columnName: "Vendor Type",propertyName: 'vendorType'),
        GridHeaderModel(columnName: "Category",propertyName: 'category'),
        GridHeaderModel(columnName: "Service Status",propertyName: 'serviceStatus'),
        GridHeaderModel(columnName: "GST No",propertyName: 'gstNo'),
      ];
      gridData=[
        VendorReportModel(vendorId: "178557", sellersName: "Aishu", sellerMobileNo: "7904130912", sellerMail: "aishu@gmail.com", cmpnyname: "Aishu fashions", vendorType: "State", category: "Cloth", serviceStatus: "on", gstNo: "24354364")
      ];

    }
    else if(reportName=="Invoice Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: "Invoice No",propertyName: 'invoiceNo'),
        GridHeaderModel(columnName: "Invoice Type",propertyName: 'invoiceType'),
        GridHeaderModel(columnName: "Invoice Date",propertyName: 'invoiceDate'),
        GridHeaderModel(columnName: "Party Name",propertyName: 'partyName'),
        GridHeaderModel(columnName: "Gross Amount",propertyName: 'grossAmt'),
        GridHeaderModel(columnName: "Paid/ Received Amount",propertyName: 'paidReceivedAmt'),
        GridHeaderModel(columnName: "Payment Status",propertyName: 'pymtStatus'),
        GridHeaderModel(columnName: "Payment Type",propertyName: 'pymtType'),
      ];
      gridData=[
        InvoiceReportModel(invoiceNo: "34355", invoiceType: "Receivable", invoiceDate: "23.10.21", partyName: "Aishu", grossAmt: "75484", paidReceivedAmt: "Received", pymtStatus: "Pending", pymtType: "UPI")
      ];

    }
    else if(reportName=="Receivable Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: "Payment No",propertyName: 'pymtNo'),
        GridHeaderModel(columnName: "Accounts Type",propertyName: 'accountType'),
        GridHeaderModel(columnName: "Received Date",propertyName: 'receivedDate'),
        GridHeaderModel(columnName: "Party Name",propertyName: 'partyName'),
        GridHeaderModel(columnName: "Gross Amount",propertyName: 'grossAmt'),
        GridHeaderModel(columnName: "Received Amount",propertyName: 'receivedAmt'),
        GridHeaderModel(columnName: "Status",propertyName: 'status'),
        GridHeaderModel(columnName: "Balance Amount",propertyName: 'balAmt'),
        GridHeaderModel(columnName: "Payment Type",propertyName: 'paymentType'),
      ];
      gridData=[
        ReceivableReportModel(pymtNo: "34355", accountType: "Receivable", receivedDate: "23.10.21", partyName: "Aishu", grossAmt: "858548", receivedAmt: "858548", status: "Completed", balAmt: "0", paymentType: "UPI")
      ];

    }
    else if(reportName=="Payable Report"){

      gridHeaderList=[
        GridHeaderModel(columnName: "Payment No",propertyName: 'pymtNo'),
        GridHeaderModel(columnName: "Accounts Type",propertyName: 'accountType'),
        GridHeaderModel(columnName: "Received Date",propertyName: 'receivedDate'),
        GridHeaderModel(columnName: "Party Name",propertyName: 'partyName'),
        GridHeaderModel(columnName: "Gross Amount",propertyName: 'grossAmt'),
        GridHeaderModel(columnName: "Payable Amount",propertyName: 'payableAmt'),
        GridHeaderModel(columnName: "Status",propertyName: 'status'),
        GridHeaderModel(columnName: "Balance Amount",propertyName: 'balAmt'),
        GridHeaderModel(columnName: "Payment Type",propertyName: 'paymentType'),
      ];
      gridData=[
        PayablePAyReportModel(pymtNo: "34355", accountType: "Payable", receivedDate: "23.10.21", partyName: "Aishu", grossAmt: "858548", payableAmt: "858548", status: "Completed", balAmt: "0", paymentType: "UPI")
      ];

    }
    notifyListeners();
  }



}