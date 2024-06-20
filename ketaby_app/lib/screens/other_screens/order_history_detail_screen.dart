import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/blocks/place_order_item_block.dart';
import '../../core/cubits/prodect_cubit/product_cubit.dart';




class OrderHistoryDetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var prodCubit=ProductCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'order detail',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          prodCubit.orderHistoryDetailModel==null || state is GetAllOrderHistoryDetailLoadingState?Center(child: const CircularProgressIndicator(color: Colors.blue,)):
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => PlaceOrderItemBlock(
                    productName: prodCubit.orderHistoryDetailModel!.data!.orderProducts![index].productName!,
                    productPrice:  prodCubit.orderHistoryDetailModel!.data!.orderProducts![index].productPriceAfterDiscount!,
                    productQuantity:  prodCubit.orderHistoryDetailModel!.data!.orderProducts![index].orderProductQuantity!,
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.grey,
                    thickness: 2,
                    endIndent: 10,
                    indent: 10,
                  ),
                  itemCount: prodCubit.orderHistoryDetailModel!.data!.orderProducts!.length)),
        ],
      ),
    );
  },
);
  }
}
