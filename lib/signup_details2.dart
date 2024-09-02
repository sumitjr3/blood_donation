import 'package:blood_donation/services/firebaseServices.dart';
import 'package:blood_donation/widgets/button_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signupDetails2 extends StatefulWidget {
  const signupDetails2({super.key});

  @override
  State<signupDetails2> createState() => _signupDetails2State();
}

class _signupDetails2State extends State<signupDetails2> {
  void showErrorDialog(
      BuildContext context, String errorMessage, String heading) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(heading),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool acceptTerms = false;
  String? diabetes = 'No';
  String? two = 'No';
  String? three = 'No';
  String? four = 'No';
  String? five = 'No';
  @override
  Widget build(BuildContext context) {
    Firebaseservices fs = Firebaseservices();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final Map<String, dynamic> arguments = Get.arguments;
    final email = arguments['email'];
    final password = arguments['password'];
    final mobile = arguments['mobile'];
    final location = arguments['location'];
    final blood = arguments['blood'];
    final name = arguments['name'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.045,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Questionaries',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const Text(
                'Fill up the following question and become a donor',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.1,
                width: width * 0.86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.5),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: const Text('Do you have diabetes?',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Yes',
                              groupValue: diabetes,
                              onChanged: (String? value) {
                                setState(() {
                                  diabetes = value;
                                });
                              },
                            ),
                            const Text('Yes'),
                            SizedBox(width: width * 0.1),
                            Radio<String>(
                              value: 'No',
                              groupValue: diabetes,
                              onChanged: (String? value) {
                                setState(() {
                                  diabetes = value;
                                });
                              },
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.13,
                width: width * 0.86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.5),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: const Text(
                                'Have you ever had problems with ',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: const Text('your heart or lungs?',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Yes',
                              groupValue: two,
                              onChanged: (String? value) {
                                setState(() {
                                  two = value;
                                });
                              },
                            ),
                            const Text('Yes'),
                            SizedBox(width: width * 0.1),
                            Radio<String>(
                              value: 'No',
                              groupValue: two,
                              onChanged: (String? value) {
                                setState(() {
                                  two = value;
                                });
                              },
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.13,
                width: width * 0.86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.5),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: const Text(
                                'Have you ever had a positive test ',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: const Text('for the HIV/AIDS virus?',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Yes',
                              groupValue: three,
                              onChanged: (String? value) {
                                setState(() {
                                  three = value;
                                });
                              },
                            ),
                            const Text('Yes'),
                            SizedBox(width: width * 0.1),
                            Radio<String>(
                              value: 'No',
                              groupValue: three,
                              onChanged: (String? value) {
                                setState(() {
                                  three = value;
                                });
                              },
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.1,
                width: width * 0.86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.5),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: const Text('Have you ever had cancer?',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Yes',
                              groupValue: four,
                              onChanged: (String? value) {
                                setState(() {
                                  four = value;
                                });
                              },
                            ),
                            const Text('Yes'),
                            SizedBox(width: width * 0.1),
                            Radio<String>(
                              value: 'No',
                              groupValue: four,
                              onChanged: (String? value) {
                                setState(() {
                                  four = value;
                                });
                              },
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.13,
                width: width * 0.86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.5),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: const Text('In the last 3 months have you',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: const Text('had a vaccination?',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Yes',
                              groupValue: five,
                              onChanged: (String? value) {
                                setState(() {
                                  five = value;
                                });
                              },
                            ),
                            const Text('Yes'),
                            SizedBox(width: width * 0.1),
                            Radio<String>(
                              value: 'No',
                              groupValue: five,
                              onChanged: (String? value) {
                                setState(() {
                                  five = value;
                                });
                              },
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.0,
              ),
              Row(
                children: [
                  Checkbox(
                    value: acceptTerms,
                    onChanged: (bool? value) {
                      setState(() {
                        acceptTerms = value ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'By clicking you agree to our terms and condition',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.005,
              ),
              MyButton(
                  onTap: () {
                    if (diabetes == 'No' ||
                        two == 'No' ||
                        three == 'No' ||
                        four == 'No' ||
                        five == 'No') {
                      showErrorDialog(
                          context,
                          "You cannot continue as one of answers is NO ",
                          "Sorry");
                    } else if (acceptTerms == false) {
                      showErrorDialog(context, "Please accept T&C", "Warning");
                    } else {
                      fs.signUp(email, password, name, mobile, location, blood);
                    }
                  },
                  textColor: const Color(0xffffffff),
                  backgroungColor: const Color(0xffC62C2C),
                  borderColor: const Color(0xffC62C2C),
                  text: "Enter",
                  height: height * 0.06,
                  width: width * 0.86)
            ],
          ),
        ),
      ),
    );
  }
}
