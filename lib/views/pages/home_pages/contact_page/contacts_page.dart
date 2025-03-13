import 'dart:ui';
import 'package:chateo/core/constans/TextStyle/MulishBoldText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../../core/constans/TextStyle/MulishSemiBText.dart';
import '../../../../core/constans/animations_navigate.dart';
import '../../../../widgets/contacts_row.dart';
import '../../../../widgets/text_filed.dart';
import '../navigator_bar.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController searchController = TextEditingController();

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
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding:  EdgeInsets.only(left: 20.w, right: 20.w, top: 190.h),
                    itemCount: 15,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ContactsRow(
                          onPressed: () {},
                          LastTime: '3',
                      );
                    },
                  ),
                ),
              ],
            ),

            // Frosted Glass App Bar
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: Container(
                  width: double.infinity,
                  padding:  EdgeInsets.only(left: 20.w, right: 10.w, top: 50.h, bottom: 15.h),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const MulishSemiBold(text: 'contacts', size: 18,),

                          IconButton(
                            onPressed: () {},
                            icon:  Icon(Icons.add, size: 25.h, color: Colors.black),
                          ),
                        ],
                      ),

                       SizedBox(height: 15.h),

                      Padding(
                        padding:  EdgeInsets.only(right: 10.w),
                        child: Search_textfield(
                            controller: searchController, hintText: 'search'.tr),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}