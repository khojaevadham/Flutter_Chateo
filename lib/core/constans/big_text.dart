import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigText extends StatelessWidget {
  final String text;
  final double size;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const BigText({
    super.key,
  required this.text,
    this.size = 20,
    required this.textAlign,
    this.fontWeight = FontWeight.w600,
   });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: size.sp,
      fontWeight: fontWeight,
      color:  const Color.fromRGBO(15, 24, 40, 1),
    ),);
  }
}
