import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'app_root/material_app.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'core/constants/apis_keys_constants.dart';
import 'core/services/dio_helper_services/dio_helper_service.dart';
import 'core/services/dio_helper_services/stripe_dio_service.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  ECommerceDioHelper.init();
  StripeDioHelper.init();

 // Stripe.publishableKey = ApiKeysConst.stribePublishKey;



  runApp(EcommerceApp());
}
