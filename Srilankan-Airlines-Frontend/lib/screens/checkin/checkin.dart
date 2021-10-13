import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:srilankan_airline/model/user_current_trip.dart';
import 'package:srilankan_airline/model/user_model.dart';
import 'package:srilankan_airline/modules/BottomNavigation.dart';
import 'package:srilankan_airline/provider/user_current_trip_provider.dart';
import 'package:srilankan_airline/provider/user_provider.dart';
import 'package:srilankan_airline/screens/myTrips/mytrips.dart';
import '../../Util/colors.dart' as color;

class checkin extends StatefulWidget {
  const checkin({Key? key}) : super(key: key);

  @override
  _checkinState createState() => _checkinState();
}

class _checkinState extends State<checkin> {
  late Future<UserCurrentTrip?> currentTrip;
  late Future<User> user;

  @override
  void initState() {
    user = context.read<UserProvider>().getUserProfile();
    currentTrip = context.read<UserCurrentTripProvider>().getUserCurrentTrip();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: FutureBuilder<UserCurrentTrip?>(
              future: currentTrip,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    child: Center(
                      child:
                          Column(children: [Text("No Current Trip Available")]),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Check in",
                            style: TextStyle(
                                color: Color(0xFF969696), fontSize: 20),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                        height: 100,
                        padding: EdgeInsets.only(top: 30, left: 50, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  snapshot.data!.flight.from.split(" ")[0],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  snapshot.data!.flight.departure
                                      .toString()
                                      .substring(10, 16),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "...",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Icon(
                                      Icons.airplanemode_active,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      "...",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                            Column(
                              children: [
                                Text(
                                  snapshot.data!.flight.to.split(" ")[0],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  snapshot.data!.flight.arrival
                                      .toString()
                                      .substring(10, 16),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFF0064D4),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), //color of shadow
                                spreadRadius: 5, //spread radius
                                blurRadius: 7,
                              )
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        height: 450,
                        width: 500,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Flight",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF999999)),
                                    ),
                                    Text(
                                      snapshot.data!.flight.id.substring(0, 4),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF717280),
                                          fontSize: 25),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Departure",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF999999)),
                                    ),
                                    Text(
                                      snapshot.data!.flight.departure
                                          .toString()
                                          .substring(10, 16),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF717280),
                                          fontSize: 25),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Arival",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF999999)),
                                      ),
                                      Text(
                                        snapshot.data!.flight.departure
                                            .toString()
                                            .substring(10, 16),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFF717280),
                                            fontSize: 25),
                                      )
                                    ]),
                                SizedBox(
                                  width: 40,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gate",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF999999)),
                                    ),
                                    Text(
                                      snapshot.data!.flight.gate,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF717280),
                                          fontSize: 25),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Customer",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF999999)),
                                      ),
                                      Text(
                                        context
                                            .read<UserProvider>()
                                            .getCustomerName(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFF717280),
                                            fontSize: 20),
                                      ),
                                      // FutureBuilder<User>(
                                      //   future: user,
                                      //   builder: (context, snapshot) {
                                      //     return Text(snapshot.data!.name,
                                      //         style: TextStyle(
                                      //             fontWeight: FontWeight.w900,
                                      //             color: Color(0xFF717280),
                                      //             fontSize: 20));
                                      //   },
                                    ]),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                  focusColor:
                                      color.AppColor.textFieldFocusColor,
                                  labelText: "Passport number",
                                  prefixIcon: Icon(Icons.person),
                                  hintStyle: TextStyle(
                                      color: color.AppColor.textFieldHintColor),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.0)))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                  focusColor:
                                      color.AppColor.textFieldFocusColor,
                                  labelText: "eTicket number",
                                  prefixIcon:
                                      Icon(Icons.airplane_ticket_outlined),
                                  hintStyle: TextStyle(
                                      color: color.AppColor.textFieldHintColor),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.0)))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Material(
                                elevation: 2,
                                color: color.AppColor.buttonColor,
                                borderRadius: BorderRadius.circular(12.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    context
                                        .read<UserProvider>()
                                        .checkin(snapshot.data!.id);
                                    Navigator.pushNamed(context, '/home');
                                  },
                                  minWidth: 200.0,
                                  height: 45.0,
                                  child: Text(
                                    "Check In",
                                    style: TextStyle(
                                        color: color.AppColor.buttonTextColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), //color of shadow
                                spreadRadius: 5, //spread radius
                                blurRadius: 7,
                              )
                            ]),
                      ),
                    ],
                  );
                }
              })),
      bottomNavigationBar: BottomNavigation(selIndex: 3),
    );
  }
}
