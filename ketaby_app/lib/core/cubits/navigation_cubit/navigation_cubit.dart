import 'package:bloc/bloc.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../screens/navigationbar_main_screens/navigation_screens/books_screen.dart';
import '../../../screens/navigationbar_main_screens/navigation_screens/cart_screen.dart';
import '../../../screens/navigationbar_main_screens/navigation_screens/favourit_screen.dart';
import '../../../screens/navigationbar_main_screens/navigation_screens/home_screen.dart';
import '../../../screens/navigationbar_main_screens/navigation_screens/profile_screen.dart';
import '../prodect_cubit/product_cubit.dart';
import '../profile_cubit/profile_cubit.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  static NavigationCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    HomeScreen(),
    BooksScreen(),
    FavouritScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  int screenIndex = 0;
  late Widget currentScreen = screens[screenIndex];
  Future<void> changeScreenIndex(
      {required int screenIndex1, required context}) async {
    this.screenIndex = screenIndex1;
    currentScreen = screens[screenIndex];
    if (screenIndex == 4) {
      ProfileCubit.get(context).getProfileData();
      //  ProfileCubit().resetProfileControllers();
      // ProfileCubit().getProfileData();
      //print('mzdhvdbvkdv');
    }
    // if(screenIndex==1)
    //   {
    //     ProductCubit().getAllProductCart();
    //   }
    else if (screenIndex == 3) {
      await ProductCubit.get(context).getAllProductCart();
    } else if (screenIndex == 2) {
      await ProductCubit.get(context).getAllFavouritProducts();
    } else if (
    screenIndex == 0 &&
        (ProductCubit.get(context).sliderModel == null ||
            ProductCubit.get(context).newArrivalProduct == null ||
            ProductCubit.get(context).bestSellerProduct == null ||
            ProductCubit.get(context).allProductModel == null ||
            ProductCubit.get(context).favouritModel == null)
    ) {
      await  ProductCubit.get(context).initializeModels(context: context);
    }

    emit(ChangeScreenIndexState());
  }
}
