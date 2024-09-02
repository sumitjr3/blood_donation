import 'package:blood_donation/services/firebaseServices.dart';
import 'package:blood_donation/signup_details2.dart';
import 'package:blood_donation/widgets/button_ui.dart';
import 'package:blood_donation/widgets/textfield_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class signupDetails1 extends StatefulWidget {
  const signupDetails1({super.key});

  @override
  State<signupDetails1> createState() => _signupDetails1State();
}

class _signupDetails1State extends State<signupDetails1> {
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  DateTime _selectedDate = DateTime.now();

  final one = TextEditingController();
  final two = TextEditingController();
  final three = TextEditingController();
  final four = TextEditingController();
  final five = TextEditingController();
  final six = TextEditingController();
  final seven = TextEditingController();
  final eight = TextEditingController();
  bool acceptTerms = false;

  Future<DateTime?> _selectDate(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Firebaseservices fs = Firebaseservices();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Handling Get.arguments safely
    final Map<String, dynamic>? arguments = Get.arguments;
    final email = arguments?['email'] ?? '';
    final password = arguments?['password'] ?? '';

    return FocusScope(
      node: _focusScopeNode,
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Padding(
          padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(left: width * 0.08),
                    //   child: SvgPicture.asset(
                    //     'lib/assets/5.svg',
                    //     height: height * 0.1,
                    //     width: height * 0.1,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    Text(''),
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
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      controller: one,
                      inputIcon: const Icon(Icons.abc),
                      hintText: "First Name",
                      obscure: false,
                      type: TextInputType.name,
                      height: height * 0.07,
                      width: width * 0.40,
                    ),
                    MyTextField(
                      controller: two,
                      inputIcon: const Icon(Icons.abc),
                      hintText: "Last Name",
                      obscure: false,
                      type: TextInputType.name,
                      height: height * 0.07,
                      width: width * 0.40,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                MyTextField(
                  controller: three,
                  inputIcon: const Icon(Icons.phone),
                  hintText: "Enter phone number",
                  obscure: false,
                  type: TextInputType.phone,
                  height: height * 0.07,
                  width: width * 0.86,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                MyTextField(
                  controller: four,
                  inputIcon: const Icon(Icons.email),
                  hintText: "Enter email",
                  obscure: false,
                  type: TextInputType.emailAddress,
                  height: height * 0.07,
                  width: width * 0.86,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                // MyTextField(
                //   controller: five,
                //   inputIcon: const Icon(Icons.person),
                //   hintText: "Male or female",
                //   obscure: false,
                //   type: TextInputType.name,
                //   height: height * 0.07,
                //   width: width * 0.86,
                // ),
                GestureDetector(
                  onTap: () {
                    _focusScopeNode.unfocus();
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.86,
                    child: DropdownButtonFormField<String>(
                      value: five.text.isNotEmpty ? five.text : null,
                      hint: Text(
                        'Male or Female',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 114, 114, 114),
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
                        suffixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 114, 114, 114)),
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
                  height: height * 0.02,
                ),
                // MyTextField(
                //   controller: six,
                //   inputIcon: const Icon(Icons.calendar_month),
                //   hintText: "Enter your birthdate",
                //   obscure: false,
                //   type: TextInputType.datetime,
                //   height: height * 0.07,
                //   width: width * 0.86,
                // ),
                Container(
                  width: width * 0.86,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 114, 114, 114),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: height * 0.015),
                    child: TextFormField(
                      readOnly: true,
                      onChanged: (value) {
                        setState(() {
                          six.text = _selectedDate.toString().substring(0, 10);
                        });
                      },
                      onTap: () async {
                        final selectedDate = await _selectDate(context);
                        if (selectedDate != null) {
                          setState(() {
                            _selectedDate = selectedDate;
                            six.text =
                                _selectedDate.toString().substring(0, 10);
                          });
                        }
                      },
                      controller: six,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a date';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_month),
                        border: InputBorder.none,
                        hintText: "your birthday",
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 114, 114, 114),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    _focusScopeNode.unfocus();
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.86,
                    child: DropdownButtonFormField<String>(
                      value: seven.text.isNotEmpty ? seven.text : null,
                      hint: Text(
                        'Select location',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 114, 114, 114),
                        ),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          seven.text = newValue ?? '';
                        });
                      },
                      items: <String>[
                        'Agra',
                        'Ahmedabad',
                        'Ajmer',
                        'Aligarh',
                        'Allahabad',
                        'Amravati',
                        'Amritsar',
                        'Asansol',
                        'Aurangabad',
                        'Bareilly',
                        'Belgaum',
                        'Bengaluru',
                        'Bhavnagar',
                        'Bhiwandi',
                        'Bhopal',
                        'Bhubaneswar',
                        'Bikaner',
                        'Bokaro Steel City',
                        'Chandigarh',
                        'Chennai',
                        'Coimbatore',
                        'Cuttack',
                        'Dehradun',
                        'Delhi',
                        'Dhanbad',
                        'Durgapur',
                        'Erode',
                        'Faridabad',
                        'Firozabad',
                        'Ghaziabad',
                        'Gorakhpur',
                        'Gulbarga',
                        'Guntur',
                        'Gurgaon',
                        'Guwahati',
                        'Gwalior',
                        'Hubballi-Dharwad',
                        'Hyderabad',
                        'Indore',
                        'Jabalpur',
                        'Jaipur',
                        'Jalandhar',
                        'Jammu',
                        'Jamnagar',
                        'Jamshedpur',
                        'Jhansi',
                        'Jodhpur',
                        'Kalyan-Dombivli',
                        'Kanpur',
                        'Kochi',
                        'Kolhapur',
                        'Kolkata',
                        'Kozhikode',
                        'Kurnool',
                        'Loni',
                        'Lucknow',
                        'Ludhiana',
                        'Madurai',
                        'Maheshtala',
                        'Mangalore',
                        'Meerut',
                        'Moradabad',
                        'Mumbai',
                        'Mysore',
                        'Nagpur',
                        'Nanded',
                        'Nashik',
                        'Navi Mumbai',
                        'Noida',
                        'Patna',
                        'Pimpri-Chinchwad',
                        'Pune',
                        'Raipur',
                        'Rajahmundry',
                        'Rajkot',
                        'Rajpur Sonarpur',
                        'Ranchi',
                        'Saharanpur',
                        'Salem',
                        'Sangli-Miraj & Kupwad',
                        'Shimla',
                        'Siliguri',
                        'Solapur',
                        'Srinagar',
                        'Surat',
                        'Thane',
                        'Thiruvananthapuram',
                        'Tiruchirappalli',
                        'Tirunelveli',
                        'Tirupati',
                        'Udaipur',
                        'Ujjain',
                        'Vadodara',
                        'Varanasi',
                        'Vasai-Virar',
                        'Vijayawada',
                        'Visakhapatnam',
                        'Warangal',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.location_on),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 114, 114, 114)),
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
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    _focusScopeNode.unfocus();
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.86,
                    child: DropdownButtonFormField<String>(
                      value: eight.text.isNotEmpty ? eight.text : null,
                      hint: Text(
                        'Select blood group',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 114, 114, 114),
                        ),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          eight.text = newValue ?? '';
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
                        suffixIcon: const Icon(Icons.bloodtype),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 114, 114, 114)),
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
                  height: height * 0.005,
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
                        'Accept terms and conditions',
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
                    _focusScopeNode.unfocus(); // Dismiss keyboard

                    // Validation
                    if (acceptTerms == false) {
                      fs.showErrorDialog(context,
                          "Please accept the terms and conditions", "Error");
                    } else if (one.text.isEmpty ||
                        two.text.isEmpty ||
                        three.text.isEmpty ||
                        four.text.isEmpty ||
                        five.text.isEmpty ||
                        six.text.isEmpty ||
                        seven.text.isEmpty ||
                        eight.text.isEmpty) {
                      fs.showErrorDialog(
                          context, 'Please fill in all fields', "Incomplete");
                    } else {
                      Get.to(
                        const signupDetails2(),
                        arguments: {
                          'email': email,
                          'password': password,
                          'mobile': three.text,
                          'location': seven.text,
                          'blood': eight.text,
                          'name': '${one.text} ${two.text}'
                        },
                      );
                    }
                  },
                  textColor: const Color(0xffffffff),
                  backgroungColor: const Color(0xffC62C2C),
                  borderColor: const Color(0xffC62C2C),
                  height: height * 0.06,
                  width: width * 0.86,
                  text: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
