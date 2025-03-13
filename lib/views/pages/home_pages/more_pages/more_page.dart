import 'package:chateo/core/constans/TextStyle/MulishBoldText.dart';
import 'package:chateo/core/constans/TextStyle/MulishRegularText.dart';
import 'package:chateo/core/constans/TextStyle/MulishSemiBText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/constans/colors.dart';
import '../../../../core/constans/animations_navigate.dart';
import '../navigator_bar.dart';
import 'accaunt_page/detail_accaunt.dart';
import 'language/settings_language.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}
class _MorePageState extends State<MorePage> {


  final user =  FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,result) {
        if (!didPop) {
          Navigator.of(context).pushReplacement(
              Route_animations.FadeRoute(const Custom_NavigatorBar(selectedIndex: 0,), 300)
          );
        }
      },
      child: Scaffold(
        backgroundColor: BColor.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок
               Padding(
                padding: EdgeInsets.only(left: 20.w,top: 10.h),
                child: const MulishSemiBold(text: 'more',size: 18,)
              ),

              Padding(
                padding:  EdgeInsets.symmetric(vertical: 15.h),
                child: ListTile(
                  minVerticalPadding: 20,
                  leading: Container(
                    height: 80,
                    width: 60,
                    decoration: BoxDecoration(
                      color: BColor.avatar_accaunt,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: user?.photoURL != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                            child: Image.network(
                              user!.photoURL!,
                              width: 60,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return SvgPicture.asset(
                                  'assets/img/icons/person_icon.svg',
                              width: 35.w,
                              height: 35.h,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      )
                          : SvgPicture.asset(
                        'assets/img/icons/person_icon.svg',
                        width: 35.w,
                        height: 35.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: MulishSemiBold(text: user?.displayName ?? "User", size: 16),

                  subtitle: MulishBoldRegular12(text:  " ${user?.phoneNumber}" ?? "",),

                  trailing:  Icon(
                      size: 20.h,
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black
                  ),
                  onTap: () {
                    Navigator.of(context).push(Route_animations.FadeRoute(DetailAccount(), 200));
                  },
                ),
              ),
              // const Divider(height: 20),

              // Список пунктов
              Expanded(
                child: ListView(
                  children: [
                    _buildMenuItem((){}, 'assets/img/icons/person_icon.svg', "account"),
                    _buildMenuItem((){},'assets/img/icons/message_circle.svg', "chatsMore"),

                    SizedBox(height: 15.h),

                    _buildMenuItem((){
                      // Get.to( ()=> ThemeSettingsScreen());
                      }, 'assets/img/icons/apparance.svg', "appearance"),
                    _buildMenuItemForanfuage("language"),
                    _buildMenuItem((){},'assets/img/icons/notification.svg', "notification"),
                    _buildMenuItem((){},'assets/img/icons/privacy.svg', "privacy"),
                    _buildMenuItem((){},'assets/img/icons/data_use.svg', "dataUsage"),
                     Divider(
                       height: 20.h,
                       color:  BColor.divider_line,
                       thickness: 1.5,
                       endIndent: 15,
                       indent: 15,
                     ),
                    _buildMenuItem((){},'assets/img/icons/help.svg', "help"),
                    _buildMenuItem((){},'assets/img/icons/invate.svg', "inviteYourFriends"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(VoidCallback onTap,String icon_path, String title) {
    return ListTile(
      // splashColor: BColor.fon_pages,
      horizontalTitleGap: 10.w,
      leading: SvgPicture.asset(
          icon_path,
          width: 24.w,
          height: 24.h,
      ),
      // minTileHeight: 40,
      title: MulishSemiBold(text: title, size: 14),

      trailing:  Icon(
          size: 20.h,
          Icons.arrow_forward_ios_rounded,
          color: Colors.black),
      onTap: onTap,
    );
  }

  // for language
  Widget _buildMenuItemForanfuage(String title) {
    return ListTile(
      onTap :  ( () => Get.to(
          SettingsScreen(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: 200)
        )
      ),
      // splashColor: BColor.fon_pages,
      horizontalTitleGap: 10.w,
      leading:  Icon(Icons.language,color: TColor.text_primary, size: 24.h,),
      // minTileHeight: 40,
      title: MulishSemiBold(text: title, size: 14),

      trailing:  Icon(
          size: 20.h,
          Icons.arrow_forward_ios_rounded,
          color: Colors.black),
    );
  }

}