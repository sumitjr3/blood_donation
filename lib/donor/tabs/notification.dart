import 'package:blood_donation/services/firebaseServices.dart';
import 'package:blood_donation/widgets/customHospitalList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class notificationScreen extends StatefulWidget {
  const notificationScreen({super.key});

  @override
  State<notificationScreen> createState() => _notificationScreenState();
}

class _notificationScreenState extends State<notificationScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            // Use Expanded here
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
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
                          'Request ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.01),
                        child: Text(
                          'for Donation!',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Divider(
                    color: Colors.black, // Color of the divider
                    thickness: 1, // Thickness of the divider
                    indent: 16, // Left spacing
                    endIndent: 16, // Right spacing
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: Firebaseservices().getHospitalNote(),
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
                                String blood = data['blood group'];
                                String mobile = data['mobile'];

                                return GestureDetector(
                                  onTap: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Call'),
                                        content: Text("call $mobile"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('No'),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                          ),
                                          TextButton(
                                            child: const Text('Yes'),
                                            onPressed: () async {
                                              await FlutterPhoneDirectCaller
                                                  .callNumber(mobile);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.03,
                                        right: width * 0.03,
                                        bottom: width * 0.03),
                                    child: Customhospitallist(
                                      name: name,
                                      bloodGroup: blood,
                                      number: mobile,
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
                              child: Text('No requests yet'),
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
        //   ),
        // ],
      ),
    );
  }
}
