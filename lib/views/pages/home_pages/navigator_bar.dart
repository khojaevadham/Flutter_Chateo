import 'package:chateo/core/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constans/animations_navigate.dart';
import 'contact_page/contacts_page.dart';
import 'more_pages/more_page.dart';
import 'chat_page/chats_page.dart';

class Custom_NavigatorBar extends StatefulWidget {

  final int selectedIndex;


  const Custom_NavigatorBar({
    super.key,
   this.selectedIndex = 0,
  });

  @override
  State<Custom_NavigatorBar> createState() => _Custom_NavigatorBarState();
}

class _Custom_NavigatorBarState extends State<Custom_NavigatorBar> {

  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  final List<Widget> _pages = [
    const ChatsPage(),
    const HomePage(),
    const MorePage(),
  ];

  void _onItemTapped(int index) {
    HapticFeedback.vibrate();
    if (index != selectedIndex) {
      Navigator.of(context).pushReplacement(
          Route_animations.FadeRoute(Custom_NavigatorBar(selectedIndex: index,), 300)
      );
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: Colors.transparent,
        ),
        child: NavigationBar(
          shadowColor: Colors.black87,
          selectedIndex: selectedIndex,
          // indicatorColor: Colors.transparent,
          onDestinationSelected: _onItemTapped,
          animationDuration: const Duration(milliseconds: 200),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 60.h,
          backgroundColor: Colors.white,
          elevation: 14,
          destinations: [
            _buildDestination("Chats", "assets/img/icons/message_circle.svg", 0),
            _buildDestination("Contacts", "assets/img/icons/contacts_icon.svg", 1),
            _buildDestination("More", "assets/img/icons/more_horizontal.svg", 2),
          ],
        ),
      ),
    );
  }

  NavigationDestination _buildDestination(String label, String iconPath, int index) {
    return NavigationDestination(
      icon: selectedIndex == index
          ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label.tr,
                style:  TextStyle(
                    fontSize: 14.sp,
                    color: TColor.text_primary,
                    fontFamily: 'Mulish-Bold'
                    // fontWeight: FontWeight.w600
                ),
              ),

               SizedBox(height: 3.h),
               Icon(
                  Icons.circle,
                  size: 7,
                  color: BColor.primary),
            ],
          )
            :  SvgPicture.asset(
            iconPath,
            width: 32.w,
            height: 32.h,
        ),
      label: '', 
    );
  }
}
