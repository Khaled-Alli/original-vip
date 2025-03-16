import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/core/networking/web_services.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeState>{
  WebServices webServices;
  HomeCubit(this.webServices) : super(HomeInitialState());




}