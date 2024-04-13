import 'dart:ui';

abstract class IThemeRepository {
  Future<String?> getThemeKey();

  Future<void> setThemeKey(Brightness brightness);
}
