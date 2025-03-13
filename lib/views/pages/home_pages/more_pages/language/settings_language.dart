import 'package:chateo/core/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/language_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageController = LanguageController.to;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text('languages'.tr),
      ),
      body: ListView(
        children: [
          RadioListTile<String>(
            activeColor: BColor.Primary_Blue,
            title: Text('english'.tr),
            value: 'en',
            groupValue: languageController.locale.languageCode,
            onChanged: (value) {
              if (value != null) {
                languageController.changeLocale(value, 'US');
              }
            },
          ),
          RadioListTile<String>(
            activeColor: BColor.Primary_Blue,
            title: Text('russian'.tr),
            value: 'ru',
            groupValue: languageController.locale.languageCode,
            onChanged: (value) {
              if (value != null) {
                languageController.changeLocale(value, 'RU');
              }
            },
          ),
        ],
      ),
    );
  }
}