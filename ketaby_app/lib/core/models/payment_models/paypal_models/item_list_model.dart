/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

ItemListModel itemListModelFromJson(String str) => ItemListModel.fromJson(json.decode(str));

String itemListModelToJson(ItemListModel data) => json.encode(data.toJson());

class ItemListModel {
    ItemListModel({
        required this.order,
    });

    List<OrderItemModel> order;

    factory ItemListModel.fromJson(Map<dynamic, dynamic> json) => ItemListModel(
        order: List<OrderItemModel>.from(json["items"].map((x) => OrderItemModel.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "items": List<dynamic>.from(order.map((x) => x.toJson())),
    };
}

class OrderItemModel {
    OrderItemModel({
        required this.quantity,
        required this.price,
        required this.name,
        required this.currency,
    });

    int quantity;
    String price;
    String name;
    String currency;

    factory OrderItemModel.fromJson(Map<dynamic, dynamic> json) => OrderItemModel(
        quantity: json["quantity"],
        price: json["price"],
        name: json["name"],
        currency: json["currency"],
    );

    Map<dynamic, dynamic> toJson() => {
        "quantity": quantity,
        "price": price,
        "name": name,
        "currency": currency,
    };
}
