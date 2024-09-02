import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? location;
  String? email;
  String? number;
  String? blood;
  @override
  void initState() {
    super.initState();
    getName();
  }

  void getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('user_name');
      location = prefs.getString('user_location');
      email = prefs.getString('user_email');
      number = prefs.getString('user_mobile');
      blood = prefs.getString('user_blood');
    });
  }

  @override
  Widget build(BuildContext context) {
    String getSvgPath(String? name) {
      if (name != null && name.isNotEmpty) {
        String initial = name[0].toLowerCase();
        return 'lib/assets/avtar/$initial.svg';
      }
      return 'lib/assets/avtar/a.svg'; // Return a default SVG if name is null or empty
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: name != null
          ? Stack(
              children: [
                SizedBox(
                  height: height,
                  width: width,
                  child: SvgPicture.asset(
                    'lib/assets/16.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: height * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Divider(
                        color: Colors.white, // Color of the divider
                        thickness: 1, // Thickness of the divider
                        indent: 10, // Left spacing
                        endIndent: 10, // Right spacing
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white, // Color of the border
                                width: width * 0.005, // Width of the border
                              ),
                            ),
                            child: ClipOval(
                              child: SvgPicture.asset(
                                getSvgPath(name), // Handle null or empty name
                                height: height * 0.135,
                                width: width * 0.135,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name'),
                          Text(
                            name ?? 'Admin', // Handle null name
                            style: TextStyle(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Location'),
                          Text(
                            location ?? 'vadodara',
                            style: TextStyle(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email'),
                          Text(
                            email ?? 'test@gmail.com',
                            style: TextStyle(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Number'),
                          Text(
                            number ?? '9856712134',
                            style: TextStyle(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Blood Type'),
                          Text(
                            blood ?? 'A+',
                            style: TextStyle(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  ),
                )
              ],
            )
          : const Center(
              child:
                  CircularProgressIndicator(), // Show loading indicator while username is null
            ),
    );
  }
}
