
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/core/helpers/colors/colors.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/core/helpers/extentions/extentions.dart';
import 'package:original_vip/core/networking/web_services.dart';

import '../../user_profile/model/payment.dart';
import '../model/order_model.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  WebServices webServices;
List<Order>? orders;

  OrderCubit(this.webServices) : super(OrderInitialState());

  Future<void> getOrders(String dealerID) async {
    emit(OrderLoadingState());
    var result = await webServices.getOrders(dealerID);
    result.fold((error) {
      emit(OrderErrorState(error));
    }, (order) async{
       orders = order;
      orders?.sort((a, b) => b.date.toDateTime().compareTo(a.date.toDateTime()));
      emit(OrderLoadedState(orders as List<Order>));
    });
  }

  Future<void> createOrders(Order order) async {
    emit(OrderLoadingState());
    var result = await webServices.createOrder(order);
    result.fold((error) {
      emit(OrderErrorState(error));
    }, (right) async{
      emit(OrderLoadedState(orders as List<Order>));
    });
  }

  int getAvailableBalance (List<Order> orders, List<Payment> payments){
    int totalOrderAvailableBalance = orders.where((i)=>i.orderStatus == AppConstants.orderStatus_Delivered).fold(0, (previousValue, order) => (previousValue + order.commission));
    int totalPaymentAmount = payments.fold(0, (previousValue, payment) => (previousValue + payment.amount));
    int availableBalance = totalOrderAvailableBalance - totalPaymentAmount;
    return availableBalance < 0 ? 0 : availableBalance;
  }

  int getPendingBalance (List<Order> orders, List<Payment> payments){
    int totalOrderAvailableBalance = orders.where((i)=>i.orderStatus == AppConstants.orderStatus_InProgress).fold(0, (previousValue, order) => (previousValue + order.commission));
    int totalPaymentAmount = payments.fold(0, (previousValue, payment) => (previousValue + payment.amount));
    int pendingBalance = totalOrderAvailableBalance - totalPaymentAmount;
    return pendingBalance < 0 ? 0 : pendingBalance;
  }

}
