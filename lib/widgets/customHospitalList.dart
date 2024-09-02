import 'package:flutter/material.dart';

class Customhospitallist extends StatelessWidget {
  final String name;
  final String bloodGroup;
  final String number;

  const Customhospitallist({
    super.key,
    required this.name,
    required this.bloodGroup,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: (Height * 0.11),
      width: (width * 0.9),
      // ignore: sort_child_properties_last
      child: Padding(
        padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: Height * 0.02,
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
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontSize: Height * 0.02, fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Blood Group ',
                      style: TextStyle(fontSize: Height * 0.016),
                    ),
                    Text(
                      bloodGroup,
                      style: TextStyle(
                          fontSize: Height * 0.018,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: Height * 0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffC62C2C),
                ),
                height: Height * 0.1,
                width: Height * 0.17,
                child: const Center(
                  child: Row(
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
