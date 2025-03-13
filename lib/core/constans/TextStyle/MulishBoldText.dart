
import 'package:chateo/core/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MulishBoldText extends StatelessWidget {
  final String text;
  final double size;

  const MulishBoldText ({
    super.key,
    required this.text,
    this.size = 24

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Mulish-Bold',
        fontSize: size.sp,
        color: TColor.text_primary,
      ),
    );
  }
}