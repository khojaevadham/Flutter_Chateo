// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../core/themes/app_themes.dart';
//
// enum CustomThemeMode {
//   light,
//   dark,
//   system
// }
//
// class ThemeController extends GetxController {
//   static ThemeController get to => Get.find();
//
//   final _storage = GetStorage();
//   final _themeKey = 'theme_mode';
//
//   // Реактивная переменная для текущего режима темы
//   final Rx<CustomThemeMode> _themeMode = CustomThemeMode.system.obs;
//
//   // Геттер для текущего режима темы
//   CustomThemeMode get themeMode => _themeMode.value;
//
//   // Геттер для определения, включена ли темная тема
//   bool get isDarkMode {
//     if (_themeMode.value == CustomThemeMode.system) {
//       // Проверяем системную тему
//       return Get.isPlatformDarkMode;
//     }
//     return _themeMode.value == CustomThemeMode.dark;
//   }
//
//   // Метод для получения правильной темы на основе режима
//   ThemeData get theme => isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadThemeFromStorage();
//   }
//
//   // Загрузка сохраненной темы
//   void _loadThemeFromStorage() {
//     final savedTheme = _storage.read(_themeKey);
//     if (savedTheme != null) {
//       _themeMode.value = CustomThemeMode.values.firstWhere(
//             (e) => e.toString() == savedTheme,
//         orElse: () => CustomThemeMode.system,
//       );
//     }
//   }
//
//   // Сохранение выбранной темы
//   Future<void> _saveThemeToStorage(CustomThemeMode mode) async {
//     await _storage.write(_themeKey, mode.toString());
//   }
//
//   // Изменение темы
//   void changeThemeMode(CustomThemeMode mode) {
//     _themeMode.value = mode;
//     Get.changeTheme(theme);
//     _saveThemeToStorage(mode);
//     update(); // Обновляем все виджеты, связанные с этим контроллером
//   }
//
//   // Переключение между темной и светлой темой
//   void toggleTheme() {
//     if (isDarkMode) {
//       changeThemeMode(CustomThemeMode.light);
//     } else {
//       changeThemeMode(CustomThemeMode.dark);
//     }
//   }
//
//   // Получение названия текущего режима темы
//   String get themeModeText {
//     switch (_themeMode.value) {
//       case CustomThemeMode.light:
//         return 'Светлая';
//       case CustomThemeMode.dark:
//         return 'Темная';
//       case CustomThemeMode.system:
//         return 'Системная';
//     }
//   }
// }
