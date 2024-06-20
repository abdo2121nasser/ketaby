class PaymentIntentInputModel
{
  final String amount;
  final String currency;

  PaymentIntentInputModel({required this.amount,required this.currency});

  toJson()
  {
   //print((double.parse(amount)*100).ceil.toString());
    //print('---------------------');
  //  print((int.parse(amount)*100).ceil.toString());
    return {
      'amount':   ((double.parse(amount)*100).toInt()).toString(),
      'currency':currency
    };
  }
}