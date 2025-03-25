import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:original_vip/core/di/sl.dart';
import 'package:original_vip/core/helpers/colors/colors.dart';
import 'package:original_vip/core/helpers/extentions/extentions.dart';
import 'package:original_vip/core/networking/local_cervices.dart';
import 'package:original_vip/core/routing/routing.dart';
import 'package:original_vip/feature/authentication/presentation/widgets/app_Button.dart';
import 'package:original_vip/feature/authentication/presentation/widgets/app_text_form_field.dart';
import 'package:original_vip/feature/authentication/view_model/auth_cubit.dart';

import '../../../core/helpers/constants/constants.dart';
import '../view_model/auth_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailedState) {
          Fluttertoast.showToast(
            msg: state.errMsg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else if (state is AuthDoneState) {
          Fluttertoast.showToast(
            msg: AppConstants.loginSuccessfullyText,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          context.pushReplacementNamed(Routes.homeScreen);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.w, 100.h, 30.w, 30.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  AppConstants.appLogoImagePath,
                  width: 200.w,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Form(
                  key: context.read<AuthCubit>().formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        textFormController:
                            context.read<AuthCubit>().phoneController,
                        prefixIcon: const Icon(
                          Icons.phone_android_outlined,
                          color: AppColors.whiteColor,
                        ),
                        hintText: AppConstants.enterPhoneText,
                        keyboardType: TextInputType.number,
                        validator: context.read<AuthCubit>().phoneValidator,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      AppTextFormField(
                        textFormController:
                            context.read<AuthCubit>().passwordController,
                        prefixIcon: const Icon(
                          Icons.remove_red_eye,
                          color: AppColors.whiteColor,
                        ),
                        hintText: AppConstants.enterPasswordText,
                        keyboardType: TextInputType.text,
                        validator: context.read<AuthCubit>().passwordValidator,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      AppTextButton(
                        buttonText: AppConstants.loginText,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: AppColors.appWhiteColor,
                          fontSize: 16.sp,
                        ),
                        onPressed: () async {
                          HapticFeedback.lightImpact();
                          await validateThenDoLogin(context);
                          // var c =
                          // await getIt<LocalServices>().getData(
                          //   boxName: "user",
                          //   key: "user",
                          // );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> validateThenDoLogin(BuildContext context) async {
    if (context.read<AuthCubit>().formKey.currentState!.validate()) {
      await context.read<AuthCubit>().login();
    }
  }
}
