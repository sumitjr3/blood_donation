import 'package:blood_donation/services/firebaseServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class donorHome extends StatefulWidget {
  const donorHome({Key? key}) : super(key: key);

  @override
  _donorHomeState createState() => _donorHomeState();
}

class _donorHomeState extends State<donorHome> {
  int daysLeft = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkDonationEligibility();
  }

  Future<void> _checkDonationEligibility() async {
    setState(() {
      isLoading = true;
    });

    Firebaseservices firebaseServices = Firebaseservices();
    int days = await firebaseServices.daysUntilNextDonation();

    setState(() {
      daysLeft = days;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   co
      //   foregroundColor: Color(0xffC62C2C),
      //   // leading: null,
      //   // titleSpacing: 20,
      //   leading: Padding(
      //     padding: EdgeInsets.only(left: width * 0.05),
      //     child: const Icon(Icons.arrow_back_ios_rounded),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   title: const Text(
      //     'home',
      //     style: TextStyle(
      //         color: Color(0xFF111111),
      //         fontSize: 25,
      //         fontFamily: 'Roboto',
      //         fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      // ),
      body: Stack(children: [
        SizedBox(
          height: height,
          width: width,
          child: SvgPicture.asset(
            'lib/assets/14.svg',
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment(0, -0.75),
          child: Container(
            width: width * 0.7,
            height: height * 0.09,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey)),
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : daysLeft == 0
                      ? Text(
                          "You are eligible to donate blood!",
                          style: TextStyle(
                              fontSize: height * 0.015,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      : daysLeft > 0
                          ? Text(
                              "You can donate blood after $daysLeft days.",
                              style: TextStyle(
                                  fontSize: height * 0.015,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          : Text(
                              "An error occurred checking eligibility.",
                              style: TextStyle(
                                  fontSize: height * 0.015,
                                  color: Colors.white),
                            ),
            ),
          ),
        ),
      ]),
    );
  }
}
