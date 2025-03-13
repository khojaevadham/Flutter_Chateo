
import 'package:get/get.dart';
import 'en_US.dart';
import 'ru_RU.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'ru_RU': ruRU,
  };
}