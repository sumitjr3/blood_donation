import 'package:flutter/material.dart';

class customTile extends StatelessWidget {
  final String geo;
  final String name;
  final String bloodGroup;
  final String number;
  final String address;

  const customTile(
      {super.key,
      required this.geo,
      required this.name,
      required this.bloodGroup,
      required this.number,
      required this.address});

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: (Height * 0.17),
      width: (width * 0.9),
      // ignore: sort_child_properties_last
      child: Padding(
        padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: Height * 0.01,
            bottom: Height * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: Height * 0.022, fontWeight: FontWeight.bold),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact',
                      style: TextStyle(fontSize: Height * 0.015),
                    ),
                    Text(
                      number,
                      style: TextStyle(
                          fontSize: Height * 0.015,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Address',
                      style: TextStyle(fontSize: Height * 0.015),
                    ),
                    Text(
                      address,
                      style: TextStyle(
                          fontSize: Height * 0.015,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: Height * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'geo type',
                        style: TextStyle(fontSize: Height * 0.015),
                      ),
                      Text(
                        geo,
                        style: TextStyle(
                            fontSize: Height * 0.015,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Blood Group',
                        style: TextStyle(fontSize: Height * 0.015),
                      ),
                      Text(
                        bloodGroup,
                        style: TextStyle(
                            fontSize: Height * 0.015,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Height * 0.01),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffC62C2C),
                ),
                height: Height * 0.13,
                width: Height * 0.11,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      Text(
                        'CALL',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffC62C2C)),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
