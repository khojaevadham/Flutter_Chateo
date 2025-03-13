import 'package:chateo/core/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RoundButton({super.key,
    required this.onPressed,
    required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed : onPressed ,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
          foregroundColor: Colors.white,
          fixedSize:  Size(327.w, 52.h),
          backgroundColor: BColor.button_primary
      ),
        child: Text(
          text.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Mulish-SemiBold',
            fontSize: 16.sp,
            color: Colors.white
          ),
        ));
  }
}
