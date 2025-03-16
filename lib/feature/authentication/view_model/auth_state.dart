
import 'package:original_vip/feature/authentication/model/user_model.dart';

abstract class AuthState  {
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthDoneState extends AuthState {
User user ;
AuthDoneState(this.user);
}

class AuthFailedState extends AuthState {
  final String errMsg;

   AuthFailedState(this.errMsg);
}
