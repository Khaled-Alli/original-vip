
import '../model/order_model.dart';

abstract class OrderState  {
}

class OrderInitialState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderLoadedState extends OrderState {
  List<Order> orders;
  OrderLoadedState(this.orders);
}

class OrderErrorState extends OrderState {
  final String errorMessage;
  OrderErrorState(this.errorMessage);
}
