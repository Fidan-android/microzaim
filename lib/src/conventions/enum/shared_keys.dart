enum SharedKeys {
  firstLaunch("first_launch", bool),
  subscribe("subscribe", bool),
  calculationsLoan("calculations_loan", List),
  calculationsDebt("calculations_debt", List),
  appTheme("app_theme", String);

  const SharedKeys(this.key, this.type);

  final String key;
  final Type type;
}
