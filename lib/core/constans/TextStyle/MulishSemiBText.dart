
import 'package:chateo/core/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MulishSemiBold extends StatelessWidget {
  final String text;
  final double size;

  const MulishSemiBold ({
    super.key,
    required this.text,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontFamily: 'Mulish-SemiBold',
        fontSize: size.sp,
        color: TColor.text_primary,
      ),
    );
  }
}
