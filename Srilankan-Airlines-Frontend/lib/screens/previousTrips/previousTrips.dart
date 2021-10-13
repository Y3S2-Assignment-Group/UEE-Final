import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:srilankan_airline/model/user_model.dart';
import 'package:srilankan_airline/model/user_previous_trips_model.dart';
import 'package:srilankan_airline/modules/BottomNavigation.dart';
import 'package:srilankan_airline/provider/user_previous_trips_provider.dart';
import 'package:srilankan_airline/provider/user_provider.dart';

class previousTrips extends StatefulWidget {
  const previousTrips({Key? key}) : super(key: key);

  @override
  _previousTripsState createState() => _previousTripsState();
}

class _previousTripsState extends State<previousTrips> {
  late Future<List<PreviousTrips?>> previousTripsList;

  @override
  void initState() {
    previousTripsList =
        context.read<UserPreviousTripProvider>().getUserPreviousTripsList();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Trip summary",
                style: TextStyle(color: Color(0xFF969696), fontSize: 20),
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
                      context.read<UserProvider>().getDeparture().split(" ")[0],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      context
                          .read<UserProvider>()
                          .getDeparturetime()
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
                      context.read<UserProvider>().getArival().split(" ")[0],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      context
                          .read<UserProvider>()
                          .getArivaltime()
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
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 5, //spread radius
                    blurRadius: 7,
                  )
                ]),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            height: 400,
            width: 500,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Expanded(
              child: Column(
                children: [
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/econnecteee.appspot.com/o/WhatsApp%20Image%202021-09-16%20at%207.25.32%20PM.jpeg?alt=media&token=f93cff9d-dfdb-487f-8070-1714b594cd48',
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
                            context
                                .read<UserProvider>()
                                .getFlightID()
                                .substring(0, 3),
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
                            context
                                .read<UserProvider>()
                                .getDeparturetime()
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Arival",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF999999)),
                            ),
                            Text(
                              context
                                  .read<UserProvider>()
                                  .getArivaltime()
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
                            context.read<UserProvider>().getGate(),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Customer",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF999999)),
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
                            // ),
                            Text(
                              context.read<UserProvider>().getCustomerName(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF717280),
                                  fontSize: 20),
                            ),
                          ]),
                    ],
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Color(0xFFF7F7F7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 5, //spread radius
                    blurRadius: 7,
                  )
                ]),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigation(selIndex: 3),
    );
  }
}
