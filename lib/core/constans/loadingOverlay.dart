import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'colors.dart';

class LoadingOverlay {

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const _LoadingDialog(),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}



class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child:LoadingAnimationWidget.waveDots(
              // color: BColor.button_primary,
              color: Colors.white,
              size: 60,
            // leftDotColor: Colors.white,
            // rightDotColor: BColor.button_primary,
          ),
    );
  }
}