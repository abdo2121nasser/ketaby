import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/payment_models/paypal_models/amount_model.dart';
import '../../models/payment_models/paypal_models/item_list_model.dart';
import '../../models/payment_models/paypal_models/transaction_model.dart';
import '../../models/payment_models/stripe_models/payment_intent_input_model.dart';
import '../../models/product_model/product_cart_model.dart';
import '../../services/payment_services/pay_pal_payment_services.dart';
import '../../services/payment_services/strip_payment_service.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);
  Transaction? transaction;
  // makeStripePayment(
  //     {required PaymentIntentInputModel paymentIntentInputModel}) async {
  //   try {
  //     emit(StripePaymentLoadingState());
  //     await StripePaymentService.makePayment(
  //         paymentIntentInputModel: paymentIntentInputModel);
  //     emit(StripePaymentSuccessState());
  //   } catch (error) {
  //     emit(StripePaymentErrorState());
  //     print(error);
  //   }
  // }


  setTransaction({required ProductCartModel productCartModel}) {
    List<OrderItemModel> orders = [];
    productCartModel
        .data!
        .cartItems!
        .forEach((element) {
      orders.add(OrderItemModel(
          name: element.itemProductName!,
          quantity: element.itemQuantity!.toInt(),
          price: element.itemProductPriceAfterDiscount.toString(),
          currency: "USD"));
    });


    transaction = Transaction(amountModel: AmountModel(
            total: productCartModel
                .data!
                .total
                .toString(),
            currency: "USD",
            details: Details(
                subtotal: productCartModel
                    .data!
                    .total
                    .toString(),
                shipping: '0',
                shippingDiscount: 0)),
        itemListModel: ItemListModel(order: orders));
    emit(SetTransactionState());

  }

  makePayPalPayment({required context,required ProductCartModel productCartModel}) {
   setTransaction(productCartModel: productCartModel);
   try
   {
     emit(PayPalPaymentLoadingState());
     print(transaction!.amountModel.total);
     PayPalPaymentService.payPalMethod(context, transaction: transaction!);
     emit(PayPalPaymentSuccessState());

   }catch(error)
    {
      emit(PayPalPaymentErrorState());
      print(error);
    }

  }
}
