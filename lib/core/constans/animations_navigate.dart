
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Route_animations {

  /// it is for dialog view or page
  // 1 Scale Transition — Популярен для диалогов, так как выглядит естественно.
  // 2 Fade Transition — Прост и элегантен, хорошо подходит для минималистичных приложений.
  // 3 Slide Transition — Отличный выбор, если вы хотите более динамичный вид.
  // 4 Scale + Fade — Современный вариант, используется во многих популярных приложениях.

  // 1
  static void DialogExitScaleT(BuildContext context, Widget Page) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation1, animation2) {
        return  Page;
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      },
    );
  }

  // 2
  static void DialogExitFadeT(BuildContext context, Widget Page) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation1, animation2) {
        return Page;
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  // 3
  static void DialogExitSlideT(BuildContext context, Widget Page) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation1, animation2) {
        return Page;
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  // 4
  static void DialogExitScaleF(BuildContext context, Widget Page) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation1, animation2) {
        return Page ;
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      },
    );
  }


  ///  it is navigate to the page with any animations
  // 1 Анимация слайдера
  // 2  Анимация масштабирования (Scale Transition)
  // 3 Fade Transition (Плавное появление)
  // 4 Комбинация анимаций (Fade + Slide)
  // 5 Hero animated откроется с верху


// 1
  static  Create_Route(Widget Page,  milliseconds) {
    return PageRouteBuilder(
      transitionDuration:  Duration(milliseconds: milliseconds),
      pageBuilder: (context, animation, secondaryAnimation) => Page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  // 2
  static  ScaleRoute(Widget Route, milliseconds) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds : milliseconds),
      pageBuilder: (context, animation, secondaryAnimation) => Route,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }


  // 3
  static  FadeRoute(Widget Route, milliseconds) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds : milliseconds),
      pageBuilder: (context, animation, secondaryAnimation) => Route,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }


  // 4
  static  FadeSlideRoute(Widget Route, milliseconds) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds : milliseconds),
      pageBuilder: (context, animation, secondaryAnimation) => Route,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const offsetBegin = Offset(0.0, 1.0);
        const offsetEnd = Offset.zero;
        var slideAnimation = Tween(begin: offsetBegin, end: offsetEnd)
            .chain(CurveTween(curve: Curves.easeInOut))
            .animate(animation);

        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  // 5
  static HeroRoute(Widget Route, milliseconds) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: milliseconds),
      pageBuilder: (_, __, ___) => Route,
      transitionsBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );
      },
    );
  }


}