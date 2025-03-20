
abstract class CartState  {
}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartDoneState extends CartState {}

class CartFailedState extends CartState {
  final String errMsg;
   CartFailedState(this.errMsg);
}
