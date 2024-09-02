import 'package:blood_donation/services/firebaseServices.dart';
import 'package:blood_donation/widgets/button_ui.dart';
import 'package:blood_donation/widgets/button_ui2.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class callDonor extends StatefulWidget {
  const callDonor({super.key});

  @override
  State<callDonor> createState() => _callDonorState();
}

class _callDonorState extends State<callDonor> {
  List<String> names = [
    'Sumit',
    'Yash',
    'Gautam',
    'Meet',
    'Heet',
    'Dhruv',
    'Shahil',
    'Keshav',
    'Aditya',
    'Harsh'
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              'lib/assets/12.svg',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.05,
                  ),
                  const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xffffffff),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.0),
                        child: Text(
                          'Call Donor',
                          style: TextStyle(
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffffffff)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'select from the list of donors to contact',
                      style: TextStyle(
                          color: const Color(0xffffffff),
                          fontSize: height * 0.0159),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: height * 0.843,
                decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: StreamBuilder<QuerySnapshot>(
                  stream: Firebaseservices().getUserNote(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List noteslist = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: noteslist.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot document = noteslist[index];
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          String name = data['name'];

                          String mobile = data['mobile'];

                          return Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.05, right: width * 0.05),
                            child: SizedBox(
                              height: height * 0.15,
                              width: width * 0.86,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.05),
                                          child: Text(
                                            name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: height * 0.02),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        MyButton2(
                                            onTap: () => showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: const Text('Call'),
                                                      content:
                                                          Text("call $mobile"),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child:
                                                              const Text('No'),
                                                          onPressed: () =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(),
                                                        ),
                                                        TextButton(
                                                          child:
                                                              const Text('Yes'),
                                                          onPressed: () async {
                                                            await FlutterPhoneDirectCaller
                                                                .callNumber(
                                                                    mobile);
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                            textColor: const Color(0xffffffff),
                                            backgroungColor:
                                                const Color(0xffC62C2C),
                                            borderColor:
                                                const Color(0xffC62C2C),
                                            text: 'Call',
                                            height: height * 0.06,
                                            width: width * 0.40),
                                        MyButton2(
                                            onTap: () {},
                                            textColor: const Color(0xffC62C2C),
                                            backgroungColor:
                                                const Color(0xffffffff),
                                            borderColor:
                                                const Color(0xffC62C2C),
                                            text: 'Message',
                                            height: height * 0.06,
                                            width: width * 0.40),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text('no users yet'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
