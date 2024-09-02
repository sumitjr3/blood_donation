import 'package:blood_donation/Hospital/screens/success_hospital.dart';
import 'package:blood_donation/services/firebaseServices.dart';
import 'package:blood_donation/widgets/button_ui.dart';
import 'package:blood_donation/widgets/textfield_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class donateScreen extends StatefulWidget {
  const donateScreen({super.key});

  @override
  State<donateScreen> createState() => _donateScreenState();
}

class _donateScreenState extends State<donateScreen> {
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  Firebaseservices fs = Firebaseservices();
  final one = TextEditingController();
  final two = TextEditingController();
  final three = TextEditingController();
  final four = TextEditingController();
  final five = TextEditingController();
  final six = TextEditingController();
  final seven = TextEditingController();
  final eight = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String? email;
  String? location;
  String? mobile;
  Future<DateTime?> _selectDate(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
  }

  void getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('user_email');
    mobile = prefs.getString('user_mobile');
    location = prefs.getString('user_location');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FocusScope(
      node: _focusScopeNode,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   height: height,
              //   width: width,
              //   child: SvgPicture.asset(
              //     'lib/assets/12.svg',
              //     fit: BoxFit.fill,
              //   ),
              // ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.085),
                    child: Text(
                      'Donate',
                      style: TextStyle(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff111111)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.085),
                    child: Text(
                      'Fill Details',
                      style: TextStyle(
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff111111)),
                    ),
                  ),
                ],
              ),

              // Padding(
              //   padding: EdgeInsets.only(left: width * 0.05),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text(
              //         '',
              //         style: TextStyle(
              //             color: const Color(0xffffffff),
              //             fontSize: height * 0.0159),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                // height: height * 0.9,
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
                      height: height * 0.04,
                    ),
                    //one
                    Container(
                      child: MyTextField(
                        controller: one,
                        inputIcon: const Icon(null),
                        hintText: 'name',
                        obscure: false,
                        type: TextInputType.name,
                        height: height * 0.06,
                        width: width * 0.86,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    //two
                    Container(
                      child: MyTextField(
                        controller: two,
                        inputIcon: const Icon(null),
                        hintText: 'address',
                        obscure: false,
                        type: TextInputType.name,
                        height: height * 0.06,
                        width: width * 0.86,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    //three
                    GestureDetector(
                      onTap: () {
                        _focusScopeNode.unfocus();
                      },
                      child: Container(
                        height: height * 0.06,
                        width: width * 0.86,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: DropdownButtonFormField<String>(
                            value: three.text.isNotEmpty ? three.text : null,
                            hint: Text(
                              'blood type',
                              style: TextStyle(
                                color: Color.fromARGB(255, 114, 114, 114),
                              ),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                three.text = newValue ?? '';
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
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(0.2),
                    //         spreadRadius: 2,
                    //         blurRadius: 2,
                    //         offset: const Offset(0, 1),
                    //       ),
                    //     ],
                    //   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //four
                        Container(
                          width: width * 0.41,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromARGB(255, 114, 114, 114),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: height * 0.015),
                            child: TextFormField(
                              readOnly: true,
                              onChanged: (value) {
                                setState(() {
                                  four.text =
                                      _selectedDate.toString().substring(0, 10);
                                });
                              },
                              onTap: () async {
                                final selectedDate = await _selectDate(context);
                                if (selectedDate != null) {
                                  setState(() {
                                    _selectedDate = selectedDate;
                                    four.text = _selectedDate
                                        .toString()
                                        .substring(0, 10);
                                  });
                                }
                              },
                              controller: four,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a date';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "DOB",
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 114, 114, 114),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        //five
                        GestureDetector(
                          onTap: () {
                            _focusScopeNode.unfocus();
                          },
                          child: Container(
                            height: height * 0.06,
                            width: width * 0.41,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: DropdownButtonFormField<String>(
                                value: five.text.isNotEmpty ? five.text : null,
                                hint: Text(
                                  'Gender',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 114, 114, 114),
                                  ),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    five.text = newValue ?? '';
                                  });
                                },
                                items: <String>[
                                  'Male',
                                  'Female',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 114, 114, 114)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xffC62C2C)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //six
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: MyTextField(
                              controller: six,
                              inputIcon: Icon(null),
                              hintText: 'Height(cm)',
                              obscure: false,
                              type: TextInputType.number,
                              height: height * 0.06,
                              width: width * 0.41),
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        //seven
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: MyTextField(
                              controller: seven,
                              inputIcon: Icon(null),
                              hintText: 'Weight(kg)',
                              obscure: false,
                              type: TextInputType.number,
                              height: height * 0.06,
                              width: width * 0.41),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    //eight
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: MyTextField(
                          controller: eight,
                          inputIcon: Icon(null),
                          hintText: 'Any ailment? if yes, state',
                          obscure: false,
                          type: TextInputType.text,
                          height: height * 0.06,
                          width: width * 0.86),
                    ),
                    SizedBox(
                      height: height * 0.15,
                    ),

                    MyButton(
                        onTap: () {
                          if (one.text.isEmpty ||
                              two.text.isEmpty ||
                              three.text.isEmpty ||
                              four.text.isEmpty ||
                              five.text.isEmpty ||
                              six.text.isEmpty ||
                              seven.text.isEmpty ||
                              eight.text.isEmpty) {
                            fs.showErrorDialog(
                                context, "enter all fields", "empty");
                          } else {
                            fs.donateFunction(
                                three.text, one.text, location, email, mobile);
                          }
                        },
                        textColor: const Color(0xffffffff),
                        backgroungColor: const Color(0xffC62C2C),
                        borderColor: const Color(0xffC62C2C),
                        text: 'Donate',
                        height: height * 0.07,
                        width: width * 0.86)
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
