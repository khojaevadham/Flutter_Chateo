
import 'package:chateo/core/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MulishBoldRegular14 extends StatelessWidget {
  final String text;

  const MulishBoldRegular14 ({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Mulish-Regular',
        fontSize: 14.sp,
        color: TColor.text_primary,
      ),
    );
  }
}


class MulishBoldRegular12 extends StatelessWidget {
  final String text;

  const MulishBoldRegular12 ({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Mulish-Regular',
        fontSize: 12.sp,
        color: TColor.text_secondary,
      ),
    );
  }
}


class MulishRegular10 extends StatelessWidget {
  final String text;

  const MulishRegular10 ({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Mulish-Regular',
        fontSize: 10.sp,
        color: TColor.text_primary,
      ),
    );
  }
}


class MulishRegularTime10 extends StatelessWidget {
  final String text;

  const MulishRegularTime10 ({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      // textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Mulish-Regular',
        fontSize: 10.sp,
        color: TColor.text_secondary_time,
      ),
    );
  }
}