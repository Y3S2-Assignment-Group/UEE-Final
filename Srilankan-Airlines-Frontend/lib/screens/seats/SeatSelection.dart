import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:srilankan_airline/provider/customer_provider.dart';
import 'package:srilankan_airline/provider/flights_provider.dart';
import 'package:srilankan_airline/screens/bookflight/flightbook.dart';
import 'package:srilankan_airline/screens/seats/BuildSeats.dart';
import '../../Util/colors.dart' as color;

class SeatSelection extends StatefulWidget {
  const SeatSelection({Key? key}) : super(key: key);

  @override
  _SeatSelectionState createState() => _SeatSelectionState();
}

class _SeatSelectionState extends State<SeatSelection> {
  void bookFlight() {
    context
        .read<CustomerProvider>()
        .bookflight(context.read<FlightProvider>().getFlightGetter().id);
    Navigator.pushNamed(context, '/');
  }

  List<List<int>> _chairStatus = [
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1]
  ];

  @override
  void initState() {
    super.initState();
    _chairStatus = context.read<FlightProvider>().getFlightGetter().seats;
  }

  Widget _seatList() {
    Size size = MediaQuery.of(context).size;

    // 1 is free seats
    // 2 is selected seats
    // 3 is reserved seats

    return Column(
      children: <Widget>[
        for (int i = 0; i < 11; i++)
          Container(
            // color: Colors.red,

            margin: EdgeInsets.only(
                top: (i == 3 || i == 7) ? size.height * .02 : 0),
            child: Row(
              children: <Widget>[
                for (int x = 0; x < 9; x++)
                  Expanded(
                    // flex: x == 0 || x == 8 ? 2 : 1,
                    child: x == 0 ||
                            x == 8 ||
                            (i == 0 && x == 1) ||
                            (i == 0 && x == 7) ||
                            (x == 4)
                        ? Container()
                        : Container(
                            height: size.width / 11 - 10,
                            margin: EdgeInsets.all(5),
                            child: _chairStatus[i][x - 1] == 1
                                ? InkWell(
                                    child: BuildChairs.availableChair(),
                                    onTap: () {
                                      setState(() {
                                        this._chairStatus[i][x - 1] = 2;
                                      });

                                      context
                                          .read<FlightProvider>()
                                          .setSeatsList(_chairStatus);
                                      print(_chairStatus);
                                    },
                                  )
                                : _chairStatus[i][x - 1] == 2
                                    ? InkWell(
                                        child: BuildChairs.selectedChair(),
                                        onTap: () {
                                          setState(() {
                                            context
                                                .read<FlightProvider>()
                                                .setSeatsList(_chairStatus);
                                            this._chairStatus[i][x - 1] = 1;
                                          });
                                        },
                                      )
                                    : BuildChairs.reservedChair(),
                          ),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 450,
              decoration: BoxDecoration(
                  // color: Color(0xFFE8E8E8),
                  border: Border.all(color: Colors.blueAccent, width: 5),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 30, bottom: 30, left: 20, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome ! to your seat",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(6.0)),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Selected Seats: ")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(6.0)),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Available Seats: ")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(6.0)),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Unavailable Seats: ")
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/planeSeat.png",
                          width: 150.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Container(
                //height: 500,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                        topRight: Radius.circular(200),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    _seatList(),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
