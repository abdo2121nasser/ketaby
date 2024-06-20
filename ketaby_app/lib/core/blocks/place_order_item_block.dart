import 'package:flutter/material.dart';

class PlaceOrderItemBlock extends StatelessWidget {
  final String productName;
  final num productPrice;
  final num productQuantity;
  final bool isOrderHistory;
  final String orderDate;
  PlaceOrderItemBlock(
      {required this.productName,
      required this.productPrice,
      required this.productQuantity,
      this.isOrderHistory=false,
        this.orderDate=''
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
      ),
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 30,
                width: 240,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                         productName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize:isOrderHistory? 18:25),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //   Spacer(),
                    Expanded(
                      child: Text(
                        productPrice.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(isOrderHistory? 'Date: ${orderDate}':
            'Quantity: ${productQuantity}'
            ,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          )
        ],
      ),
    );
  }
}
