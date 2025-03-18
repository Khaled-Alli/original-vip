import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/core/networking/web_services.dart';
import 'order_state.dart';


class OrderCubit extends Cubit<OrderState>{
  WebServices webServices;
  OrderCubit(this.webServices) : super(OrderInitialState());




}