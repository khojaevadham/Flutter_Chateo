import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
              Route_animations.FadeRoute(const Custom_NavigatorBar(selectedIndex: 0,), 400)
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
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 170),
                    itemCount: 15,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ContactsRow(onPressed: () {});
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
                  padding: const EdgeInsets.only(left: 20, right: 10, top: 50, bottom: 15),
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
                          const Text(
                            "Contacts",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add, size: 30, color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Search_textfield(controller: searchController, hintText: 'Search'),
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