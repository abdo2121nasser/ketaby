

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/book_model/all_product_model.dart';
import '../../models/product_model/favourit_model.dart';
import '../../models/product_model/order_history_detail_model.dart';
import '../../models/product_model/order_history_model.dart';
import '../../models/product_model/order_model.dart';
import '../../models/product_model/product_cart_model.dart';
import '../../models/product_model/slider_model.dart';
import '../../services/dio_helper_services/dio_helper_service.dart';
import '../profile_cubit/profile_cubit.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context)=>BlocProvider.of(context);
  TextEditingController searchController=TextEditingController();
  AllProductModel? allProductModel;
  ProductCartModel? productCartModel;
  AllProductModel? bestSellerProduct;
  AllProductModel? newArrivalProduct;
  OrderModel? orderModel;
  OrderHistoryModel? orderHistoryModel;
  OrderHistoryDetailModel? orderHistoryDetailModel;
  FavouritModel? favouritModel;
  SliderModel? sliderModel;
  List<String> govenments=[];
  String? currentGovenment='';
  // WidgetsFlutterBinding.ensureInitialized();
  // FlutterSecureStorage storage = const FlutterSecureStorage();
  // String? token = await storage.read(key: 'token').catchError((error){print(error);});
  getAllProduct()
  async {
    try
      {
        emit(LoadingGetAllProductState());
     var value=await ECommerceDioHelper.getData(url: 'products');
        allProductModel = await AllProductModel.fromJson(value.data);
        emit(SuccessGetAllProductState());
      }catch(error)
    {
      emit(ErrorGetAllProductState());
      print(error);
    }
  }
  searchProduct()
  async {
    if(searchController.text=='Best Seller')
    {
      allProductModel=bestSellerProduct;
      return;
    }
    else if(searchController.text=='New Arrivals')
      {
        allProductModel=newArrivalProduct;
        return;
      }
    try
        {
          emit(LoadingSearchProductState());
         var value=await ECommerceDioHelper.getData(url: 'products-search',
              query: {
                'name':searchController.text
              });
          allProductModel = await AllProductModel.fromJson(value.data);
          emit(SuccessSearchProductState());
        }
        catch(error)
    {
      emit(ErrorSearchProductState());
      print(error);
    }
  }
  getAllProductCart()
  async {
    try
        {
          WidgetsFlutterBinding.ensureInitialized();
          FlutterSecureStorage storage = const FlutterSecureStorage();
          emit(LoadingGetAllProductCartState());
          String? token = await storage.read(key: 'token').catchError((error){print(error);});
         var value=await ECommerceDioHelper.getData(url: 'cart',
              token: token);
          productCartModel=await  ProductCartModel.fromJson(value.data);
          emit(SuccessGetAllProductCartState());
        }catch(error)
    {
      emit(ErrorGetAllProductCartState());
      print(error);
    }
  }
  addProductCart({required int id})
  async {
    try
        {
          print(id);
          WidgetsFlutterBinding.ensureInitialized();
          FlutterSecureStorage storage = const FlutterSecureStorage();
          emit(LoadingAddProductToCartState());
          String? token = await storage.read(key: 'token').catchError((error){print(error);});
        var value=await  ECommerceDioHelper.postData(url: 'add-to-cart',
              data: {
                'product_id':id,
              },
              token: token);
          productCartModel=await  ProductCartModel.fromJson(value.data);
          emit(SuccessAddProductToCartState());
        }
        catch(error)
    {
      emit(ErrorAddProductToCartState());
      print(error);
    }
  }

  deleteProductCart({required int itemId})
  async {
    try
        {
          WidgetsFlutterBinding.ensureInitialized();
          FlutterSecureStorage storage = const FlutterSecureStorage();
          emit(LoadingDeleteProductFromCartState());
          String? token = await storage.read(key: 'token').catchError((error){print(error);});
        var value=await  ECommerceDioHelper.postData(url: 'remove-from-cart',
              data: {
                'cart_item_id':itemId
              },
              token: token);
          await getAllProductCart();
          emit(SuccessDeleteProductFromCartState());
        }
        catch(error)
    {
      emit(ErrorDeleteProductFromCartState());
      print(error);
    }




  }

  incrementProductQuantity({required itemId,required int quantity})
  async {
    try
        {
          WidgetsFlutterBinding.ensureInitialized();
          FlutterSecureStorage storage = const FlutterSecureStorage();
      print(itemId);
          String? token = await storage.read(key: 'token').catchError((error){print(error);});
          emit(LoadingIncrementProductCartQuantityState());
       var value=await   ECommerceDioHelper.postData(url: 'update-cart',
              data: {
                'cart_item_id':itemId,
                'quantity':++quantity
              },
              token: token);
          await getAllProductCart();
          emit(SuccessIncrementProductCartQuantityState());
        }catch(error)
    {
      emit(ErrorIncrementProductCartQuantityState());
      print(error);
    }
}

  decrementProductQuantity({required itemId,required int quantity})
  async {
    if(quantity==1) return;
    try
        {
          WidgetsFlutterBinding.ensureInitialized();
          FlutterSecureStorage storage = const FlutterSecureStorage();
          emit(LoadingDecrementProductCartQuantityState());
          String? token = await storage.read(key: 'token').catchError((error){print(error);});
          ECommerceDioHelper.postData(url: 'update-cart',
              data: {
                'cart_item_id':itemId,
                'quantity':--quantity
              },
              token: token);
          await getAllProductCart();
          emit(SuccessDecrementProductCartQuantityState());
        }catch(error)
    {
      emit(ErrorDecrementProductCartQuantityState());
      print(error);
    }
  }

  getBestSellerProducts()
  async {
    try
       {
      var value=   await ECommerceDioHelper.getData(url: 'products-bestseller');

           bestSellerProduct=await AllProductModel.fromJson(value.data);
         bestSellerProduct=await AllProductModel.fromJson(value.data);
       }catch(error)
    {
      print(error);
    }
  }
  getNewArrivalProducts()
  async {
    try
        {
          emit(LoadingGetNewArrivalProductsState());
        var value= await ECommerceDioHelper.getData(url: 'products-new-arrivals');
            newArrivalProduct=await AllProductModel.fromJson(value.data);
            emit(SuccessGetNewArrivalProductsState());
    newArrivalProduct=await AllProductModel.fromJson(value.data);
    emit(SuccessGetNewArrivalProductsState());
        }
        catch(error)
    {
      emit(ErrorGetNewArrivalProductsState());
      print(error);
    }
  }
  
  getSliderData()
  async {
    emit(LoadingGetSliderDataState());
    await ECommerceDioHelper.getData(url: 'sliders')
        .then((value) async {
  sliderModel= await SliderModel.fromJson(value.data);
  emit(SuccessGetBestSellerProductsState());
    })
        .catchError((error){
          emit(ErrorGetSliderDataState());
          print(error);
    });
  }

  checkOut()
  async {
     try
         {
           WidgetsFlutterBinding.ensureInitialized();
           FlutterSecureStorage storage = const FlutterSecureStorage();
           String? token = await storage.read(key: 'token').catchError((error){print(error);});
           emit(CheckOutLoadingState());
           var value=await ECommerceDioHelper.getData(url: 'checkout',token:token);
           orderModel=await OrderModel.fromJson(value.data);
           emit(CheckOutSuccessState());
         }
         catch(error)
    {
     print(error);
     emit(CheckOutErrorState());
    }
  }

  getAllGovernments()
  async {
    emit(GetAllGovernmentsLoadingState());
    try{
      govenments.clear();
      var value= await ECommerceDioHelper.getData(url: 'governorates');
      for(int i=0;i<27;i++)
        {
          govenments.add(value.data['data'][i]['governorate_name_en']);
        }
       emit(GetAllGovernmentsSuccessState());
    }catch(error)
    {
      emit(GetAllGovernmentsErrorState());
print(error);
    }
  }
  placeOrder({required context})
  async {

    var profCubit=ProfileCubit.get(context);
    emit(PlaceOrderLoadingState());
    try
        {
          if(currentGovenment!.isEmpty)
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('you need to select city')));
              return;
            }

          WidgetsFlutterBinding.ensureInitialized();
          FlutterSecureStorage storage = const FlutterSecureStorage();
          String? token = await storage.read(key: 'token').catchError((error){print(error);});
          int govenmentIndex=0;
          for(int i=0;i<27;i++)
            {
              if(currentGovenment==govenments[i])
                {
                  govenmentIndex=i+1;
                  break;
                }
            }
            var value= await ECommerceDioHelper.postData(url: 'place-order',
              data:{
                'name':profCubit.nameController.text,
                'governorate_id':govenmentIndex,
                'phone':profCubit.phoneController.text,
                'address':profCubit.addressController.text,
                'email':profCubit.emailController.text
              },token: token
          );
          currentGovenment='';
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Payment Success')));
          emit(PlaceOrderSuccessState());

        }catch(error)
    {
      currentGovenment='';
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('something went wrong')));
      emit(PlaceOrderErrorState());
      print(error);
    }
  }

  getAllFavouritProducts()
  async {
    emit(GetAllFavouritProductsLoadingState());
    try
        {
          WidgetsFlutterBinding.ensureInitialized();
          FlutterSecureStorage storage = const FlutterSecureStorage();
          String? token = await storage.read(key: 'token').catchError((error){print(error);});
          var value= await ECommerceDioHelper.getData(url: 'wishlist',token: token);
          favouritModel=await FavouritModel.fromJson(json: value.data);
          emit(GetAllFavouritProductsSuccessState());
        }catch(error)
    {
      emit(GetAllFavouritProductsErrorState());
      print(error);
    }
  }

  addFavouritProduct({required int id})
  async {
    try
    {
      emit(AddFavouritProductsLoadingState());
      WidgetsFlutterBinding.ensureInitialized();
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String? token = await storage.read(key: 'token').catchError((error){print(error);});
      var value = await ECommerceDioHelper.postData(url: 'add-to-wishlist',
          data: {
            'product_id':id,
          },
          token: token);
      await getAllFavouritProducts();
      emit(AddFavouritProductsSuccessState());

    }
    catch(error)
    {
      emit(AddFavouritProductsErrorState());
      print(error);

    }
  }
  deleteFavouritProduct({required int id})
  async {
    try
    {
      emit(DeleteFavouritProductsLoadingState());
      WidgetsFlutterBinding.ensureInitialized();
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String? token = await storage.read(key: 'token').catchError((error){print(error);});
      var value = await ECommerceDioHelper.postData(url: 'remove-from-wishlist',
          data: {
            'product_id':id,
          },
          token: token);
      await getAllFavouritProducts();
      emit(DeleteFavouritProductsSuccessState());

    }
    catch(error)
    {
      emit(DeleteFavouritProductsErrorState());
      print(error);

    }
  }

  bool isProductInFavourit({required int id})
  {
    if(favouritModel==null) return false;

    for(int i=0;i<favouritModel!.total!;i++)
      {
        if(favouritModel!.data![i]!.id! == id)
          {
            return true;
          }
      }
    return false;
  }

  getAllOrderHistory()
  async {
    emit(GetAllOrderHistoryLoadingState());
    try
        {
          WidgetsFlutterBinding.ensureInitialized();
          FlutterSecureStorage storage = const FlutterSecureStorage();
          String? token = await storage.read(key: 'token').catchError((error){print(error);});
          var value= await ECommerceDioHelper.getData(url: 'order-history',token: token);
           orderHistoryModel= await OrderHistoryModel.fromJson(value.data);
          emit(GetAllOrderHistorySuccessState());
        }catch (error)
    {
      emit(GetAllOrderHistoryErrorState());
      print(error);
    }
  }

  getOrderHistoryDetail({required int id})
  async {
    emit(GetAllOrderHistoryDetailLoadingState());
    try
        {
          WidgetsFlutterBinding.ensureInitialized();
          FlutterSecureStorage storage = const FlutterSecureStorage();
          String? token = await storage.read(key: 'token').catchError((error){print(error);});
          var value= await ECommerceDioHelper.getData(url: 'order-history/$id',token: token);
          orderHistoryDetailModel=await OrderHistoryDetailModel.fromJson(value.data);
          emit(GetAllOrderHistoryDetailSuccessState());
        }catch(error)
    {
      emit(GetAllOrderHistoryDetailErrorState());
   print(error);
    }


  }

  initializeModels({required context})
  async {

    try{
      emit(InitializeModelsLoadingState());
       ProductCubit.get(context).getSliderData();
       ProductCubit.get(context).getBestSellerProducts();
       ProductCubit.get(context).getAllProduct();
       ProductCubit.get(context).getAllFavouritProducts();
       ProductCubit.get(context).getNewArrivalProducts();

      emit(InitializeModelsSuccessState());
    }
    catch(error)
    {
      emit(InitializeModelsErrorState());
      print(error);
    }



  }
  
  
  
}
