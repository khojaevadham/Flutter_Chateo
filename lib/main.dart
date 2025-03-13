
import 'package:chateo/bindings/app_bindings.dart';
import 'package:chateo/controllers/language_controller.dart';
import 'package:chateo/core/translations/app_translations.dart';
import 'package:chateo/routes/app_pages/app_pages.dart';
import 'package:chateo/routes/app_routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put(LanguageController());
  // Get.put(ThemeController(), permanent: true);

  // Инициализация хранилища для сохранения настроек темы
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = LanguageController.to;
    // final themeController = ThemeController.to;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
        // splitScreenMode: true,
      builder : (context,child) {
        return  GetMaterialApp(
          initialBinding: AppBindings(),
          translations: AppTranslations(),
          locale: languageController.locale,
          fallbackLocale: const Locale('en', 'US'),

          // theme: AppThemes.lightTheme,
          // darkTheme: AppThemes.darkTheme,
          // themeMode: themeController.themeMode == ThemeMode.system
          //     ? ThemeMode.system
          //     : themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,

          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.wrapper,
          getPages: AppPages.routes,
        );
      }
    );
  }
}
