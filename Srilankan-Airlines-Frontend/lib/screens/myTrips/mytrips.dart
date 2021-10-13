import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:srilankan_airline/model/user_current_trip.dart';
import 'package:srilankan_airline/model/user_previous_trips_model.dart';
import 'package:srilankan_airline/provider/user_current_trip_provider.dart';
import 'package:srilankan_airline/provider/user_previous_trips_provider.dart';
import 'package:srilankan_airline/provider/user_provider.dart';
import 'package:srilankan_airline/widgets/appbar.dart';
import '../../Util/colors.dart' as color;
import 'package:provider/provider.dart';

class myTrips extends StatefulWidget {
  myTrips({Key? key}) : super(key: key);

  @override
  _myTripsState createState() => _myTripsState();
}

class _myTripsState extends State<myTrips> {
  late Future<List<PreviousTrips?>> previousTripList;
  late Future<UserCurrentTrip?> currentTrip;

  @override
  void initState() {
    super.initState();
    previousTripList =
        context.read<UserPreviousTripProvider>().getUserPreviousTripsList();
    currentTrip = context.read<UserCurrentTripProvider>().getUserCurrentTrip();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder<List<PreviousTrips?>>(
      future: previousTripList,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
              height: size.height,
              child: Center(
                child:
                    Lottie.asset('assets/images/appbarlottie.json', width: 80),
              ));
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      appbar(),
                      Text(
                        "Previous Trips",
                        style: TextStyle(fontSize: 20),
                      ),
                      previousTripsList(entries: snapshot.data!),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Current Trips",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FutureBuilder<UserCurrentTrip?>(
                          future: currentTrip,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Container(
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("No Current Trip Available")
                                      ]),
                                ),
                              );
                            } else {
                              return CurrentTrips(singleTrip: snapshot.data!);
                            }
                          })
                      //CurrentTrips(singleTrip: snapshot.data!)
                    ]),
              ),
            ],
          );
        }
      },
    ));
  }
}

class previousTripsList extends StatelessWidget {
  const previousTripsList({
    Key? key,
    required this.entries,
  }) : super(key: key);

  final List<PreviousTrips?> entries;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Expanded(
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  color: Colors.black,
                ),
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              if (entries.length == 0) {
                return Container(
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Text("No Previous Trips Available")]),
                  ),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFE4E4E4),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () {},
                    title: Container(
                      margin: EdgeInsets.only(bottom: 2, top: 2),
                      height: 100,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                entries[index]!.flight.from.split(" ")[0] +
                                    " - " +
                                    entries[index]!.flight.to.split(" ")[0],
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                entries[index]!
                                    .flight
                                    .arrival
                                    .toString()
                                    .substring(0, 10),
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<UserProvider>()
                                    .setArival(entries[index]!.flight.to);
                                context.read<UserProvider>().setArivaltime(
                                    entries[index]!.flight.arrival.toString());
                                context
                                    .read<UserProvider>()
                                    .setDeparture(entries[index]!.flight.from);
                                context.read<UserProvider>().setDeparturetime(
                                    entries[index]!
                                        .flight
                                        .departure
                                        .toString());
                                context
                                    .read<UserProvider>()
                                    .setGate(entries[index]!.flight.gate);
                                context
                                    .read<UserProvider>()
                                    .setFlightID(entries[index]!.id);
                                context
                                    .read<UserProvider>()
                                    .setFlightID(entries[index]!.id);
                                Navigator.pushNamed(context, '/previousTrips');
                              },
                              icon: Icon(
                                Icons.flight,
                                color: color.AppColor.buttonColor,
                                size: 40,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}

class CurrentTrips extends StatelessWidget {
  const CurrentTrips({
    Key? key,
    required this.singleTrip,
  }) : super(key: key);

  final UserCurrentTrip singleTrip;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFE4E4E4), borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      singleTrip.flight.from.split(" ")[0],
                      style: TextStyle(
                          color: color.AppColor.buttonColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      singleTrip.flight.departure
                          .toIso8601String()
                          .toString()
                          .substring(0, 10),
                      style: TextStyle(
                          color: color.AppColor.buttonColor, fontSize: 20),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "...",
                      style: TextStyle(
                          color: color.AppColor.buttonColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.flight,
                      color: color.AppColor.buttonColor,
                      size: 40,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "...",
                      style: TextStyle(
                          color: color.AppColor.buttonColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      singleTrip.flight.to.split(" ")[0],
                      style: TextStyle(
                          color: color.AppColor.buttonColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      singleTrip.flight.arrival
                          .toIso8601String()
                          .toString()
                          .substring(0, 10),
                      style: TextStyle(
                          color: color.AppColor.buttonColor, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flight",
                      style: TextStyle(color: Color(0xFF868686), fontSize: 12),
                    ),
                    Text(
                      singleTrip.flight.id.substring(0, 4),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3A3A3A),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Depature",
                      style: TextStyle(color: Color(0xFF868686), fontSize: 12),
                    ),
                    Text(
                      singleTrip.flight.departure
                          .toIso8601String()
                          .toString()
                          .substring(11, 16),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3A3A3A),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gate",
                      style: TextStyle(color: Color(0xFF868686), fontSize: 12),
                    ),
                    Text(
                      singleTrip.flight.gate,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3A3A3A),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Seat",
                      style: TextStyle(color: Color(0xFF868686), fontSize: 12),
                    ),
                    Text(
                      singleTrip.seatNo,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3A3A3A),
                      ),
                    ),
                  ],
                ),
              ],
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
                    Navigator.pushNamed(context, '/checkin');
                  },
                  minWidth: 200.0,
                  height: 30.0,
                  child: Text(
                    "Checkin",
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
      ),
    );
  }
}
