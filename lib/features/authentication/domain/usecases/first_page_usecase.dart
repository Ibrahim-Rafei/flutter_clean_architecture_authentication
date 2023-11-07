import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/first_page_entity.dart';
import '../repositories/authentication_repository.dart';

class FirstPageUseCase {
  final AuthenticationRepository repository;

  FirstPageUseCase(this.repository);

  FirstPageEntity call(){
    return  repository.firstPage();
  }
}
