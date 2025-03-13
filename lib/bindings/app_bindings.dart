
import 'package:chateo/controllers/language_controller.dart';
import 'package:chateo/controllers/logInController.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut<LanguageController>(
        () => LanguageController(),
        fenix: true,
    );

    // Get.lazyPut<ThemeController>( ()=> ThemeController());
    Get.lazyPut<LoginController>( () => LoginController());

  }
}