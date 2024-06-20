class OrderHistoryDetailModel {
  Data? data;
  String? message;
  List<Null>? error;
  int? status;

  OrderHistoryDetailModel({this.data, this.message, this.error, this.status});

  OrderHistoryDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['error'] != null) {
      error = <Null>[];
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? orderCode;
  String? total;
  String? name;
  String? email;
  String? address;
  String? governorate;
  String? phone;
  Null? tax;
  String? subTotal;
  String? orderDate;
  String? status;
  Null? rejectDetails;
  Null? notes;
  int? discount;
  List<OrderProducts>? orderProducts;

  Data(
      {this.id,
        this.orderCode,
        this.total,
        this.name,
        this.email,
        this.address,
        this.governorate,
        this.phone,
        this.tax,
        this.subTotal,
        this.orderDate,
        this.status,
        this.rejectDetails,
        this.notes,
        this.discount,
        this.orderProducts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderCode = json['order_code'];
    total = json['total'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    governorate = json['governorate'];
    phone = json['phone'];
    tax = json['tax'];
    subTotal = json['sub_total'];
    orderDate = json['order_date'];
    status = json['status'];
    rejectDetails = json['reject_details'];
    notes = json['notes'];
    discount = json['discount'];
    if (json['order_products'] != null) {
      orderProducts = <OrderProducts>[];
      json['order_products'].forEach((v) {
        orderProducts!.add(new OrderProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_code'] = this.orderCode;
    data['total'] = this.total;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['governorate'] = this.governorate;
    data['phone'] = this.phone;
    data['tax'] = this.tax;
    data['sub_total'] = this.subTotal;
    data['order_date'] = this.orderDate;
    data['status'] = this.status;
    data['reject_details'] = this.rejectDetails;
    data['notes'] = this.notes;
    data['discount'] = this.discount;
    if (this.orderProducts != null) {
      data['order_products'] =
          this.orderProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderProducts {
  int? orderProductId;
  int? productId;
  String? productName;
  String? productPrice;
  int? productDiscount;
  double? productPriceAfterDiscount;
  int? orderProductQuantity;
  String? productTotal;

  OrderProducts(
      {this.orderProductId,
        this.productId,
        this.productName,
        this.productPrice,
        this.productDiscount,
        this.productPriceAfterDiscount,
        this.orderProductQuantity,
        this.productTotal});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    orderProductId = json['order_product_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    productPriceAfterDiscount = json['product_price_after_discount'];
    orderProductQuantity = json['order_product_quantity'];
    productTotal = json['product_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_product_id'] = this.orderProductId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['product_discount'] = this.productDiscount;
    data['product_price_after_discount'] = this.productPriceAfterDiscount;
    data['order_product_quantity'] = this.orderProductQuantity;
    data['product_total'] = this.productTotal;
    return data;
  }
}
