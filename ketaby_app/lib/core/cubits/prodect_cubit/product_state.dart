part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class LoadingGetAllProductState extends ProductState {}
class SuccessGetAllProductState extends ProductState {}
class ErrorGetAllProductState extends ProductState {}
class LoadingSearchProductState extends ProductState {}
class SuccessSearchProductState extends ProductState {}
class ErrorSearchProductState extends ProductState {}
class LoadingGetAllProductCartState extends ProductState {}
class SuccessGetAllProductCartState extends ProductState {}
class ErrorGetAllProductCartState extends ProductState {}
class LoadingAddProductToCartState extends ProductState {}
class SuccessAddProductToCartState extends ProductState {}
class ErrorAddProductToCartState extends ProductState {}
class LoadingDeleteProductFromCartState extends ProductState {}
class SuccessDeleteProductFromCartState extends ProductState {}
class ErrorDeleteProductFromCartState extends ProductState {}
class LoadingIncrementProductCartQuantityState extends ProductState {}
class SuccessIncrementProductCartQuantityState extends ProductState {}
class ErrorIncrementProductCartQuantityState extends ProductState {}
class LoadingDecrementProductCartQuantityState extends ProductState {}
class SuccessDecrementProductCartQuantityState extends ProductState {}
class ErrorDecrementProductCartQuantityState extends ProductState {}
class LoadingGetBestSellerProductsState extends ProductState {}
class SuccessGetBestSellerProductsState extends ProductState {}
class ErrorGetBestSellerProductsState extends ProductState {}
class LoadingGetNewArrivalProductsState extends ProductState {}
class SuccessGetNewArrivalProductsState extends ProductState {}
class ErrorGetNewArrivalProductsState extends ProductState {}
class LoadingGetSliderDataState extends ProductState {}
class SuccessGetSliderDataState extends ProductState {}
class ErrorGetSliderDataState extends ProductState {}

class CheckOutLoadingState extends ProductState {}
class CheckOutSuccessState extends ProductState {}
class CheckOutErrorState extends ProductState {}

class GetAllGovernmentsLoadingState extends ProductState {}
class GetAllGovernmentsSuccessState extends ProductState {}
class GetAllGovernmentsErrorState extends ProductState {}

class PlaceOrderLoadingState extends ProductState {}
class PlaceOrderSuccessState extends ProductState {}
class PlaceOrderErrorState extends ProductState {}

class GetAllFavouritProductsLoadingState extends ProductState {}
class GetAllFavouritProductsSuccessState extends ProductState {}
class GetAllFavouritProductsErrorState extends ProductState {}

class AddFavouritProductsLoadingState extends ProductState {}
class AddFavouritProductsSuccessState extends ProductState {}
class AddFavouritProductsErrorState extends ProductState {}

class DeleteFavouritProductsLoadingState extends ProductState {}
class DeleteFavouritProductsSuccessState extends ProductState {}
class DeleteFavouritProductsErrorState extends ProductState {}

class GetAllOrderHistoryLoadingState extends ProductState {}
class GetAllOrderHistorySuccessState extends ProductState {}
class GetAllOrderHistoryErrorState extends ProductState {}

class GetAllOrderHistoryDetailLoadingState extends ProductState {}
class GetAllOrderHistoryDetailSuccessState extends ProductState {}
class GetAllOrderHistoryDetailErrorState extends ProductState {}

class InitializeModelsLoadingState extends ProductState {}
class InitializeModelsSuccessState extends ProductState {}
class InitializeModelsErrorState extends ProductState {}