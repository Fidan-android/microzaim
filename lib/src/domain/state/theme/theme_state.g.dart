// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeState on ThemeStateBase, Store {
  Computed<bool>? _$isDarkComputed;

  @override
  bool get isDark => (_$isDarkComputed ??=
          Computed<bool>(() => super.isDark, name: 'ThemeStateBase.isDark'))
      .value;

  late final _$themeAtom = Atom(name: 'ThemeStateBase.theme', context: context);

  @override
  ThemeData? get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeData? value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$getThemeAsyncAction =
      AsyncAction('ThemeStateBase.getTheme', context: context);

  @override
  Future<void> getTheme() {
    return _$getThemeAsyncAction.run(() => super.getTheme());
  }

  late final _$toggleThemeAsyncAction =
      AsyncAction('ThemeStateBase.toggleTheme', context: context);

  @override
  Future<void> toggleTheme() {
    return _$toggleThemeAsyncAction.run(() => super.toggleTheme());
  }

  @override
  String toString() {
    return '''
theme: ${theme},
isDark: ${isDark}
    ''';
  }
}
