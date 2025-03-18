
abstract class OrderState  {
}

class OrderInitialState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderDoneState extends OrderState {}

class OrderFailedState extends OrderState {
  final String errMsg;
   OrderFailedState(this.errMsg);
}
