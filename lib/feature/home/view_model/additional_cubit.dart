
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/core/networking/web_services.dart';
import '../model/additional_model.dart';
import 'additional_state.dart';

class AdditionalCubit extends Cubit<AdditionalState> {
  WebServices webServices;


  AdditionalCubit(this.webServices) : super(AdditionalInitialState());

  Future<void> getAdditionals() async {
    emit(AdditionalLoadingState());
    var result = await webServices.getAdditionals();
    result.fold((error) {
      emit(AdditionalErrorState(error));
    }, (additional) async{
      emit(AdditionalLoadedState(additional as List<Additional>));
    });
  }
}
