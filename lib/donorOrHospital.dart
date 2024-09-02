import 'package:blood_donation/Hospital/hospitalHomeScreen.dart';
import 'package:blood_donation/donor/donorHome.dart';
import 'package:blood_donation/services/firebaseServices.dart';
import 'package:blood_donation/signup_detailes.dart';
import 'package:blood_donation/widgets/button_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class donorOrHospitalScreen extends StatefulWidget {
  const donorOrHospitalScreen({super.key});

  @override
  State<donorOrHospitalScreen> createState() => _donorOrHospitalScreenState();
}

class _donorOrHospitalScreenState extends State<donorOrHospitalScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              'lib/assets/17.svg',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                MyButton(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString("one", 'heath');
                      Get.to(const hospitalHomeScreen());
                    },
                    textColor: const Color(0xffffffff),
                    backgroungColor: const Color(0xffC62C2C),
                    borderColor: const Color(0xffC62C2C),
                    text: 'Need Blood',
                    height: height * 0.07,
                    width: width * 0.86),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(height * 0.01),
                      child: const Text(
                        "OR",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                MyButton(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString("one", 'donor');
                    Get.to(donorHomeScreen(
                      initialIndex: 0,
                    ));
                  },
                  textColor: const Color(0xffffffff),
                  backgroungColor: const Color(0xffC62C2C),
                  borderColor: const Color(0xffC62C2C),
                  text: 'Blood Donor',
                  height: height * 0.07,
                  width: width * 0.86,
                ),
                SizedBox(
                  height: height * 0.52,
                ),
                MyButton(
                  onTap: () async {
                    Firebaseservices().signOut();
                  },
                  textColor: const Color(0xffC62C2C),
                  backgroungColor: const Color(0xffffffff),
                  borderColor: const Color(0xffC62C2C),
                  text: 'Logout',
                  height: height * 0.07,
                  width: width * 0.86,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
