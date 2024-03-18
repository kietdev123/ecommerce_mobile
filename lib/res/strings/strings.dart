import 'package:ecommerce_mobile/res/app_locale.dart';

abstract class Strings {
  String get setting;
  String get signIn;
  String get password;
  String get alreadyHaveAnAccount;
  String get pleaseEnterAEmail;
  String get enterValidEmail;
  String get orSignInWithSocialAccount;

  Map<String, dynamic> toMap() {
    return {
      AppLocale.setting: setting,
      AppLocale.signUp: signIn,
      AppLocale.password: password,
      AppLocale.alreadyHaveAnAccount: alreadyHaveAnAccount,
      AppLocale.pleaseEnterAEmail: pleaseEnterAEmail,
      AppLocale.enterValidEmail: enterValidEmail,
      AppLocale.orSignInWithSocialAccount: orSignInWithSocialAccount,
    };
  }
}
