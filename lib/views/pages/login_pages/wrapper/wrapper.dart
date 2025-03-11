
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home_pages/navigator_bar.dart';
import '../start_page.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context , snapshot) {
            if (snapshot.hasData) {
              return Custom_NavigatorBar();
            } else {
              return StartPage();
            }
          }
      ),
    );
  }
}
