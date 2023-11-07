import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable {
  final String email;
  final String password;

  const SignInEntity({ required this.password, required this.email});

  @override
  List<Object?> get props => [ password, email];
}
