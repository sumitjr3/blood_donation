import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SuccessHospitalScreen extends StatefulWidget {
  const SuccessHospitalScreen({super.key});

  @override
  State<SuccessHospitalScreen> createState() => _SuccessHospitalScreenState();
}

class _SuccessHospitalScreenState extends State<SuccessHospitalScreen> {
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
              'lib/assets/15.svg',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: const Alignment(0.85, -0.85),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Text(
                'X',
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
