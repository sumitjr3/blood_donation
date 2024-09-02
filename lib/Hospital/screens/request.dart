import 'package:blood_donation/Hospital/screens/success_hospital.dart';
import 'package:blood_donation/services/firebaseServices.dart';
import 'package:blood_donation/widgets/button_ui.dart';
import 'package:blood_donation/widgets/textfield_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class requestScreen extends StatefulWidget {
  const requestScreen({super.key});

  @override
  State<requestScreen> createState() => _requestScreenState();
}

class _requestScreenState extends State<requestScreen> {
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  final one = TextEditingController();
  final two = TextEditingController();
  final three = TextEditingController();
  Firebaseservices fs = Firebaseservices();

  @override
  Widget build(BuildContext context) {
    Firebaseservices fs = Firebaseservices();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FocusScope(
      node: _focusScopeNode,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.05),
                          child: Text(
                            'Request Donations',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: height * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Divider(
                      color: Colors.black, // Color of the divider
                      thickness: 1, // Thickness of the divider
                      indent: 16, // Left spacing
                      endIndent: 16, // Right spacing
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    MyTextField(
                      controller: one,
                      inputIcon: const Icon(null),
                      hintText: 'Hospital Name/Place',
                      obscure: false,
                      type: TextInputType.name,
                      height: height * 0.06,
                      width: width * 0.86,
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {
                        _focusScopeNode.unfocus();
                      },
                      child: Container(
                        height: height * 0.06,
                        width: width * 0.86,
                        child: DropdownButtonFormField<String>(
                          value: two.text.isNotEmpty ? two.text : null,
                          hint: Text(
                            'Select blood type',
                            style: TextStyle(
                              color: Color.fromARGB(255, 114, 114, 114),
                            ),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              two.text = newValue ?? '';
                            });
                          },
                          items: <String>[
                            'A+',
                            'A-',
                            'B+',
                            'B-',
                            'AB+',
                            'AB-',
                            'O+',
                            'O-'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            // suffixIcon: const Icon(Icons.bloodtype),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 114, 114, 114)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xffC62C2C)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    MyTextField(
                      controller: three,
                      inputIcon: const Icon(null),
                      hintText: 'Contact number',
                      obscure: false,
                      type: TextInputType.name,
                      height: height * 0.06,
                      width: width * 0.86,
                    ),
                    SizedBox(
                      height: height * 0.45,
                    ),
                    MyButton(
                      onTap: () {
                        if (one.text.isEmpty ||
                            two.text.isEmpty ||
                            three.text.isEmpty) {
                          fs.showErrorDialog(
                              context, "enter all fields", "empty");
                        } else {
                          fs.addHospitalRequest(one.text, three.text, two.text);
                        }
                      },
                      textColor: const Color(0xffffffff),
                      backgroungColor: const Color(0xffC62C2C),
                      borderColor: const Color(0xffC62C2C),
                      text: 'Request',
                      height: height * 0.07,
                      width: width * 0.86,
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
