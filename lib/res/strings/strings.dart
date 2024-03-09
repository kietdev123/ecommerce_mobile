import 'package:ecommerce_mobile/res/app_locale.dart';

abstract class Strings {
  String get setting;
  String get signIn;
  String get password;

  Map<String, dynamic> toMap() {
    return {
      AppLocale.setting: setting,
      AppLocale.signUp: signIn,
      AppLocale.password: password,
    };
  }
}
