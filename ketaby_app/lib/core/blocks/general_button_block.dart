import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby_app/core/cubits/prodect_cubit/product_cubit.dart';
import 'package:ketaby_app/core/cubits/prodect_cubit/product_cubit.dart';

import '../cubits/payment_cubit/payment_cubit.dart';


class GeneralButtonBlock extends StatelessWidget {
  final int labelFontSize;
  final String lable;
  final VoidCallback function;
  final double width, hight, borderRadius;
  final Color textColor, backgroundColor;
  final bool isPayPalProcess;

  GeneralButtonBlock({
    this.labelFontSize = 5,
    required this.lable,
    required this.function, required this.width,
    required this.hight, required this.textColor,
    required this.backgroundColor, required this.borderRadius,
    this.isPayPalProcess = false});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            var prodCubit = ProductCubit.get(context);
            var payCubit = PaymentCubit.get(context);
            return ElevatedButton(onPressed: isPayPalProcess ? () {
              payCubit.makePayPalPayment(
                  context: context,
                  productCartModel: prodCubit.productCartModel!);
            } : function,

                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)
                  ),
                  backgroundColor: backgroundColor,
                  fixedSize: Size(width, hight),
                ),
                child: Text(lable,
                  style: TextStyle(
                      fontSize: labelFontSize.toDouble(), color: textColor),));
          },
        );
      },
    );
  }
}
