import 'package:chateo/core/constans/TextStyle/MulishBoldText.dart';
import 'package:chateo/core/constans/TextStyle/MulishRegularText.dart';
import 'package:chateo/core/constans/colors.dart';
import 'package:chateo/core/constans/big_text.dart';
import 'package:chateo/routes/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../widgets/round_button.dart';
import '../home_pages/more_pages/language/settings_language.dart';



class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: SvgPicture.asset(
                    'assets/img/big_picture/image_persons_white.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

             Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     const MulishBoldText(
                        text: 'centerText',
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: MulishBoldRegular14(text: "privacyPolicy".tr)
                      ),
                    ],
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    child: RoundButton(
                      text: "startMes",
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      }
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}