

import 'package:flutter/material.dart';

import '../../core/cubits/authentication_cubit/authentication_cubit.dart';
import '../../core/cubits/prodect_cubit/product_cubit.dart';
import '../authentication_screens/login_screen.dart';
import '../navigationbar_main_screens/navigationbar_main_screen.dart';



class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0))
        .then((value) async {



        if( await AuthenticationCubit.get(context).isThereIsStoredUser(context:context))
          {
            await ProductCubit.get(context).getSliderData();
            await ProductCubit.get(context).getNewArrivalProducts();
            await ProductCubit.get(context).getBestSellerProducts();
            await ProductCubit.get(context).getAllProduct();
            await ProductCubit.get(context).getAllFavouritProducts();
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  NavigationBarMainScreen(),));
          }
        else
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
          }


    })
        .catchError((error){
          print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/core/assets/ketaby.png',
              width: 300, height: 300,),
            const CircularProgressIndicator(color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}
