
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/core/networking/web_services.dart';
import 'package:original_vip/feature/home/model/laptop_model.dart';
import 'laptop_state.dart';

class LaptopCubit extends Cubit<LaptopState> {
  WebServices webServices;
   List<Laptop> laptop =[];

  LaptopCubit(this.webServices) : super(LaptopInitialState());

  Future<void> getLaptops() async {
    emit(LaptopLoadingState());
    var result = await webServices.getLaptops();
    result.fold((error) {
      emit(LaptopErrorState(error));
    }, (laptops) async{
      laptop = laptops;
      laptop.sort((a, b) => a.price.compareTo(b.price));
      emit(LaptopLoadedState(laptop));
    });
  }
}
