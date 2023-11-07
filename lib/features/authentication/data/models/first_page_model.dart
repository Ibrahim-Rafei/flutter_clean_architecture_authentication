import 'package:authentication/features/authentication/domain/entities/first_page_entity.dart';

class FirstPageModel extends FirstPageEntity {
  const FirstPageModel({required bool isLoggedIn,required bool isVerifyingEmail})
      : super( isLoggedIn: isLoggedIn , isVerifyingEmail: isVerifyingEmail);
}
