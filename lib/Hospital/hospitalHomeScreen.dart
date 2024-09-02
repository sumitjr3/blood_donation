import 'package:blood_donation/Hospital/screens/call.dart';
import 'package:blood_donation/Hospital/screens/list.dart';
import 'package:blood_donation/Hospital/screens/request.dart';
import 'package:blood_donation/Hospital/screens/availableDonation.dart';
import 'package:blood_donation/services/firebaseServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class hospitalHomeScreen extends StatefulWidget {
  const hospitalHomeScreen({super.key});

  @override
  State<hospitalHomeScreen> createState() => _hospitalHomeScreenState();
}

class _hospitalHomeScreenState extends State<hospitalHomeScreen> {
  String? name;

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('user_name') ?? 'Guest'; // Fallback value
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
              'lib/assets/18.svg',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: height * 0.7,
              width: width * 0.9,
              child: Padding(
                padding: EdgeInsets.only(bottom: height * 0.07),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Text(
                    //   name!,
                    //   style: TextStyle(
                    //       color: Color(0xffC62C2C), fontSize: height * 0.02),
                    // ),
                    // SizedBox(
                    //   height: height * 0.1,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.03, bottom: height * 0.01),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(const RequestHospital());
                        },
                        child: Container(
                          height: height * 0.12,
                          width: width * 0.75,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // Shadow color
                                spreadRadius: 3, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: const Offset(
                                    0, 3), // Shadow position (x, y)
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.12,
                                width: width * 0.25,
                                decoration: const BoxDecoration(
                                    color: Color(0xffC62C2C),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                                child: Center(
                                    child: SvgPicture.asset(
                                  'lib/assets/8.svg',
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Text(
                                'Available donations',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const requestScreen());
                      },
                      child: Padding(
                        padding: EdgeInsets.all(height * 0.01),
                        child: Container(
                          height: height * 0.12,
                          width: width * 0.75,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // Shadow color
                                spreadRadius: 3, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: const Offset(
                                    0, 3), // Shadow position (x, y)
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.12,
                                width: width * 0.25,
                                decoration: const BoxDecoration(
                                    color: Color(0xffC62C2C),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                                child: Center(
                                    child: SvgPicture.asset(
                                  'lib/assets/9.svg',
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Text(
                                'Request donation',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Firebaseservices().signOut();
                    //   },
                    //   child: Padding(
                    //     padding: EdgeInsets.all(height * 0.01),
                    //     child: Container(
                    //       height: height * 0.12,
                    //       width: width * 0.7,
                    //       decoration: BoxDecoration(
                    //         color: const Color(0xffffffff),
                    //         borderRadius: BorderRadius.circular(20),
                    //         boxShadow: [
                    //           BoxShadow(
                    //             color: Colors.grey
                    //                 .withOpacity(0.5), // Shadow color
                    //             spreadRadius: 3, // Spread radius
                    //             blurRadius: 5, // Blur radius
                    //             offset: const Offset(
                    //                 0, 3), // Shadow position (x, y)
                    //           ),
                    //         ],
                    //       ),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           SvgPicture.asset('lib/assets/13.svg'),
                    //           const Text('Logout')
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const ListDonorScreen());
                      },
                      child: Padding(
                        padding: EdgeInsets.all(height * 0.01),
                        child: Container(
                          height: height * 0.12,
                          width: width * 0.75,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // Shadow color
                                spreadRadius: 3, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: const Offset(
                                    0, 3), // Shadow position (x, y)
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.12,
                                width: width * 0.25,
                                decoration: const BoxDecoration(
                                    color: Color(0xffC62C2C),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                                child: Center(
                                    child: SvgPicture.asset(
                                  'lib/assets/11.svg',
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Text(
                                'Donor List  ',
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
