import 'package:chateo/core/constans/TextStyle/MulishRegularText.dart';
import 'package:chateo/core/constans/TextStyle/MulishSemiBText.dart';
import 'package:chateo/core/constans/colors.dart';
import 'package:chateo/core/constans/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactsRow extends StatelessWidget {
  final VoidCallback onPressed;
  final String LastTime;

  const ContactsRow({super.key, required this.onPressed, required this.LastTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 3.h),
      child: Column(
        children: [
          InkWell(
            onTap: onPressed,
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    color: Colors.grey[300],
                  ),
                ),

                SizedBox(width: 15.w),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     const MulishSemiBold(text: 'Athalia Putri', size: 16),

                    SizedBox(height: 5.h),

                    MulishBoldRegular12(text: '${'lastTime'.tr} ' '${LastTime} ' '${'hoursAgo'.tr}'),

                  ],
                ),
              ],
            ),
          ),
           Divider(height: 35, thickness: 1, color: BColor.divider_line),
        ],
      ),
    );
  }
}
