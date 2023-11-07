import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:authentication/features/authentication/domain/entities/first_page_entity.dart';
import 'package:authentication/features/authentication/domain/entities/sign_in_entity.dart';
import 'package:authentication/features/authentication/domain/entities/sign_up_entity.dart';
import 'package:authentication/features/authentication/domain/usecases/first_page_usecase.dart';
import 'package:authentication/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:authentication/features/authentication/domain/usecases/sign_in_usecase.dart';
import '../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/usecases/check_verification_usecase.dart';
import '../../../domain/usecases/sign_up_usecase.dart';
import '../../../domain/usecases/verifiy_email_usecase.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase ;
  final VerifyEmailUseCase verifyEmailUseCase;
  final FirstPageUseCase  firstPage;
  final CheckVerificationUseCase checkVerificationUseCase;
  final LogOutUseCase logOutUseCase;
  Completer<void> completer = Completer<void>();


  AuthBloc({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.firstPage,
    required this.verifyEmailUseCase,
    required this.checkVerificationUseCase,
    required this.logOutUseCase
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async{
      if (event is CheckLoggingInEvent) {
          final  theFirstPage = firstPage();
          if(theFirstPage.isLoggedIn){
            emit(SignedInPageState());
          }else if (theFirstPage.isVerifyingEmail){
            emit(VerifyEmailPageState());
          }
      } else if (event is SignInEvent) {
        emit(LoadingState());
        final failureOrUserCredential = await signInUseCase(event.signInEntity);
        emit(eitherToState(failureOrUserCredential ,SignedInState()));
      }else if (event is SignUpEvent) {
        emit(LoadingState());
        final failureOrUserCredential = await signUpUseCase(event.signUpEntity);
        emit(eitherToState(failureOrUserCredential ,SignedUpState()));
      }else if (event is SendEmailVerificationEvent) {
        final failureOrSentEmail = await verifyEmailUseCase();
        emit(eitherToState(failureOrSentEmail, EmailIsSentState()));
      }else if (event is CheckEmailVerificationEvent){
        if(!completer.isCompleted){
          completer.complete();
          completer = Completer<void>();
        }
        final failureOrEmailVerified = await checkVerificationUseCase(completer);
        emit(eitherToState(failureOrEmailVerified ,EmailIsVerifiedState()));
      }else if (event is LogOutEvent){
        final failureOrLogOut = await logOutUseCase();
        emit(eitherToState(failureOrLogOut ,LoggedOutState()));
      }
    });
  }

  AuthState eitherToState ( Either either , AuthState state){
    return either.fold(
          (failure) => ErrorAuthState(message: _mapFailureToMessage(failure)),
          (_) => state,
    );
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case WeekPassFailure:
        return WEEK_PASS_FAILURE_MESSAGE;
      case ExistedAccountFailure:
        return EXISTED_ACCOUNT_FAILURE_MESSAGE;
      case NoUserFailure:
        return NO_USER_FAILURE_MESSAGE;
      case TooManyRequestsFailure:
        return TOO_MANY_REQUESTS_FAILURE_MESSAGE;
      case WrongPasswordFailure:
        return WRONG_PASSWORD_FAILURE_MESSAGE;
      case UnmatchedPassFailure:
        return UNMATCHED_PASSWORD_FAILURE_MESSAGE;
      case NotLoggedInFailure:
        return '';
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
