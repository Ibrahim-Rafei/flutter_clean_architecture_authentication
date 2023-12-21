import 'dart:async';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/authentication_repository.dart';

class CheckVerificationUseCase {
  final AuthenticationRepository repository;
  CheckVerificationUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Completer completer){
    return  repository.checkEmailVerification(completer);
  }
}
