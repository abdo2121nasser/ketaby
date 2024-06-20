import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import '../../constants/apis_keys_constants.dart';
import '../../models/payment_models/paypal_models/amount_model.dart';
import '../../models/payment_models/paypal_models/item_list_model.dart';
import '../../models/payment_models/paypal_models/transaction_model.dart';


class PayPalPaymentService {
  static void payPalMethod(BuildContext context,
      {required Transaction transaction}) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) =>
          PaypalCheckoutView(
            sandboxMode: true,
            clientId: ApiKeysConst.payPalClintId,
            secretKey: ApiKeysConst.payPalSecretKey,
            transactions: [
              {
                "amount": transaction.amountModel.toJson(),
                "description": "The payment transaction description.",
                "item_list": transaction.itemListModel.toJson(),

              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              log("onSuccess: $params");
              Navigator.pop(context);
            },
            onError: (error) {
              log("onError: $error");
              Navigator.pop(context);
            },
            onCancel: () {
              Navigator.pop(context);
            },
          ),
    ));
  }

}

