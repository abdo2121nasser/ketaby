/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

AmountModel amountModelFromJson(String str) => AmountModel.fromJson(json.decode(str));

String amountModelToJson(AmountModel data) => json.encode(data.toJson());

class AmountModel {
    AmountModel({
        required this.total,
        required this.currency,
        required this.details,
    });

  final  String total;
  final  String currency;
  final  Details details;

    factory AmountModel.fromJson(Map<dynamic, dynamic> json) => AmountModel(
        total: json["total"],
        currency: json["currency"],
        details: Details.fromJson(json["details"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "total": total,
        "currency": currency,
        "details": details.toJson(),
    };
}

class Details {
    Details({
        required this.shipping,
        required this.shippingDiscount,
        required this.subtotal,
    });

   final String shipping;
   final int shippingDiscount;
   final String subtotal;

    factory Details.fromJson(Map<dynamic, dynamic> json) => Details(
        shipping: json["shipping"],
        shippingDiscount: json["shipping_discount"],
        subtotal: json["subtotal"],
    );

    Map<dynamic, dynamic> toJson() => {
        "shipping": shipping,
        "shipping_discount": shippingDiscount,
        "subtotal": subtotal,
    };
}
