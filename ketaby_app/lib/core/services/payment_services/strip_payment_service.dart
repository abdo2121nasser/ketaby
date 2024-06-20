import 'package:dio/dio.dart';
import '../../constants/apis_keys_constants.dart';
import '../../models/payment_models/stripe_models/payment_intent_input_model.dart';
import '../../models/payment_models/stripe_models/payment_intent_model.dart';
import '../dio_helper_services/stripe_dio_service.dart';

class StripePaymentService
{

 static Future<PaymentIntentModel> createPaymentIntent({required PaymentIntentInputModel paymentIntentInputModel})
  async {
        Response response=await  StripeDioHelper.postData(
            url: 'payment_intents',
            data:paymentIntentInputModel.toJson(),
            token: ApiKeysConst.stribeSecretKey,
          contentType: Headers.formUrlEncodedContentType

        );
       return await  PaymentIntentModel.fromJson(response.data);
  }

 // static initPaymentSheet({required String setupIntentClintSecret})
 //  async {
 //   await Stripe.instance.initPaymentSheet(
 //       paymentSheetParameters: SetupPaymentSheetParameters(
 //         paymentIntentClientSecret: setupIntentClintSecret,
 //      merchantDisplayName: 'Abdo'
 //    ));
 //  }
 // static  displayPaymentSheet()
 //  async {
 //   await Stripe.instance.presentPaymentSheet();
 //  }


 // static makePayment({required PaymentIntentInputModel paymentIntentInputModel})
 //  async {
 //    PaymentIntentModel paymentIntentModel= await  createPaymentIntent(paymentIntentInputModel: paymentIntentInputModel);
 //    await initPaymentSheet(setupIntentClintSecret: paymentIntentModel.clientSecret);
 //     await displayPaymentSheet();
 //  }


}