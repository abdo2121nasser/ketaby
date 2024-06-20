

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/blocks/product_book_container_block.dart';
import '../../../core/blocks/search_bar_block.dart';
import '../../../core/cubits/prodect_cubit/product_cubit.dart';


class BooksScreen extends StatelessWidget {

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
               Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10,bottom: 10),
                child:
                //state is! SuccessSearchProductState?
                prodCubit.searchController.text.isEmpty?
                SearchBarBlock(
                    controller: prodCubit.searchController,function: () async {await prodCubit.searchProduct();})
                    : SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Expanded(
                        child: SearchBarBlock(
                            controller: prodCubit.searchController,function: () async {await prodCubit.searchProduct();}),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: InkWell(
                          onTap: ()
                          {
                            prodCubit.searchController.clear();
                            prodCubit!.allProductModel=null;
                            prodCubit.getAllProduct();
                          },
                          child: const Text('Cancel',style: TextStyle(
                            decoration: TextDecoration.underline,
                              color: Colors.blue,fontSize: 20
                          ),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
        prodCubit.allProductModel!=null && state is !LoadingSearchProductState ?
              Expanded(
                child:
                ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    itemBuilder: (context,
                        index) =>  ProductBookContainerBlock(
                      product:prodCubit.allProductModel!.data!.products![index],
                        addToFavouritFunction: () async {
                   await prodCubit.addFavouritProduct(id: prodCubit.allProductModel!.data!.products![index].id!);
                        },
                        deleteFromFavouritFunction: () async {
                        await prodCubit.deleteFavouritProduct(id: prodCubit.allProductModel!.data!.products![index].id!);
                        },
                        addToCartFunction: (){
                                      prodCubit.addProductCart(id: prodCubit.allProductModel!.data!.products![index].id!);
                                    },
                    isProductInFavourit: prodCubit.isProductInFavourit(id: prodCubit.allProductModel!.data!.products![index].id!),
                    ),
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 10,),
                    itemCount: prodCubit!.allProductModel!.data!.products!.length)

              ):const Center(child: CircularProgressIndicator(color: Colors.blue,),),
            ],
          ),
        );
      },
    );
  }
}
