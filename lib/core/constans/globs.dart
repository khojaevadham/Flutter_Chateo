

import 'package:chateo/core/constans/colors.dart';
import 'package:flutter/material.dart';

class Globs  {

    static Widget IndicatorCircle()  {
       return CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        color: BColor.button_primary,
        strokeWidth: 2.5,
        strokeAlign: 0.1,
      );
    }


    // snackbar bottom
    static void showBottomSnackbar(BuildContext context, String message) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Center(
            child: Text(message,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color : TColor.text_primary,
                fontFamily:  "Roboto-Regular",
              ),
            ),
          ),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            padding: EdgeInsets.symmetric(vertical: 8),
            backgroundColor: Colors.black26,
            elevation: 0,
            shape: OutlineInputBorder(
                borderSide: BorderSide(color:  Colors.transparent, width: 0),
                borderRadius: BorderRadius.all(
                    Radius.circular(50)
                )
            ),
          )
      );
    }

}