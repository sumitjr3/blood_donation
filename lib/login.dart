import 'package:blood_donation/services/firebaseServices.dart';
import 'package:blood_donation/widgets/button_ui.dart';
import 'package:blood_donation/widgets/textfield_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                height: height * 0.05,
              ),
              const Text(
                'Sign In',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.02),
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(color: Color(0xffC62C2C)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
              MyButton(
                  onTap: () {
                    if (!emailController.text.isEmail) {
                      fs.showErrorDialog(
                          context, 'enter valid email', "Wrong Email!");
                    } else if (passwordController.text.isEmpty) {
                      fs.showErrorDialog(context, 'enter password', "password");
                    } else {
                      fs.login(emailController.text, passwordController.text);
                    }
                  },
                  textColor: Colors.white,
                  backgroungColor: const Color(0xffC62C2C),
                  borderColor: const Color(0xffC62C2C),
                  text: "Login",
                  height: height * 0.06,
                  width: width * 0.86),
              Padding(
                padding: const EdgeInsets.only(bottom: 25, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do not have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
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
