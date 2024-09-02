import 'package:blood_donation/donorOrHospital.dart';
import 'package:blood_donation/login.dart';
import 'package:blood_donation/signup.dart';
import 'package:blood_donation/slidder.dart';
import 'package:blood_donation/splash.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/';

  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/slidder',
      page: () => const InitialscreenView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/login',
      page: () => const loginScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/signup',
      page: () => const signupScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/donorOrHospital',
      page: () => const donorOrHospitalScreen(),
      transition: Transition.fade,
    ),
  ];
}
