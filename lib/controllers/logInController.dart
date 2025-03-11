import 'dart:math';

import 'package:chateo/views/pages/login_pages/enter_code.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/auth_services.dart';
import '../views/pages/home_pages/navigator_bar.dart';
import '../views/pages/login_pages/start_page.dart';


class LoginController extends GetxController {


  var isLoading = false.obs;
  var isLoadingPhoneSMS = false.obs;
  var isGoogleLoading = false.obs;

  final Rx<User?> user = Rx<User?>(null);

  // Firebase instance
  final FirebaseAuth authFirebase = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  @override
  void onInit() {
    super.onInit();
    // Слушаем изменения состояния аутентификации
    user.value = authFirebase.currentUser;
  }


  // Отправка кода подтверждения по телефону
  Future<void> sendPhoneVerification(String phoneNumber) async {
    try {
      isLoadingPhoneSMS.value = true;

      await authFirebase.verifyPhoneNumber(
        phoneNumber: '+992$phoneNumber', // Убедитесь, что номер в правильном формате
        verificationCompleted: (phoneAuthCredential) {
          // Автоматическая обработка, если верификация завершена
        },
        verificationFailed: (error) {
          print('Ошибка верификации: ${error.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          Get.to(
            EnterCodeScreen(phoneNumber: phoneNumber, vid: verificationId),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Время ожидания кода истекло');
        },
        timeout: Duration(seconds: 60), // Установите тайм-аут
      );
    } catch (e) {
      print('Ошибка: $e');
    } finally {
      isLoadingPhoneSMS.value = false;
    }
  }


  // Вход через Google
  Future<void> signInWithGoogle() async {
    try {
      isGoogleLoading.value = true;

      final UserCredential? userCredential = await AuthService.signInWithGoogle();
      user.value = userCredential?.user;

      if (user.value != null) {
        // await _saveUserToServer(user.value!);
        Get.offAll(() => const
          Custom_NavigatorBar(),
          transition:  Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 300));
      }
    } catch (e) {
      print(e);
    } finally {
      isGoogleLoading.value = false;
    }
  }


  // Выход из аккаунта
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await authFirebase.signOut();
      user.value = null;

      // Очистка локальных данных
      // final box = GetStorage();
      // await box.remove('user_data');

      Get.offAll(() =>
      const StartPage(),
      transition: Transition.fadeIn,
      duration: const Duration(milliseconds: 300));
    } catch (e) {
      print(e);
    }
  }
}