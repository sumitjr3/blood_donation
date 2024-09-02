import 'package:blood_donation/Hospital/hospitalHomeScreen.dart';
import 'package:blood_donation/donor/donorHome.dart';
import 'package:blood_donation/donorOrHospital.dart';
import 'package:blood_donation/success.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Firebaseservices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference donate =
      FirebaseFirestore.instance.collection('donate');
  final CollectionReference userDonate =
      FirebaseFirestore.instance.collection('userDonate');
  final CollectionReference hospitalRequest =
      FirebaseFirestore.instance.collection('hospitalRequest');

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

  Stream<QuerySnapshot> getUserNote() {
    return users.snapshots();
  }

  Stream<QuerySnapshot> getHospitalNote() {
    return hospitalRequest.snapshots();
  }

  Stream<QuerySnapshot> getUserDonateNote() {
    return donate.snapshots();
  }

  Future<void> signUp(String email, String password, String name, String mobile,
      String location, String bloodGroup) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Store user details in Firestore
      users.add({
        'name': name,
        'mobile': mobile,
        'email': email,
        'location': location,
        'blood group': bloodGroup,
      });

      // Save email in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', email);
      await prefs.setString('user_name', name);
      await prefs.setString('user_mobile', mobile);
      await prefs.setString('user_location', location);
      await prefs.setString('user_blood', bloodGroup);

      Get.snackbar("Success", "User created successfully ;)");

      Get.offAll(const successScreen()); // Navigate to success screen
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "The account already exists for that email.");
      } else {
        Get.snackbar("Error", e.message ?? "Unknown error");
      }
    }
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save email in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', email);
      Get.snackbar("Logged in", "Welcome back");
      Get.offAll(const donorOrHospitalScreen()); // Navigate to home screen
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", 'Wrong password provided.');
      } else {
        Get.snackbar("Error", e.message ?? "Unknown error");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred during login.");
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed('/slidder'); // Navigate to the slider screen after logout
    } catch (e) {
      Get.snackbar("Error", "Error signing out: $e");
    }
  }

  Future<int> daysUntilNextDonation() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString('user_email');
      if (email != null) {
        QuerySnapshot query = await donate
            .where('id', isEqualTo: email)
            .orderBy('date', descending: true)
            .limit(1)
            .get();

        if (query.docs.isEmpty) {
          // No previous donation found
          print('No previous donation found for user: $email');
          return 0;
        }

        final lastDonation = query.docs.first.data() as Map<String, dynamic>;
        final lastDonationTime = (lastDonation['date'] as Timestamp).toDate();

        final difference = DateTime.now().difference(lastDonationTime).inDays;
        print(
            'Last donation time: $lastDonationTime, Days since last donation: $difference');

        if (difference < 90) {
          return 90 - difference; // Days remaining until next donation
        } else {
          return 0; // User can donate now
        }
      } else {
        return 0;
      }
    } catch (e) {
      print('Error in daysUntilNextDonation: $e');
      return -1; // In case of an error, return -1
    }
  }

  Future<void> donateFunction(String blood, String name, String? location,
      String? email, String? mobile) async {
    try {
      // Retrieve email from SharedPreferences

      QuerySnapshot query = await donate
          .where('id', isEqualTo: email)
          .orderBy('date', descending: true)
          .limit(1)
          .get();

      if (query.docs.isEmpty) {
        // No previous donation found, allow the user to donate
        final dateTime = DateTime.now();
        await donate.add({
          'id': email,
          'blood': blood,
          'name': name,
          'date': dateTime,
          'mobile': mobile,
          'location': location
        });
        Get.offAll(() => donorOrHospitalScreen());
        Get.snackbar("Success", "Thank you for donating blood!");
      } else {
        // User has donated before, check eligibility
        int daysLeft = await daysUntilNextDonation();
        print('Days left until next donation for $email: $daysLeft');

        if (daysLeft == 0) {
          // User can donate now
          final dateTime = DateTime.now();
          await donate.add({
            'id': email,
            'blood': blood,
            'name': name,
            'date': dateTime,
          });
          Get.offAll(() => donorHomeScreen(initialIndex: 0));
          Get.snackbar("Success", "Thank you for donating blood!");
        } else if (daysLeft > 0) {
          // User cannot donate yet
          Get.snackbar("Not Eligible",
              "You can donate blood after $daysLeft days. Please wait until then.");
        } else {
          // Handle case where daysLeft is -1
          Get.snackbar(
              "Error", "An error occurred while checking eligibility.");
        }
      }
    } catch (e) {
      print('Error in donateFunction: $e');
      Get.snackbar("Error", "An error occurred during donation.");
    }
  }

  //add hospital request
  Future<void> addHospitalRequest(
      String name, String mobile, String bloodGroup) async {
    try {
      // Store user details in Firestore
      await hospitalRequest.add({
        'name': name,
        'mobile': mobile,
        'blood group': bloodGroup,
      });
      Get.snackbar("Success", "Request successful :)");
      Get.offAll(const donorOrHospitalScreen()); // Navigate to success screen
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "The account already exists for that email.");
      } else {
        Get.snackbar("Error", e.message ?? "Unknown error");
      }
    }
  }
}
