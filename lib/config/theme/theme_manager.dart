import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/resource/local_storage/local_storage.dart';

class ThemeManage {
  static const _themeKey = "isDarkMode";

  static bool isDarkModeActive() {
    var isDarkModeActive = LocalStorage.get(key: _themeKey);
    if (isDarkModeActive == null) {
      isDarkModeActive = false;
      LocalStorage.set(key: _themeKey, value: isDarkModeActive);
    }
    return isDarkModeActive;
  }

  static ThemeMode getThemeMode() {
    return isDarkModeActive() ? ThemeMode.dark : ThemeMode.light;
  }

  static void _saveThemeMode(bool isDarkMode) {
    LocalStorage.set(key: _themeKey, value: isDarkMode);
  }

  static void changeThemeMode() {
    Get.changeThemeMode(isDarkModeActive() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeMode(!isDarkModeActive());
  }
}
