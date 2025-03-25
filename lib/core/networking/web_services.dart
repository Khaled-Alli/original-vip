import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/core/networking/web_constants.dart';

import '../../feature/authentication/model/user_model.dart';

class WebServices {
  FirebaseFirestore firebaseFirestore;

  WebServices(this.firebaseFirestore);

  Future<Either<String, User>> getUser(String phone, String password) async {
    try {
      final snapshot = (await firebaseFirestore
          .collection(ServicesConstants.USERS_TEXT)
          .where(ServicesConstants.PHONE_FIELD_TEXT, isEqualTo: phone.trim())
          .where(ServicesConstants.PASSWORD_FIELD_TEXT, isEqualTo: password.trim())
          .get());
      if (snapshot.docs.isNotEmpty) {
        final userData = snapshot.docs.first.data();
        return Right(User.fromJson(userData as Map<String, dynamic>));
      } else {
        return const Left(AppConstants.userNotFoundText);
      }
    } catch (error) {
      print(error);
      return Left(AppConstants.ensureInternetConnection.toString());
    }
  }
  //
  // Future<String> createUser(User user) async {
  //   await firebaseFirestore
  //       .collection(ServicesConstants.USERS_TEXT)
  //       .doc(user.phone)
  //       .set(user.toJson())
  //       .then((_) {
  //     return AppConstants.userCreatedSuccessfullyText;
  //   }).catchError((error) {
  //     return "$error : ${AppConstants.errorWhileUserCreationText} ";
  //   });
  //   return AppConstants.emptyText;
  // }
}
