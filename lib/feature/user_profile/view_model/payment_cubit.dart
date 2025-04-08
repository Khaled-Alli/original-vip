
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/core/helpers/extentions/extentions.dart';
import 'package:original_vip/core/networking/web_services.dart';
import 'package:original_vip/feature/user_profile/view_model/payment_state.dart';

import '../model/payment.dart';

class PaymentCubit extends Cubit<PaymentState> {
  WebServices webServices;
  List<Payment>? payments ;

  PaymentCubit(this.webServices) : super(PaymentInitialState());

  Future<void> getPayments(String dealerID) async {
    emit(PaymentLoadingState());
    var result = await webServices.getPayments(dealerID);
    result.fold((error) {
      emit(PaymentErrorState(error));
    }, (payment) async{
       payments = payment;
      payments?.sort((a, b) => b.date.toDateTime().compareTo(a.date.toDateTime()));
      emit(PaymentLoadedState(payments as List<Payment>));
    });
  }
}
