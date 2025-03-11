import 'package:chateo/core/constans/colors.dart';
import 'package:chateo/core/constans/big_text.dart';
import 'package:chateo/routes/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../widgets/round_button.dart';
import '../../../widgets/text_filed.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final TextEditingController firs_name = TextEditingController();
  final TextEditingController last_name = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               Align(
                 alignment: Alignment.topLeft,
                 child: Row(
                   children: [
                     IconButton(
                       icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                       onPressed: () => Navigator.pop(context),
                     ),
                      BigText(
                         text: "Your Profile",
                         size: 18.sp,
                         textAlign: TextAlign.start)
                   ],
                 ),
               ),

               SizedBox(height: 50.h),

                 Center(
                   child: Stack(
                     clipBehavior: Clip.none,
                     children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(100.r),
                         child: Container(
                           height: 100,
                           width: 100,
                           decoration: BoxDecoration(
                             color: BColor.input_code_fon
                           ),
                           child: Center(
                               child: SvgPicture.asset(
                                 "assets/img/icons/person_icon.svg",
                                 fit: BoxFit.cover,
                                 height: 60,
                                 width: 60,
                               ) ,
                             ),
                       ),

                     ),

                       Positioned(
                         left: 75,
                         top: 75,
                         child: GestureDetector(
                           onTap: (){},
                           child: Container(
                             height: 23,
                             width: 23,
                             decoration: BoxDecoration(
                               color: Colors.black,
                               borderRadius: BorderRadius.circular(90),
                             ),
                             child: const Center(
                               child: Icon(Icons.add, color: Colors.white, size: 22,
                               ),
                             ),
                           ),
                         ),
                       ),
                    ]
                   ),
                 ),

               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                 child: Column(
                   children: [

                     Custom_input(
                         controller: firs_name,
                         hintText: "First Name (Required)",
                     ),

                     SizedBox( height:  15.h,),

                     Custom_input(
                       controller: last_name,
                       hintText: "Last Name (Optional)",
                     )

                   ],
                 ),
               ),

               const Spacer(),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                 child:  RoundButton(
                     onPressed: (){
                       Get.toNamed(AppRoutes.wrapper);
                     },
                     text: "Save"),
               )

             ],
           ),
          )
      ),
    );
  }
}
