import 'package:blood_donation/donor/tabs/donate.dart';
import 'package:blood_donation/donor/tabs/donorhome.dart';
import 'package:blood_donation/donor/tabs/notification.dart';
import 'package:blood_donation/donor/tabs/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class donorHomeScreen extends StatefulWidget {
  int initialIndex;
  donorHomeScreen({super.key, required this.initialIndex});

  @override
  State<donorHomeScreen> createState() => _donorHomeScreenState();
}

class _donorHomeScreenState extends State<donorHomeScreen> {
  int currenttab = 2;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const donorHome();

  @override
  void initState() {
    super.initState();
    currenttab = widget.initialIndex;
    _selectScreen(widget.initialIndex);
  }

  void _selectScreen(int index) {
    switch (index) {
      case 0:
        currentScreen = donateScreen();
        break;
      case 1:
        currentScreen = notificationScreen();
        break;
      case 2:
        currentScreen = donorHome();
        break;
      case 3:
        currentScreen = ProfileScreen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: Padding(
        padding:
            EdgeInsets.only(left: screenWidth * 0.0, right: screenWidth * 0.01),
        child: Container(
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          height: screenHeight * 0.059,
          width: screenWidth * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {
                  setState(
                    () {
                      currentScreen = donateScreen();
                      widget.initialIndex = 0;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_filled,
                      size: screenHeight * 0.03,
                      color: widget.initialIndex == 0
                          ? const Color(0xffC62C2C)
                          : Colors.black,
                    ),
                    Visibility(
                      visible: widget.initialIndex == 0,
                      child: Container(
                        height: screenHeight * 0.01,
                        width: screenWidth * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xffC62C2C),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {
                  setState(
                    () {
                      currentScreen = notificationScreen();
                      widget.initialIndex = 1;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications,
                      size: screenHeight * 0.03,
                      color: widget.initialIndex == 1
                          ? const Color(0xffC62C2C)
                          : Colors.black,
                    ),
                    Visibility(
                      visible: widget.initialIndex == 1,
                      child: Container(
                        height: screenHeight * 0.01,
                        width: screenWidth * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xffC62C2C),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {
                  setState(
                    () {
                      currentScreen = donorHome();
                      widget.initialIndex = 2;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.health_and_safety_rounded,
                      size: screenHeight * 0.03,
                      color: widget.initialIndex == 2
                          ? const Color(0xffC62C2C)
                          : Colors.black,
                    ),
                    Visibility(
                      visible: widget.initialIndex == 2,
                      child: Container(
                        height: screenHeight * 0.01,
                        width: screenWidth * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xffC62C2C),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //right side navigation
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {
                  setState(
                    () {
                      currentScreen = ProfileScreen();
                      widget.initialIndex = 3;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: screenHeight * 0.03,
                      color: widget.initialIndex == 3
                          ? const Color(0xffC62C2C)
                          : Colors.black,
                    ),
                    Visibility(
                      visible: widget.initialIndex == 3,
                      child: Container(
                        height: screenHeight * 0.01,
                        width: screenWidth * 0.01,
                        decoration: BoxDecoration(
                          color: const Color(0xffC62C2C),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
