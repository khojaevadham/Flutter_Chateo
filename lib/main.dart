
import 'package:chateo/bindings/auth_binding.dart';
import 'package:chateo/controllers/logInController.dart';
import 'package:chateo/routes/app_pages/app_pages.dart';
import 'package:chateo/routes/app_routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(LoginController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,         // Включение минимальной адаптации текста
        // splitScreenMode: true, // Включение поддержки планшетов
      builder : (context,child) {
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.wrapper,
          getPages: AppPages.routes,
        );
      }
    );
  }
}
