
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocks/product_slider_block.dart';
import '../../../core/blocks/slider_block.dart';
import '../../../core/cubits/navigation_cubit/navigation_cubit.dart';
import '../../../core/cubits/prodect_cubit/product_cubit.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationCubit, NavigationState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return BlocConsumer<ProductCubit, ProductState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var prodCubit=ProductCubit.get(context);
    var navCubit=NavigationCubit.get(context);
    return Container(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
          prodCubit.sliderModel!=null? SliderBlock():
            const CircularProgressIndicator(color: Colors.blue,),
          SizedBox(
            height: 310,
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Best Seller',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      IconButton(onPressed: (){
                        prodCubit.searchController.text='Best Seller';
                        prodCubit.searchProduct();
                        navCubit.changeScreenIndex(screenIndex1: 1,context: context);
                      }, icon: const Icon(Icons.arrow_forward,size: 30,))
                    ],
                  ),
                ),
                prodCubit.bestSellerProduct!=null?
                SizedBox(
                  height: 260,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ProductSliderBlock(product: prodCubit!.bestSellerProduct!.data!.products![index]),
                      separatorBuilder: (context, index) => const SizedBox(width: 0,),
                      itemCount: 5),
                ):const CircularProgressIndicator(color: Colors.lightBlue,),
              ],
            ),
          ),
            // SizedBox(
            //   height: 330,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(left: 10,),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text('Category',
            //               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            //             IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,size: 30,))
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         height: 280,
            //         child: ListView.separated(
            //             physics: BouncingScrollPhysics(),
            //             scrollDirection: Axis.horizontal,
            //             itemBuilder: (context, index) => ProductSliderBlock(),
            //             separatorBuilder: (context, index) => const SizedBox(width: 0,),
            //             itemCount: 5),
            //       ),
            //     ],
            //   ),
            // ),
            prodCubit.bestSellerProduct!=null?
            SizedBox(
              height: 315,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('New Arrivals',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        IconButton(onPressed: (){
                          prodCubit.searchController.text='New Arrivals';
                          prodCubit.searchProduct();
                          navCubit.changeScreenIndex(screenIndex1: 1,context: context);
                        }, icon: const Icon(Icons.arrow_forward,size: 30,))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 260,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ProductSliderBlock(product: prodCubit.newArrivalProduct!.data!.products![index]),
                        separatorBuilder: (context, index) => const SizedBox(width: 0,),
                        itemCount: 5),
                  ),
                ],
              ),
            ):
                const CircularProgressIndicator(color: Colors.blue,)
          ],
        ),
      ),
    );
  },
);
  },
);
  }
}
