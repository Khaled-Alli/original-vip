
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/core/networking/web_constants.dart';

import '../../feature/authentication/model/user_model.dart';

class WebServices{
  FirebaseFirestore firebaseFirestore;
  WebServices(this.firebaseFirestore);

  Future<Either<String,User>> getUser(String phone)async{
  try{
    DocumentSnapshot userDoc = await firebaseFirestore.collection(ServicesConstants.USERS_TEXT).doc(phone).get();
    if (userDoc.exists) {
      return Right(User.fromJson(userDoc.data() as Map<String, dynamic>) ) ;
    } else {
      return Left(AppConstants.userNotFoundText);
    }
  }catch(error){
    return Left(error.toString());
  }
  }

  Future<String> createUser(User user)async{
   await firebaseFirestore.collection(ServicesConstants.USERS_TEXT).doc(user.phone).set(user.toJson()).then((_) {
     return AppConstants.userCreatedSuccessfullyText;
   }).catchError((error) {
     return "$error : ${AppConstants.errorWhileUserCreationText} ";
   });
   return AppConstants.emptyText;
 }

}