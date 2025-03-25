import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/core/di/sl.dart';
import 'package:original_vip/core/networking/web_constants.dart';
import 'package:original_vip/core/networking/web_services.dart';
import 'package:original_vip/feature/authentication/view_model/auth_state.dart';
import '../../../core/helpers/constants/constants.dart';
import '../../../core/networking/local_cervices.dart';
import '../model/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  WebServices webServices;
  LocalServices localServices;
  AuthCubit(this.webServices,this.localServices) : super(AuthInitialState());
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late User user ;

  Future<void> login() async {
    emit(AuthLoadingState());
    var result = await webServices.getUser(phoneController.text.trim(),passwordController.text.trim());
    result.fold((error) {
      emit(AuthFailedState(error));
    }, (user) async{
      this.user = user;
      await localServices.saveUser(user);
      emit(AuthDoneState(user));
    });
  }

  phoneValidator(value) {
    if (value == null || value.isEmpty || value.toString().length < 11) {
      return AppConstants.enterValidPhoneText;
    }
  }

  passwordValidator(value) {
    if (value == null || value.isEmpty || value.toString().length < 8) {
      return AppConstants.enterValidPasswordText;
    }
  }
}
