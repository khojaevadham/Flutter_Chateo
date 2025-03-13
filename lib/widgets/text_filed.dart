import 'package:chateo/core/constans/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custom_input extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const  Custom_input({
    super.key,
     required this.controller,
     required this.hintText,

   });

  @override
  State<Custom_input> createState() => _Custom_inputState();
}

class _Custom_inputState extends State<Custom_input> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.r,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: BColor.input_code_fon,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: TextField(
        cursorColor: BColor.button_primary,
        controller:  widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
          fontSize:  15.sp,
          // fontWeight: FontWeight.w500,
            fontFamily: "Mulish-SemiBold",
          color: TColor.text_secondary,
        ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const  BorderSide(
              color: Colors.transparent,
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
       ),

        style: TextStyle(
            fontSize:  18.sp,
            color: TColor.text_primary,
            fontFamily: "Mulish-SemiBold",
            fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}



class Search_textfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const  Search_textfield({
    super.key,
    required this.controller,
    required this.hintText,

  });

  @override
  State<Search_textfield> createState() => _Search_textfieldState();
}

class _Search_textfieldState extends State<Search_textfield> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.r,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: BColor.input_code_fon,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: TextField(
        cursorColor: BColor.button_primary,
        controller:  widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize:  14.sp,
            // fontWeight: FontWeight.w500,
            fontFamily: 'Mulish-SemiBold',
            color: TColor.text_secondary,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const  BorderSide(
              color: Colors.transparent,
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),

          prefixIcon : Icon(Icons.search, size: 25.h, color: TColor.text_secondary),

        ),

        style: TextStyle(
            fontSize:  18.r,
            color: TColor.text_primary,
            fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
