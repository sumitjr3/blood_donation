import 'package:blood_donation/Hospital/hospitalHomeScreen.dart';
import 'package:blood_donation/donor/donorHome.dart';
import 'package:blood_donation/donorOrHospital.dart';
import 'package:blood_donation/slidder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? username;

  @override
  void initState() {
    super.initState();
    getUsername();
    checkUserStatus();
  }

  Future<void> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("loggedIn");
    });
  }

  Future<void> checkUserStatus() async {
    // Check if the user is signed in
    User? user = FirebaseAuth.instance.currentUser;

    // Wait for 2 seconds to show the splash screen
    await Future.delayed(const Duration(seconds: 2));

    // Navigate based on the user's sign-in status
    if (user != null) {
      // User is signed in, navigate to the donorHomeScreen
      Get.offAll(const donorOrHospitalScreen());
    } else {
      // No user is signed in, navigate to the login screen
      Get.offAll(const InitialscreenView());
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.4,
                width: width * 0.8,
                child: SvgPicture.asset(
                  'lib/assets/splash.svg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Donate blood save life!!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "||  रक्तं दातव्यम  || ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
