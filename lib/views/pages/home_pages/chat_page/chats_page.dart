import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constans/colors.dart';
import '../../../../core/constans/big_text.dart';
import '../../../../core/constans/globs.dart';
import '../../../../widgets/chats_row.dart';
import '../../../../widgets/text_filed.dart';


class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {

  final TextEditingController _controller = TextEditingController();
  DateTime? lastPress;


  final List<ChatItem> chats = [
    ChatItem(name: "Алекс", message: "Привет! Как дела?", time: "10:45", unreadCount: 2),
    ChatItem(name: "Мария", message: "Встретимся вечером?", time: "09:30", unreadCount: 0),
    ChatItem(name: "Иван", message: "Ок, договорились!", time: "Вчера", unreadCount: 1),
  ];


  // для выход 2 раз надо нажать
  Future<bool> popScope(BuildContext context)  {
    final now = DateTime.now();
    int exitTime =  1;

    if(lastPress == null || now.difference(lastPress!) >  Duration(seconds: exitTime)){
      lastPress = now;
      Globs.showBottomSnackbar(context, 'Нажмите еще раз, чтобы выйти из приложения');
      return Future.value(false);
    }
    exit(0);

  }


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
      onPopInvokedWithResult : (didPop, result) {
        if(!didPop){
          popScope(context);
        }
      },
      child: Scaffold(
        backgroundColor: BColor.background,
        body: Column(
          children: [
            _buildHeader(),

            SizedBox(height: 20.h),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Search_textfield(
                  controller: _controller,
                  hintText: 'Placeholder'
              ),
            ),

             SizedBox(height: 10.h),

            Expanded(
              child: ListView.builder(
                padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ChatsListItem(
                    name: chat.name,
                    message: chat.message,
                    time: chat.time,
                    unreadCount: chat.unreadCount,
                    onPressed: () {
                      // Navigator.of(context).push(Route_animations.FadeSlideRoute(ChatScreen(), 250));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding:  EdgeInsets.only(top: 50.h, bottom: 10.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: BColor.divider_line, width: 1.5)),
        color: BColor.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 20.w,right: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BigText(
                     text: "Chats",
                     size: 20,
                     textAlign: TextAlign.start
                 ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/img/icons/add_chat.svg', width: 30, height: 30),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/img/icons/views_icon.svg', width: 30, height: 30),
                    ),
                  ],
                ),
              ],
            ),
          ),

           SizedBox(height: 15.h),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding:  EdgeInsets.only(left: 20.w,right: 20.w,bottom: 10.h),
            child: Row(
              children: [
                _buildMyStory(),
                 SizedBox(width: 15.w),
                _buildStoryContainer("Мария", 'assets/img/icons/story.png'),
                 SizedBox(width: 15.w),
                _buildStoryContainer("Irlan", 'assets/img/icons/irlan_icon.png'),
                 SizedBox(width: 15.w),
                _buildStoryContainer("Nasti", 'assets/img/icons/putri.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyStory() {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: BColor.storis_cont, width: 3),
            ),
            child: Container(
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: BColor.input_code_fon,
                borderRadius: BorderRadius.circular(19),
              ),
              child: Center(
                child: Icon(Icons.add_rounded, size: 45, color: BColor.storis_cont,),
              ),
            ),
          ),
        ),

         SizedBox(height: 5.h),

        Text(
          "Your Story",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: TColor.text_primary),
        ),
      ],
    );
  }

  Widget _buildStoryContainer(String name, String imagePath) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(236, 158, 255, 1),
                  Color.fromRGBO(95, 46, 234, 1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(19),
              ),
              child: Padding(
                padding: EdgeInsets.all(3),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ),

         SizedBox(height: 5.h),

        Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: TColor.text_primary
          ),
        ),
      ],
    );
  }
}

