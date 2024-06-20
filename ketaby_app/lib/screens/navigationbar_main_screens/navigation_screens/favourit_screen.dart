
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocks/product_book_container_block.dart';
import '../../../core/cubits/prodect_cubit/product_cubit.dart';
import '../../../core/models/book_model/all_product_model.dart';


class FavouritScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var prodCubit=ProductCubit.get(context);
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              prodCubit.favouritModel == null || state is GetAllFavouritProductsLoadingState? const Center(child: CircularProgressIndicator(color: Colors.blue,)):
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => ProductBookContainerBlock(
                        product: Products.fromFavourits(favouritModel: prodCubit.favouritModel!, index: index),
                        addToFavouritFunction: (){},
                        deleteFromFavouritFunction: () async {
                        await  prodCubit.deleteFavouritProduct(id: prodCubit.favouritModel!.data![index].id!);
                        },
                        addToCartFunction: () {
                          prodCubit.addProductCart(id: prodCubit.favouritModel!.data![index].id!);
                        },
                        isFavouritScreen: true,
                        isProductInFavourit: true,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(height: 10,),
                      itemCount: prodCubit.favouritModel!.total!)
              )
            ],
          ),
        );
      },
    );
  }
}
