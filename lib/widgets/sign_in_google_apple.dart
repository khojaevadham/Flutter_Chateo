import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constans/colors.dart';
class SignInGoogleApple extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onPressed;

  const SignInGoogleApple({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
          side: BorderSide(color: BColor.divider_line),
        ),
        foregroundColor:  BColor.primary,
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              icon,
              width: 30.w,
              height: 30.h,
            ),
          ),

           SizedBox(width: 12.w),

          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: TColor.text_primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

