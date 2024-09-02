import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class InitialscreenView extends StatefulWidget {
  const InitialscreenView({super.key});

  @override
  State<InitialscreenView> createState() => _InitialScreenViewState();
}

List contents = [
  {
    'image': 'lib/assets/1.svg',
    'title': 'Be a reason for Someone’s Happiness By Donating Blood !!',
    'desc': ""
  },
  {'image': 'lib/assets/2.svg', 'title': 'Check Eligiblity', 'desc': ''},
  {
    'image': 'lib/assets/3.svg',
    'title': 'Start Donating Blood and Help People.',
    'desc': ''
  }
];

class _InitialScreenViewState extends State<InitialscreenView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: (height * 0.15),
          ),
          Expanded(
            child: PageView.builder(
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (content, i) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      //color: Colors.black,
                      child: Column(
                        children: [
                          SizedBox(
                            height: (height * 0.32),
                            width: (width * 0.685),
                            child: SvgPicture.asset(
                              contents[i][
                                  'image']!, // Access the image directory of the first image
                              width: 250.0, // Set the width as needed
                              height: 250.0, // Set the height as needed
                            ),
                          ),
                          SizedBox(
                            height: (height * 0.02),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.1, right: width * 0.1),
                            child: Text(
                              contents[i]['title'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: (height * 0.015),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: (width * 0.05), right: (width * 0.05)),
                            child: Container(
                              child: Text(
                                contents[i]['desc'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                contents.length, (index) => buildDot(index, context)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed('/login');
                },
                child: Container(
                  height: (height * 0.06),
                  width: (width * 0.85),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xffC62C2C),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'New here?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed('/signup');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xffC62C2C),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, bottom: 20),
      height: 8,
      width: currentIndex == index ? 25 : 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? const Color(0xffC62C2C)
            : const Color.fromARGB(255, 67, 67, 68),
      ),
    );
  }
}
