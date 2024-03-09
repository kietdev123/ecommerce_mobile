import 'package:ecommerce_mobile/res/strings/english_strings.dart';
import 'package:ecommerce_mobile/res/strings/vietnam_strings.dart';

mixin AppLocale {
  static const String setting = 'setting';

  static Map<String, dynamic> EN = EnglishStrings().toMap();
  static Map<String, dynamic> VN = VietNamStrings().toMap();
}
