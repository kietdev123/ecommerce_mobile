abstract class Strings {
  String get setting;

  Map<String, dynamic> toMap() {
    return {
      'setting': setting,
    };
  }
}
