part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class StripePaymentLoadingState extends PaymentState {}
class StripePaymentSuccessState extends PaymentState {}
class StripePaymentErrorState extends PaymentState {}

class SetTransactionState extends PaymentState {}

class PayPalPaymentLoadingState extends PaymentState {}
class PayPalPaymentSuccessState extends PaymentState {}
class PayPalPaymentErrorState extends PaymentState {}

