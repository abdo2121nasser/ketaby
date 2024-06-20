

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/blocks/place_order_item_block.dart';
import '../../core/cubits/prodect_cubit/product_cubit.dart';
import 'order_history_detail_screen.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var prodCubit = ProductCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: const Text(
              'order history',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              prodCubit.orderHistoryModel==null?Center(child: const CircularProgressIndicator(color: Colors.blue,)):
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          prodCubit.getOrderHistoryDetail(id: prodCubit.orderHistoryModel!.data!.orders![index].id!);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryDetailScreen(),));
                        },
                        child: PlaceOrderItemBlock(
                              productName: 'Order Code: ${prodCubit.orderHistoryModel!.data!.orders![index].orderCode}',
                              productPrice: num.parse(prodCubit.orderHistoryModel!.data!.orders![index].total!),
                              productQuantity: 1,
                              isOrderHistory: true,
                              orderDate: prodCubit.orderHistoryModel!.data!.orders![index].orderDate!,
                            ),
                      ),
                      separatorBuilder: (context, index) => const Divider(
                            color: Colors.grey,
                            thickness: 2,
                            endIndent: 10,
                            indent: 10,
                          ),
                      itemCount: 5)),
            ],
          ),
        );
      },
    );
  }
}
