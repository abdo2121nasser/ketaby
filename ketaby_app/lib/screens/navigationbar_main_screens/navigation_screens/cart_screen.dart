
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocks/cart_block.dart';
import '../../../core/blocks/check_out_block.dart';
import '../../../core/cubits/prodect_cubit/product_cubit.dart';
import '../../../core/cubits/profile_cubit/profile_cubit.dart';
import '../../other_screens/order_product_screen.dart';


class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var prodCubit=ProductCubit.get(context);
        return Container(
          child: Column(
            children: [
              prodCubit.productCartModel !=null?
              Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    itemBuilder: (context, index) => CartBlock(
                        item: prodCubit.productCartModel!.data!.cartItems![index],
                    deleteFunction: (){
                          prodCubit.deleteProductCart(itemId: prodCubit.productCartModel!.data!.cartItems![index].itemId!.toInt()!);
                    },
                    incrementQuantity: (){
                      prodCubit.incrementProductQuantity(itemId: prodCubit.productCartModel!.data!.cartItems![index].itemId!,
                      quantity: prodCubit.productCartModel!.data!.cartItems![index].itemQuantity!.toInt()!);
                    },
                    decrementQuantity: (){
                      prodCubit.decrementProductQuantity(itemId: prodCubit.productCartModel!.data!.cartItems![index].itemId!,
                          quantity: prodCubit.productCartModel!.data!.cartItems![index].itemQuantity!.toInt()!);
                    },),
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 10,),
                    itemCount: prodCubit.productCartModel!.data!.cartItems!.length!),
              ):
                  Center(child: CircularProgressIndicator(color: Colors.lightBlue,),),
              prodCubit.productCartModel!.data!.total ==null?SizedBox():
              CheckOutBlock(
                hint: 'Check out',
                totalPrice: prodCubit.productCartModel!.data!.total!,checkOutFunction:
                  () async {
                //await prodCubit.checkOut();
                    await ProfileCubit.get(context).setProfileControllers();
                    await prodCubit.getAllGovernments();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderProductScreen(),));
                },)
            ],
          ),
        );
      },
    );
  }
}
