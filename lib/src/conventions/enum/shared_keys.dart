enum SharedKeys {
  appTheme("app_theme", String);

  const SharedKeys(this.key, this.type);

  final String key;
  final Type type;
}
