import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/core/helpers/extentions/extentions.dart';
import 'package:original_vip/core/networking/web_services.dart';
import 'package:original_vip/feature/cart/model/cart_item_model.dart';
import 'package:original_vip/feature/cart/view_model/cart_cubit.dart';
import 'package:original_vip/feature/home/model/additional_model.dart';
import '../../../core/helpers/colors/colors.dart';
import '../../../core/helpers/constants/constants.dart';
import '../../../core/helpers/themes/themes.dart';
import '../../../demo-data.dart';
import '../model/laptop_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  WebServices webServices;


  HomeCubit(this.webServices) : super(HomeInitialState());

}
