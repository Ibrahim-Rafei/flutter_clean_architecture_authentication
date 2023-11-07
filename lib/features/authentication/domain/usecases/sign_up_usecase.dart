import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:authentication/features/authentication/domain/entities/sign_up_entity.dart';
import '../../../../core/error/failures.dart';
import '../repositories/authentication_repository.dart';

class SignUpUseCase {
  final AuthenticationRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, UserCredential>> call(SignUpEntity signup) async {
    return await repository.signUp(signup);
  }
}
