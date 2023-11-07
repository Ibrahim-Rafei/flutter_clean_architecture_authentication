import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/exceptions.dart';
import '../models/sign_in_model.dart';
import '../models/sign_up_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> signUp(SignUpModel signUp);
  Future<UserCredential> signIn(SignInModel signIn);
  Future<Unit> verifyEmail();
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserCredential> signIn(SignInModel signIn) async {
    try {
      FirebaseAuth firebaseInstance = FirebaseAuth.instance;
     await  firebaseInstance.currentUser?.reload();
     return  await firebaseInstance.signInWithEmailAndPassword(
        email: signIn.email,
        password: signIn.password,
      );
    }  on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ExistedAccountException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      }else{
        throw ServerException();
      }
    }
  }

  @override
  Future<UserCredential> signUp(SignUpModel signUp) async {
    try {
      FirebaseAuth firebaseInstance = FirebaseAuth.instance;
      await  firebaseInstance.currentUser?.reload();
      return await firebaseInstance.createUserWithEmailAndPassword(
        email: signUp.email,
        password: signUp.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeekPassException();
      } else if (e.code == 'email-already-in-use') {
        throw ExistedAccountException();
      }else{
        throw ServerException();
      }
    }
  }

  @override
  Future<Unit> verifyEmail() async {

    final user = FirebaseAuth.instance.currentUser;
    if(user != null){
      try{
        await user.reload();
        await user.sendEmailVerification();
      }on FirebaseAuthException catch (e) {
        if (e.code == 'too-many-requests') {
          throw TooManyRequestsException();
        }else {
          throw ServerException();
        }
      }catch(e){
        throw ServerException();
      }
    }else{
      throw NoUserException();
    }
    return Future.value(unit);
  }

}
