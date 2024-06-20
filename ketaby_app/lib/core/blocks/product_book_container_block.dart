

import 'package:flutter/material.dart';

import '../models/book_model/all_product_model.dart';

class ProductBookContainerBlock extends StatelessWidget {
  final Products product;
  final VoidCallback addToCartFunction, addToFavouritFunction,deleteFromFavouritFunction;
  final bool isFavouritScreen,isProductInFavourit;
  ProductBookContainerBlock(
      {required this.product,
      required this.addToCartFunction,
        required this.addToFavouritFunction,
        required this.deleteFromFavouritFunction,
        required this.isProductInFavourit,
      this.isFavouritScreen = false,
      });

  @override
  Widget build(BuildContext context) {
    return product != null
        ? Container(
            height: 150,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade600, width: 1.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product.image!,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress != null) {
                                // While the image is loading, show a CircularProgressIndicator
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                );
                              } else {
                                // Once the image is loaded, show the image
                                return child;
                              }
                            },
                            width: 100,
                          )),
                    ),
                    Positioned(
                      top: 10,
                      left: 5,
                      child: Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          '${product.discount.toString()}%',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: SizedBox(
                          width: 170,
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  product.name!,
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: SizedBox(
                          width: 170,
                          height: 20,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  product.category!,
                                  style: TextStyle(
                                    color: Colors.black87.withOpacity(0.6),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: SizedBox(
                          width: 170,
                          height: 20,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  product.price.toString(),
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black87.withOpacity(0.2),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 170,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.priceAfterDiscount.toString(),
                                style: const TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed:isFavouritScreen || isProductInFavourit?deleteFromFavouritFunction: addToFavouritFunction,
                        icon: Icon(
                          isFavouritScreen || isProductInFavourit
                              ? Icons.favorite_outlined
                              : Icons.favorite_border,
                          size: 30,
                          color:isFavouritScreen || isProductInFavourit? Colors.blue : null,
                        ),
                      ),
                      IconButton(
                        onPressed: addToCartFunction,
                        icon:
                            const Icon(Icons.shopping_cart_outlined, size: 30),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        : const CircularProgressIndicator(
            color: Colors.blue,
          );
  }
}
