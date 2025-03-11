
import 'package:chateo/views/pages/login_pages/enter_code.dart';
import 'package:get/get.dart';

import '../../views/pages/home_pages/navigator_bar.dart';
import '../../views/pages/login_pages/login_page.dart';
import '../../views/pages/login_pages/profile_page.dart';
import '../../views/pages/login_pages/start_page.dart';
import '../../views/pages/login_pages/wrapper/wrapper.dart';
import '../app_routes/app_routes.dart';


class AppPages {

  static final routes =  [
    GetPage(
        name: AppRoutes.wrapper,
        page: () => const Wrapper(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
        name: AppRoutes.start_messaging,
        page: ()=> const StartPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    // GetPage(
    //   name: AppRoutes.enter_code,
    //   page: ()=> const EnterCodeScreen(phoneNumber: phoneNumber, vid: vid),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(milliseconds: 200),
    // ),
    GetPage(
      name: AppRoutes.your_profile,
      page: () => const ProfilePage(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: AppRoutes.custom_navigation,
      page: () => Custom_NavigatorBar(),
    ),
  ];
}
