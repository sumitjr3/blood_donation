import 'package:blood_donation/donorOrHospital.dart';
import 'package:blood_donation/services/firebaseServices.dart';
import 'package:blood_donation/signup_detailes.dart';
import 'package:blood_donation/widgets/button_ui.dart';
import 'package:blood_donation/widgets/textfield_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Firebaseservices fs = Firebaseservices();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.08),
                    child: SvgPicture.asset(
                      'lib/assets/4.svg',
                      height: height * 0.1,
                      width: height * 0.1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.02),
                child: const Text(
                  "Welcome",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                'Sign Up',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.only(left: height * 0.01),
                child: const Text(
                  'Email',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
              MyTextField(
                  controller: emailController,
                  inputIcon: const Icon(Icons.email),
                  hintText: "Enter Email",
                  obscure: false,
                  type: TextInputType.emailAddress,
                  height: height * 0.07,
                  width: width * 0.86),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: height * 0.01),
                child: const Text('Password',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
              ),
              MyTextField(
                  controller: passwordController,
                  inputIcon: const Icon(Icons.password),
                  hintText: "Enter password",
                  obscure: true,
                  type: TextInputType.streetAddress,
                  height: height * 0.07,
                  width: width * 0.86),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: height * 0.01),
                child: const Text('Re-enter password',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
              ),
              MyTextField(
                  controller: passwordController2,
                  inputIcon: const Icon(Icons.password),
                  hintText: "Re-enter password",
                  obscure: true,
                  type: TextInputType.streetAddress,
                  height: height * 0.07,
                  width: width * 0.86),
              SizedBox(
                height: height * 0.1,
              ),
              MyButton(
                  onTap: () {
                    if (passwordController.text != passwordController2.text) {
                      fs.showErrorDialog(
                          context, "password doesnot match", "reenter");
                    } else if (emailController.text.isEmpty ||
                        passwordController2.text.isEmpty) {
                      fs.showErrorDialog(
                          context, "enter all fields", "incomplete");
                    } else if (passwordController.text.length < 7) {
                      fs.showErrorDialog(
                          context,
                          "enter password greater than 6 characters",
                          "invalid");
                    } else {
                      Get.to(const signupDetails1(), arguments: {
                        'email': emailController.text,
                        'password': passwordController.text
                      });
                    }
                  },
                  textColor: Colors.white,
                  backgroungColor: const Color(0xffC62C2C),
                  borderColor: const Color(0xffC62C2C),
                  text: "Register",
                  height: height * 0.06,
                  width: width * 0.86),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.all(height * 0.01),
              //       child: const Text(
              //         "OR",
              //         style: TextStyle(
              //           fontSize: 16,
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              // MyButton(
              //     onTap: () {
              //       Get.to(const donorOrHospitalScreen());
              //     },
              //     textColor: const Color(0xffC62C2C),
              //     backgroungColor: const Color(0xffffffff),
              //     borderColor: const Color(0xffC62C2C),
              //     text: "Google",
              //     height: height * 0.06,
              //     width: width * 0.86),
              Padding(
                padding: const EdgeInsets.only(bottom: 25, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed('/login');
                        },
                        child: const Text(
                          'LogIn',
                          style: TextStyle(
                            color: Color(0xffC62C2C),
                            fontWeight: FontWeight.w600,
                          ),
                        ))
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
