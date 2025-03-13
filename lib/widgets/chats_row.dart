import 'package:chateo/core/constans/TextStyle/MulishBoldText.dart';
import 'package:chateo/core/constans/TextStyle/MulishRegularText.dart';
import 'package:chateo/core/constans/TextStyle/MulishSemiBText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constans/colors.dart';

class ChatItem {
  final String name;
  final String message;
  final String time;
  final int unreadCount;

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
  });
}

class ChatsListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final VoidCallback onPressed;

  const ChatsListItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                color: Colors.grey[300],
                // image: DecorationImage(
                //   image: AssetImage('assets/avatar_placeholder.png'),
                //   fit: BoxFit.cover,
                // ),
              ),
            ),

            SizedBox(width: 15.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      MulishSemiBold(text: name, size: 16,),

                      MulishRegularTime10(text: time),
                    ],
                  ),

                  SizedBox(height: 5.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child:
                        MulishBoldRegular12(text: message),
                      ),
                      if (unreadCount > 0)
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: BColor.total_sms_circly,
                          ),
                          child: Text(
                            unreadCount.toString(),
                            style: TextStyle(
                              color: TColor.total_sms,
                              fontSize: 10.sp,
                              fontFamily: 'Mulish-SemiBold',
                              // fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
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
