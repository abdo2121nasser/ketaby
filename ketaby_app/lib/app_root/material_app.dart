



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/cubits/authentication_cubit/authentication_cubit.dart';
import '../core/cubits/navigation_cubit/navigation_cubit.dart';
import '../core/cubits/payment_cubit/payment_cubit.dart';
import '../core/cubits/prodect_cubit/product_cubit.dart';
import '../core/cubits/profile_cubit/profile_cubit.dart';
import '../screens/other_screens/splash_screen.dart';

class EcommerceApp extends StatelessWidget {
 // String? storage;

 // EcommerceApp({required this.storage});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProfileCubit()/*..getProfileData()*/,),
          BlocProvider(create: (context) => AuthenticationCubit(),),
          BlocProvider(create: (context) => ProductCubit()
          //..getAllProduct()
          //..getAllProductCart()
            ,),
          BlocProvider(create: (context) => NavigationCubit(),),
          BlocProvider(create: (context) => PaymentCubit())

    ],
        child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
          },
          builder: (context, state)  {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

             home: SplashScreen(),
             // home: OrderProductScreen()
             //home: storage!=null && storage!.isEmpty ? LoginScreen():NavigationBarMainScreen(),
             // home: LoginScreen(),
            //  home:  AuthenticationCubit.get(context).isThereIsStoredUser(storage: storage==null?'':storage!, context: context),
            );
          },
        ),
      ),
    );
  }
}
