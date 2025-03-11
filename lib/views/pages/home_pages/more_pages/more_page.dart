import 'package:chateo/core/constans/big_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constans/colors.dart';
import '../../../../core/constans/animations_navigate.dart';
import '../navigator_bar.dart';
import 'accaunt_page/detail_accaunt.dart';

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
              Route_animations.FadeRoute(const Custom_NavigatorBar(selectedIndex: 0,), 400)
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
              const Padding(
                padding: EdgeInsets.only(left: 20,top: 25),
                child: BigText(
                    text: "More",
                    textAlign: TextAlign.left
                )
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: ListTile(
                  minVerticalPadding: 20,
                  leading: Container(
                    height: 80,
                    width: 60,
                    decoration: BoxDecoration(
                      color: BColor.avatar_accaunt,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: user?.photoURL != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              user!.photoURL!,
                              width: 60,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return SvgPicture.asset(
                                  'assets/img/icons/person_icon.svg',
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      )
                          : SvgPicture.asset(
                        'assets/img/icons/person_icon.svg',
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: BigText(
                    text: user?.displayName ?? "User",
                    size: 18,
                    textAlign: TextAlign.start,
                  ),
                  subtitle: Text(
                    // user?.email ?? "",
                   " ${user!.phoneNumber}",
                    style: TextStyle(
                      fontSize: 14,
                      color: TColor.text_secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(
                      size: 20,
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
                    _buildMenuItem('assets/img/icons/person_icon.svg', "Account"),
                    _buildMenuItem('assets/img/icons/message_circle.svg', "Chats"),
                    const SizedBox(height: 20,),
                    _buildMenuItem('assets/img/icons/apparance.svg', "Appearance"),
                    _buildMenuItem('assets/img/icons/notification.svg', "Notification"),
                    _buildMenuItem('assets/img/icons/privacy.svg', "Privacy"),
                    _buildMenuItem('assets/img/icons/data_use.svg', "Data Usage"),
                     Divider(
                       height: 30,
                       color:  BColor.divider_line,
                       thickness: 1.5,
                       endIndent: 15,
                       indent: 15,
                     ),
                    _buildMenuItem('assets/img/icons/help.svg', "Help"),
                    _buildMenuItem('assets/img/icons/invate.svg', "Invite Your Friends"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String icon_path, String title) {
    return ListTile(
      // splashColor: BColor.fon_pages,
      leading: SvgPicture.asset(
          icon_path,
          width: 25,
          height: 25,
      ),
      // minTileHeight: 40,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: TColor.text_primary,
          fontWeight: FontWeight.w600
        ),
      ),
      trailing: const Icon(
          size: 20,
          Icons.arrow_forward_ios_rounded,
          color: Colors.black),
      onTap: () {},
    );
  }
}