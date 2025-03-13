
import 'package:chateo/core/constans/TextStyle/MulishBoldText.dart';
import 'package:chateo/core/constans/TextStyle/MulishRegularText.dart';
import 'package:chateo/core/constans/colors.dart';
import 'package:chateo/routes/app_routes/app_routes.dart';
import 'package:chateo/views/pages/login_pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import '../../../core/constans/big_text.dart';
import '../../../widgets/round_button.dart';


class EnterCodeScreen extends StatefulWidget {
  // final String verificationId;
  final String vid;
  final String phoneNumber;

  const EnterCodeScreen({
    Key? key,
    // required this.verificationId,
    required this.phoneNumber,
    required this.vid,
  }) : super(key: key);

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  late final double screenHeight = MediaQuery.of(context).size.height;
  late final double screenWidth = MediaQuery.of(context).size.width;

  final controller = TextEditingController();
  final focusNode = FocusNode();

  bool _isLoading = false;
  bool _isResending = false;

  var code = '';

  signIn() async {

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.vid,
        smsCode: code);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential).then((value){
        Get.toNamed(AppRoutes.your_profile);
      });

    } on FirebaseException catch (e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка при отправке кода: ${e.code}'))
      );
    }
    catch (e) {
      print('Error: $e');
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка при входе: ${e.toString()}'))
      );
    }

  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
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
      backgroundColor: Colors.white,
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

              SizedBox(height: 80.h,),

              MulishBoldText(text: 'centerTextB'.tr),

              SizedBox(height: 10.h),

              MulishBoldRegular14(text: "${'centerTextS'}${widget.phoneNumber}".tr),

              SizedBox(height: 50.h),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child: Pinput(
                    length: 6,
                    onChanged: (value){
                      setState(() {
                        code = value;
                      });
                    },
                    controller: controller,
                    focusNode: focusNode,
                    defaultPinTheme: defaultPinTheme,
                    showCursor: true,
                    cursor: cursor,
                    preFilledWidget: preFilledWidget,
                  ),
              ),

              const Spacer(),

              TextButton(
                // onPressed: _isResending ? null : resendOTP,
                onPressed: (){},
                child: _isResending
                    ? const CircularProgressIndicator(strokeWidth: 2)
                    : Text(
                  "resendCode".tr,
                  style: TextStyle(
                    color: BColor.button_primary,
                    fontSize: 14.sp,
                    fontFamily: "Mulish-Regular"
                  ),
                ),
              ),


              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: RoundButton(
                  onPressed: () {
                    // Get.to( ()=> ProfilePage());
                    signIn();
                    },
                  text: "confirm".tr,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 55.w,
    height: 55.h,
    textStyle: TextStyle(
      fontSize: 32.sp,
      fontFamily: 'Mulish-Bold',
      color: TColor.text_primary,
    ),
    decoration: const BoxDecoration(),
  );

  final cursor = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 56.w,
        height: 3.h,
        decoration: BoxDecoration(
          color: BColor.button_primary,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    ],
  );

  final preFilledWidget = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 56.w,
        height: 3.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    ],
  );
}