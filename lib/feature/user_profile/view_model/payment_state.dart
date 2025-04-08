

import '../model/payment.dart';

abstract class PaymentState  {
}

class PaymentInitialState extends PaymentState {}

class PaymentLoadingState extends PaymentState {}

class PaymentLoadedState extends PaymentState {
  List<Payment> payment;
  PaymentLoadedState(this.payment);
}

class PaymentErrorState extends PaymentState {
  final String errorMessage;
  PaymentErrorState(this.errorMessage);
}
