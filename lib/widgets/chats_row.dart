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
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: TColor.text_primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: TColor.text_secondary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          message,
                          style: TextStyle(
                              fontSize: 14.sp,
                            color: TColor.text_secondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (unreadCount > 0)
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color:  Color.fromRGBO(210, 213, 249, 1),
                          ),
                          child: Text(
                            unreadCount.toString(),
                            style: TextStyle(
                              color: TColor.text_primary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
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
