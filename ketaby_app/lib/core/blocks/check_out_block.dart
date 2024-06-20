import 'package:flutter/material.dart';

import 'general_button_block.dart';



class CheckOutBlock extends StatelessWidget {
  final String totalPrice,hint;
  final VoidCallback checkOutFunction;
  final int buttonWidth;
  final bool isPayPalProcess;

  CheckOutBlock({required this.totalPrice,required this.checkOutFunction,
    required this.hint,this.buttonWidth=117,
  this.isPayPalProcess=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10,),
          SizedBox(
            width: 200,
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: Text('total price: ${totalPrice} L.E',
                  style: TextStyle(fontSize: 18,color: Colors.white),),
                ),
              ],
            ),
          ),
          GeneralButtonBlock(
              lable: hint,
              labelFontSize: 15,
              function:checkOutFunction,
              width: buttonWidth.toDouble(), hight:45,
              textColor: Colors.blue, backgroundColor: Colors.white,
              borderRadius: 30,
          isPayPalProcess: isPayPalProcess,
          ),
          SizedBox(width: 10,)
        ],
      ),

    );
  }
}
