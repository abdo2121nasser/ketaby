
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/blocks/check_out_block.dart';
import '../../core/blocks/drop_down_block.dart';
import '../../core/blocks/general_text_field_block.dart';
import '../../core/blocks/place_order_item_block.dart';
import '../../core/cubits/payment_cubit/payment_cubit.dart';
import '../../core/cubits/prodect_cubit/product_cubit.dart';
import '../../core/cubits/profile_cubit/profile_cubit.dart';
import '../../core/models/payment_models/paypal_models/amount_model.dart';
import '../../core/models/payment_models/paypal_models/item_list_model.dart';
import '../../core/models/payment_models/paypal_models/transaction_model.dart';
import '../../core/models/payment_models/stripe_models/payment_intent_input_model.dart';
import '../../core/services/payment_services/pay_pal_payment_services.dart';

class OrderProductScreen extends StatelessWidget {
  const OrderProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) async {
        if (state is StripePaymentSuccessState) {
          await ProductCubit.get(context).placeOrder(context: context);
        }
      },
      builder: (context, state) {
        return BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var profCubit = ProfileCubit.get(context);
            var prodCubit = ProductCubit.get(context);
            var payCubit = PaymentCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                centerTitle: true,
                title: const Text('Place order',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: 700,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        height: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GeneralTextFieldBlock(
                              hint: 'name',
                              controller: profCubit.nameController,
                              preIcon: const Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              canEdit: false,
                            ),
                            GeneralTextFieldBlock(
                              hint: 'email',
                              controller: profCubit.emailController,
                              preIcon: const Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              canEdit: false,
                            ),
                            GeneralTextFieldBlock(
                              hint: 'phone',
                              controller: profCubit.phoneController,
                              preIcon: const Icon(
                                Icons.phone,
                                color: Colors.blue,
                              ),
                              canEdit: false,
                            ),
                            GeneralTextFieldBlock(
                              hint: 'address',
                              controller: profCubit.addressController,
                              preIcon: const Icon(
                                Icons.location_on_sharp,
                                color: Colors.blue,
                              ),
                              canEdit: false,
                            ),
                            DropDownBlock(
                              hint: 'Select City',
                              items: prodCubit.govenments!,
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 2,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  PlaceOrderItemBlock(
                                      productName: prodCubit
                                          .productCartModel!
                                          .data!
                                          .cartItems![index]
                                          .itemProductName!,
                                      productPrice: prodCubit
                                          .productCartModel!
                                          .data!
                                          .cartItems![index]
                                          .itemProductPriceAfterDiscount!,
                                      productQuantity: prodCubit
                                          .productCartModel!
                                          .data!
                                          .cartItems![index]
                                          .itemQuantity!),
                              separatorBuilder: (context, index) =>
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 2.4,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                  ),
                              itemCount: prodCubit
                                  .productCartModel!.data!.cartItems!.length)),
                      CheckOutBlock(
                        hint: 'Order now',
                        buttonWidth: 120,
                        totalPrice: prodCubit.productCartModel!.data!.total!,
                        isPayPalProcess: true,
                        checkOutFunction: () async {
                          //  await prodCubit.checkOut();
                          if (prodCubit.currentGovenment!.isEmpty&&false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('you need to select city')));
                            //Navigator.pop(context);
                          } else {
                            // await PaymentCubit.get(context).makeStripePayment(
                            //     paymentIntentInputModel:
                            //         PaymentIntentInputModel(
                            //             amount: prodCubit
                            //                 .productCartModel!.data!.total!
                            //                 .toString(),
                            //             currency: 'USD'));
                            // await prodCubit.getAllProductCart();
                        //    payCubit.makePayPalPayment(context: context,productCartModel: prodCubit.productCartModel!);
                          }
                          Navigator.pop(context);
                        },
                      ),
        //         ElevatedButton(
        //   child: Text(''),
        //   onPressed: () {
        //     payCubit.makePayPalPayment(context: context,productCartModel: prodCubit.productCartModel!);
        //   },
        // ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}


