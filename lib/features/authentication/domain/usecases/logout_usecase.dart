import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:authentication/features/authentication/domain/entities/sign_in_entity.dart';
import '../../../../core/error/failures.dart';
import '../repositories/authentication_repository.dart';

class LogOutUseCase {
  final AuthenticationRepository repository;

  LogOutUseCase(this.repository);

  Future<Either<Failure, Unit>> call() async {
    return await repository.logOut();
  }
}
