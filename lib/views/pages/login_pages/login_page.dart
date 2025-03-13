
import 'package:chateo/core/constans/TextStyle/MulishBoldText.dart';
import 'package:chateo/core/constans/TextStyle/MulishRegularText.dart';
import 'package:chateo/core/constans/colors.dart';
import 'package:chateo/core/constans/big_text.dart';
import 'package:chateo/views/pages/login_pages/enter_code.dart';
import 'package:chateo/views/pages/login_pages/profile_page.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/logInController.dart';
import '../../../core/constans/globs.dart';
import '../../../core/constans/loadingOverlay.dart';

import '../../../widgets/round_button.dart';
import '../../../widgets/sign_in_google_apple.dart';
import '../home_pages/more_pages/language/settings_language.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final LoginController logincontroller = Get.find();

  final TextEditingController phoneController = TextEditingController();
  late final double screenHeight = MediaQuery.of(context).size.height;
  late final double screenWidth = MediaQuery.of(context).size.width;


  /// Default. чтобы при входе было автоматом region TJ
  final FlCountryCodePicker countryPicker = const FlCountryCodePicker();
  late CountryCode countryCode;

  @override
  void initState() {
    super.initState();
    countryCode = countryPicker.countryCodes.firstWhere((element) => element.name == "Tajikistan");
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: BColor.background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              SizedBox(height: 100.h,),

               Column(
                children: [

                const MulishBoldText(text: "enterYPN"),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 15.h),
                    child:  MulishBoldRegular14(
                        text: 'plaseEYPN'.tr
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    _buildCountryCodePicker(),

                    SizedBox(width: 10.w),

                    Expanded(child: _buildPhoneNumberField()),
                  ],
                ),
              ),

              const Spacer(),

              Row(
                children: [
                  Expanded(
                      child: Divider(
                      height: 30.h,
                      color: BColor.divider_line,
                      thickness: 1.5,
                      endIndent: 10,
                      indent: 20,
                    ),
                  ),

                  Text( "or".tr,
                    style: TextStyle(
                        fontFamily: 'Mulish-SemiBold',
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp
                    ),
                  ),

                  Expanded(
                    child: Divider(
                      height: 30.h,
                      color: BColor.divider_line,
                      thickness: 1.5,
                      endIndent: 20,
                      indent: 10,
                    ),
                  ),
                ],
              ),

              Padding(
                padding:  EdgeInsets.all(15.w),
                child: Column(
                  children: [ Obx( () =>
                    logincontroller.isGoogleLoading.value
                        ? Globs.IndicatorCircle()
                        : SignInGoogleApple(
                      icon: 'assets/img/logo/google_logo.svg',
                      label: 'signUpG'.tr,
                      onPressed: _signInWithGoogle,
                    ),
                  ),

                    SizedBox(height: 10.h),

                    SignInGoogleApple(
                      icon: 'assets/img/logo/apple_logo.svg',
                      label: 'signUpA'.tr,
                      onPressed: () {
                        // LoadingOverlay.show(context);
                      },
                    ),
                  ],
                ),
              ),

               SizedBox(height: 50.h),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child:
                Obx(() => logincontroller.isLoadingPhoneSMS.value
                    ? Globs.IndicatorCircle()
                    : RoundButton(
                        // onPressed: _sendCode,
                        onPressed: () {
                          logincontroller.sendPhoneVerification(phoneController.text);
                        },
                        text: "continue",
                      )
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountryCodePicker() {
    return GestureDetector(
      onTap: () async {
        final code = await countryPicker.showPicker(context: context);
        if (code != null) {
          setState(() {
            countryCode = code;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: BColor.input_code_fon,
        ),
        padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
              ),
              width: 35.w,
              height: 37.h,
              child: countryCode.flagImage(),
            ),

             SizedBox(width: 5.w),

            Text(
              countryCode.dialCode,
              style: TextStyle(
                fontFamily: 'Mulish-SemiBold',
                color: TColor.text_secondary,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Container(
      width: 245.w,
      height: 47.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: BColor.input_code_fon,
      ),
      padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: TextField(
        keyboardType: TextInputType.number,
        cursorColor: BColor.button_primary,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "inputPhone".tr,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'Mulish-SemiBold',
            fontWeight: FontWeight.w500,
            color: TColor.text_secondary,
          ),
        ),
        controller: phoneController,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 17.sp,
          fontFamily: 'Mulish-SemiBold',
          color: TColor.text_primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // sign up with phone
  void _sendCode() {
    logincontroller.sendPhoneVerification(phoneController.text);
  }

  // sign in with google
  void _signInWithGoogle() {
    logincontroller.signInWithGoogle();
  }

}

