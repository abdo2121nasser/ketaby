/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

PaymentIntentModel paymentIntentModelFromJson(String str) => PaymentIntentModel.fromJson(json.decode(str));

String paymentIntentModelToJson(PaymentIntentModel data) => json.encode(data.toJson());

class PaymentIntentModel {
    PaymentIntentModel({
       // required this.amountDetails,
      //  required this.metadata,
        required this.livemode,
        required this.amountCapturable,
      //  required this.automaticPaymentMethods,
        required this.currency,
        required this.id,
        required this.clientSecret,
        //required this.paymentMethodOptions,
        required this.captureMethod,
        required this.amount,
        required this.created,
       // required this.paymentMethodTypes,
        required this.amountReceived,
        required this.confirmationMethod,
        required this.object,
        required this.status,
    });

  //  AmountDetails amountDetails;
   // Metadata metadata;
    bool livemode;
    int amountCapturable;
  //  AutomaticPaymentMethods automaticPaymentMethods;
    String currency;
    String id;
    String clientSecret;
   // PaymentMethodOptions paymentMethodOptions;
    String captureMethod;
    int amount;
    int created;
  //  List<String> paymentMethodTypes;
    int amountReceived;
    String confirmationMethod;
    String object;
    String status;

    factory PaymentIntentModel.fromJson(Map<dynamic, dynamic> json) => PaymentIntentModel(
       // amountDetails: AmountDetails.fromJson(json["amount_details"]),
       // metadata: Metadata.fromJson(json["metadata"]),
        livemode: json["livemode"],
        amountCapturable: json["amount_capturable"],
       // automaticPaymentMethods: AutomaticPaymentMethods.fromJson(json["automatic_payment_methods"]),
        currency: json["currency"],
        id: json["id"],
        clientSecret: json["client_secret"],
        //paymentMethodOptions: PaymentMethodOptions.fromJson(json["payment_method_options"]),
        captureMethod: json["capture_method"],
        amount: json["amount"],
        created: json["created"],
       // paymentMethodTypes: List<String>.from(json["payment_method_types"].map((x) => x)),
        amountReceived: json["amount_received"],
        confirmationMethod: json["confirmation_method"],
        object: json["object"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
       // "amount_details": amountDetails.toJson(),
      //  "metadata": metadata.toJson(),
        "livemode": livemode,
        "amount_capturable": amountCapturable,
      //  "automatic_payment_methods": automaticPaymentMethods.toJson(),
        "currency": currency,
        "id": id,
        "client_secret": clientSecret,
      //  "payment_method_options": paymentMethodOptions.toJson(),
        "capture_method": captureMethod,
        "amount": amount,
        "created": created,
      //  "payment_method_types": List<dynamic>.from(paymentMethodTypes.map((x) => x)),
        "amount_received": amountReceived,
        "confirmation_method": confirmationMethod,
        "object": object,
        "status": status,
    };
}

class AmountDetails {
    AmountDetails({
        required this.tip,
    });

    Metadata tip;

    factory AmountDetails.fromJson(Map<dynamic, dynamic> json) => AmountDetails(
        tip: Metadata.fromJson(json["tip"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "tip": tip.toJson(),
    };
}

class Metadata {
    Metadata();

    factory Metadata.fromJson(Map<dynamic, dynamic> json) => Metadata(
    );

    Map<dynamic, dynamic> toJson() => {
    };
}

class AutomaticPaymentMethods {
    AutomaticPaymentMethods({
        required this.enabled,
    });

    bool enabled;

    factory AutomaticPaymentMethods.fromJson(Map<dynamic, dynamic> json) => AutomaticPaymentMethods(
        enabled: json["enabled"],
    );

    Map<dynamic, dynamic> toJson() => {
        "enabled": enabled,
    };
}

class PaymentMethodOptions {
    PaymentMethodOptions({
        required this.link,
        required this.card,
    });

    Metadata link;
    Card card;

    factory PaymentMethodOptions.fromJson(Map<dynamic, dynamic> json) => PaymentMethodOptions(
        link: Metadata.fromJson(json["link"]),
        card: Card.fromJson(json["card"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "link": link.toJson(),
        "card": card.toJson(),
    };
}

class Card {
    Card({
        required this.requestThreeDSecure,
    });

    String requestThreeDSecure;

    factory Card.fromJson(Map<dynamic, dynamic> json) => Card(
        requestThreeDSecure: json["request_three_d_secure"],
    );

    Map<dynamic, dynamic> toJson() => {
        "request_three_d_secure": requestThreeDSecure,
    };
}
