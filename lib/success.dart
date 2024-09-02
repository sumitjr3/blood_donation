import 'package:blood_donation/Hospital/hospitalHomeScreen.dart';
import 'package:blood_donation/donor/donorHome.dart';
import 'package:blood_donation/donorOrHospital.dart';
import 'package:blood_donation/widgets/button_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class successScreen extends StatefulWidget {
  const successScreen({super.key});

  @override
  State<successScreen> createState() => _successScreenState();
}

class _successScreenState extends State<successScreen> {
  String? _savedData;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  // Function to load saved data from SharedPreferences
  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedData = prefs.getString('one') ?? 'donor';
    });
  }

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
              "lib/assets/6.svg",
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(height * 0.05),
              child: MyButton(
                  onTap: () {
                    Get.offAll(donorOrHospitalScreen());
                  },
                  textColor: const Color(0xffffffff),
                  backgroungColor: const Color(0xffC62C2C),
                  borderColor: const Color(0xffC62C2C),
                  text: "Continue to donate",
                  height: height * 0.07,
                  width: width * 0.86),
            ),
          )
        ],
      ),
    );
  }
}
