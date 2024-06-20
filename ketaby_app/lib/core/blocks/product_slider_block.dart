
import 'package:flutter/material.dart';

import '../models/book_model/all_product_model.dart';


class ProductSliderBlock extends StatelessWidget {
final Products product;

  const ProductSliderBlock({ required this.product});
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 150,
        //  width: 100,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(product.image!,
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
                    )),
              ),
              Positioned(
                top: 10,
                left: 5,
                child: Container(
                  alignment: Alignment.center,
                  width: 45,height: 35,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('${product.discount}%',
                    style: const TextStyle(
                        color: Colors.white,fontSize: 15
                    ),),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 100,
         height: 50,
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(product.name!,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(product.category!,
                    style: TextStyle(fontSize: 15,color: Colors.grey.shade600),),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 130,
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(product.price.toString(),
                    style: TextStyle(fontSize: 13,color: Colors.grey.shade400,decoration: TextDecoration.lineThrough),),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 130,
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(product.priceAfterDiscount.toString(),
                    style: TextStyle(fontSize: 13,color: Colors.lightBlueAccent,),),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
