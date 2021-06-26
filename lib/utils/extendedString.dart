extension ExtendedString on String {
  String replaceParameters(Map<String, String> args) {
    String str = this;

    args.forEach((key, value) {
      str = str.replaceAll(new RegExp(r'\${' + key + '}'), value);
    });

    return str;
  }
}