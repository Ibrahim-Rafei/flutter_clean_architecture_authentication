import 'package:equatable/equatable.dart';

class FirstPageEntity extends Equatable {
  final bool isLoggedIn;
  final bool  isVerifyingEmail;

  const FirstPageEntity({ required this.isLoggedIn, required this.isVerifyingEmail});

  @override
  List<Object?> get props => [ isLoggedIn, isVerifyingEmail];
}
