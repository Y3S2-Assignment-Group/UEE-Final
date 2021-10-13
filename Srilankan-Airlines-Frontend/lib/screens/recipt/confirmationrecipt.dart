import 'package:flutter/material.dart';
import 'package:srilankan_airline/modules/BottomNavigation.dart';
import '../../Util/colors.dart' as color;

class recipt extends StatefulWidget {
  const recipt({Key? key}) : super(key: key);

  @override
  _reciptState createState() => _reciptState();
}

class _reciptState extends State<recipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        selIndex: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  width: 400,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Color(0xFFF1F3F7),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "22.02.2021",
                        style: TextStyle(color: Color(0xFFAEAEB2)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text("RECIEPT",
                              style: TextStyle(
                                  color: Color(0xFFAEAEB2),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Text(
                          "-------------------------------------",
                          style:
                              TextStyle(fontSize: 25, color: Color(0xFFAEAEB2)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Amount",
                            style: TextStyle(
                                color: Color(0xFFAEAEB2),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "RS 20,000.00",
                            style: TextStyle(
                                color: Color(0xFFAEAEB2),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Service fee",
                            style: TextStyle(
                                color: Color(0xFFAEAEB2),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "RS 200.00",
                            style: TextStyle(
                                color: Color(0xFFAEAEB2),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Amount",
                            style: TextStyle(
                                color: Color(0xFFAEAEB2),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "RS 100.00",
                            style: TextStyle(
                                color: Color(0xFFAEAEB2),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "-------------------------------------",
                          style:
                              TextStyle(fontSize: 25, color: Color(0xFFAEAEB2)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Amount",
                            style: TextStyle(
                                color: Color(0xFFB6B6BA),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "RS 20,300.00",
                            style: TextStyle(
                                color: Color(0xFFB6B6BA),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "-------------------------------------",
                          style:
                              TextStyle(fontSize: 25, color: Color(0xFFAEAEB2)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          ":|-----------Enjoy Your Trip-----------|:",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFFAEAEB2)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Material(
                          elevation: 2,
                          color: Color(0xFF65C4DE),
                          borderRadius: BorderRadius.circular(12.0),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            minWidth: 200.0,
                            height: 35.0,
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
