import 'package:ecommerce_mobile/res/strings/english_strings.dart';
import 'package:ecommerce_mobile/res/strings/vietnam_strings.dart';

mixin AppLocale {
  static const String setting = 'setting';
  static const String signUp = 'signUp';
  static const String password = 'password';
  static const String alreadyHaveAnAccount = 'alreadyHaveAnAccount';
  static const String pleaseEnterAEmail = 'pleaseEnterAEmail';
  static const String enterValidEmail = 'enterValidEmail';
  static const String orSignInWithSocialAccount = 'orSignInWithSocialAccount';
  static const String signIn = 'signIn';

  static Map<String, dynamic> EN = EnglishStrings().toMap();
  static Map<String, dynamic> VN = VietNamStrings().toMap();
}
