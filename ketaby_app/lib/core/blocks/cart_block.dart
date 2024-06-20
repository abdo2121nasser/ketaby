import 'package:flutter/material.dart';

import '../models/product_model/product_cart_model.dart';



class CartBlock extends StatelessWidget {
  final CartItems item;
  final VoidCallback deleteFunction,incrementQuantity,decrementQuantity;
   CartBlock({required this.item,required this.deleteFunction,
     required this.incrementQuantity, required this.decrementQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade600,width: 1.5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(item.itemProductImage!,width: 100,
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
                    },)),
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
                 child: Text('${item.itemProductDiscount.toString()}%',
                 style: const TextStyle(
                   color: Colors.white,fontSize: 15
                 ),),
               ),
             )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item.itemProductName!,
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

                      Container(
                        alignment: Alignment.center,
                        width: 110,height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400,
                              width: 2),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(onPressed: incrementQuantity, icon: Icon(Icons.add,color: Colors.black87,size: 20,)),
                             Text(item.itemQuantity.toString(),
                              style: TextStyle(color: Colors.black87,fontSize: 17),),
                            IconButton(onPressed:decrementQuantity, icon: Icon(Icons.remove,color: Colors.grey,size: 20,))

                          ],
                        ),
                      ),

                    ],
                  ),
                  // data column

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(onPressed: deleteFunction,
                    icon: const Icon(Icons.delete,color: Colors.red,)),
                SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("${item.itemProductPrice.toString()} L.E",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,decoration: TextDecoration.lineThrough
                                ),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 60,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("${item.itemProductPriceAfterDiscount.toString()} L.E",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.lightBlueAccent
                                ),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}

