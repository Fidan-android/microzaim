import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../conventions/enum/shared_keys.dart';
import '../../domain/repository/i_theme_repository.dart';

class ThemeRepository extends IThemeRepository {
  @override
  Future<String?> getThemeKey() async {
    return (await SharedPreferences.getInstance())
        .getString(SharedKeys.appTheme.key);
  }

  @override
  Future<void> setThemeKey(Brightness brightness) async {
    (await SharedPreferences.getInstance()).setString(SharedKeys.appTheme.key,
        brightness == Brightness.light ? "light" : "dark");
  }
}
