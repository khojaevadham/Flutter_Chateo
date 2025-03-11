import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../controllers/logInController.dart';


class DetailAccount extends StatefulWidget {
  const DetailAccount({super.key});

  @override
  State<DetailAccount> createState() => _DetailAccountState();
}

class _DetailAccountState extends State<DetailAccount> {

  final LoginController logincontroller = Get.find();


  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  //
  // Future<void> signOut() async {
  //   try {
  //     await _googleSignIn.signOut();
  //     await FirebaseAuth.instance.signOut();
  //     if (mounted) {
  //       Navigator.of(context).pushReplacement(Route_animations.FadeRoute(Wrapper(),200));
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Ошибка при выходе: $e')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.account_circle, size: 80, color: Colors.blueGrey),
              SizedBox(height: 10),
              Text(
                'Вы уверены, что хотите выйти?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: logincontroller.signOut,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Выйти',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
