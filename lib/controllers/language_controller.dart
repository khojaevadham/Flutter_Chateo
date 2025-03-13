
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();
  final String _localeKey = 'locale';

  // Поддерживаемые локали
  final List<Locale> supportedLocales = [
    const Locale('en', 'US'),
    const Locale('ru', 'RU'),
  ];

  // Текущая локаль
  final Rx<Locale> _locale = Rx<Locale>(const Locale('en', 'US'));
  Locale get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    _loadSavedLocale();
  }

  // Изменение языка
  void changeLocale(String languageCode, String countryCode) async {
    final newLocale = Locale(languageCode, countryCode);
    _locale.value = newLocale;
    Get.updateLocale(newLocale);
    await _saveLocale(languageCode, countryCode);

    // Показываем уведомление об изменении языка
    // Get.snackbar(
    //   'languageChanged'.tr,
    //   '',
    //   snackPosition: SnackPosition.BOTTOM,
    //   duration: const Duration(seconds: 2),
    // );
  }

  // Сохранение выбранного языка
  Future<void> _saveLocale(String languageCode, String countryCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey + '_languageCode', languageCode);
    await prefs.setString(_localeKey + '_countryCode', countryCode);
  }

  // Загрузка сохраненного языка
  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguageCode = prefs.getString(_localeKey + '_languageCode');
    final savedCountryCode = prefs.getString(_localeKey + '_countryCode');

    if (savedLanguageCode != null && savedCountryCode != null) {
      _locale.value = Locale(savedLanguageCode, savedCountryCode);
      Get.updateLocale(_locale.value);
    }
  }

  // Получение имени языка по коду
  String getLanguageName(String langCode) {
    switch (langCode) {
      case 'en':
        return 'english'.tr;
      case 'ru':
        return 'russian'.tr;
      default:
        return 'english'.tr;
    }
  }
}