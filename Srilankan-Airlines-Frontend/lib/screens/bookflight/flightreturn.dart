import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/src/provider.dart';
import 'package:srilankan_airline/model/flight_model.dart';
import 'package:srilankan_airline/provider/customer_provider.dart';
import 'package:srilankan_airline/provider/flights_provider.dart';
import '../../Util/colors.dart' as color;

class returnFlight extends StatefulWidget {
  returnFlight({Key? key}) : super(key: key);

  @override
  _returnFlightState createState() => _returnFlightState();
}

class _returnFlightState extends State<returnFlight> {
//date varibles
  DateTime dateDeparture = DateTime.now();
  DateTime dateArival = DateTime.now();

//Place variables
  int departureIndex = 0;
  int arivalIndex = 0;

  late Future<List<Flight>> flightList;
  late Future<Flight> flight;

  static List<String> departureDest = [
    'Colombo Srilanka',
  ];

  static List<String> arivalDest = [
    'Doha Quatar',
    'Kolkata India',
    'London England',
    'Toronto Canada',
    'Jakarta Indonisia',
    'Tokyo Japan',
  ];

  //class variables
  int classIndex = 0;

  static List<String> classSel = ['Economy', 'Business'];

  void bookAndMove() {
    context.read<CustomerProvider>().setArival(arivalDest[arivalIndex]);
    context
        .read<CustomerProvider>()
        .setDeparture(departureDest[departureIndex]);
    context.read<CustomerProvider>().setArivalDate(dateArival.toString());
    context.read<CustomerProvider>().setDepartureDate(dateDeparture.toString());
    context.read<CustomerProvider>().setFlightClass(classSel[classIndex]);

    print(context.read<CustomerProvider>().getArival());
    print(context.read<CustomerProvider>().getDeparture());
    print(context.read<CustomerProvider>().getDepartureDate());
    print(context.read<CustomerProvider>().getArivalDate());
    print(context.read<CustomerProvider>().getFlightClass());

    Navigator.pushNamed(context, '/seats');
  }

//date functions
  static void showSheet(BuildContext context,
          {required Widget child, required VoidCallback onClicked}) =>
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [child],
                cancelButton: CupertinoActionSheetAction(
                  child: Text('Done'),
                  onPressed: onClicked,
                ),
              ));

  Widget buildDatePickerDeparture() => SizedBox(
        height: 300,
        child: CupertinoDatePicker(
            initialDateTime: dateDeparture,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (pickedDate) {
              setState(() {
                this.dateDeparture = pickedDate;
              });
            }),
      );

  Widget buildDatePickerArival() => SizedBox(
        height: 300,
        child: CupertinoDatePicker(
            initialDateTime: dateArival,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (pickedDate) {
              setState(() {
                this.dateArival = pickedDate;
              });
            }),
      );

  //destination pickers
  Widget buildDeparturePicker() => SizedBox(
        height: 300,
        child: CupertinoPicker(
          itemExtent: 60,
          onSelectedItemChanged: (index) {
            setState(() {
              this.departureIndex = index;
            });
          },
          children: modelBuilder<String>(departureDest, (index, value) {
            return Center(
              child: Text(
                value,
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            );
          }),
        ),
      );

  Widget buildArivalPicker() => SizedBox(
        height: 300,
        child: CupertinoPicker(
          itemExtent: 60,
          onSelectedItemChanged: (index) {
            flight = context
                .read<FlightProvider>()
                .getFlightDetails(arivalDest[index]);
            setState(() {
              this.arivalIndex = index;
            });
          },
          children: modelBuilder<String>(arivalDest, (index, value) {
            return Center(
              child: Text(
                value,
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            );
          }),
        ),
      );

  //classSelPicker
  Widget buildClassPicker() => SizedBox(
        height: 300,
        child: CupertinoPicker(
          itemExtent: 60,
          onSelectedItemChanged: (index) {
            setState(() {
              this.classIndex = index;
            });
          },
          children: modelBuilder<String>(classSel, (index, value) {
            return Center(
              child: Text(
                value,
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            );
          }),
        ),
      );

  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  @override
  void initState() {
    flight = context.read<FlightProvider>().getFlightDetails("Doha Quatar");

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                  color: color.AppColor.cardColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: TextStyle(fontSize: 15),
                            ),
                            Row(
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    showSheet(context,
                                        child: buildDeparturePicker(),
                                        onClicked: () {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    "${departureDest[departureIndex]}",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: color.AppColor.divider,
                      thickness: 1,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "To",
                              style: TextStyle(fontSize: 15),
                            ),
                            Row(
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    showSheet(context,
                                        child: buildArivalPicker(),
                                        onClicked: () {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    "${arivalDest[arivalIndex]}",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                  color: color.AppColor.cardColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      FutureBuilder<Flight>(
                          future: flight,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                  ),
                                  Lottie.asset(
                                      'assets/images/appbarlottie.json',
                                      width: 80),
                                  SizedBox(
                                    width: 50,
                                  ),
                                ],
                              );
                            } else {
                              return Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Departure",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        CupertinoButton(
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            showSheet(context,
                                                child:
                                                    buildDatePickerDeparture(),
                                                onClicked: () {
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text(
                                            snapshot.data!.departure
                                                .toString()
                                                .substring(0, 10),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Return",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        CupertinoButton(
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            showSheet(context,
                                                child: buildDatePickerArival(),
                                                onClicked: () {
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text(
                                            snapshot.data!.arrival
                                                .toString()
                                                .substring(0, 10),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ));
                            }
                          })
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: color.AppColor.divider,
                      thickness: 1,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    showSheet(context,
                                        child: buildClassPicker(),
                                        onClicked: () {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    "${classSel[classIndex]}",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          // FutureBuilder<List<Flight>>(
          //         future: flightList,
          //         builder: (context, snapshot) {
          //           if (snapshot.hasData) {
          //             // ignore: avoid_print
          //             return Text(snapshot.data![0].arrival);~~
          //           } else if (snapshot.hasError) {
          //             return Text('data');
          //           }
          //           return const Text('');
          //         }),

          Center(
            child: Material(
              elevation: 2,
              color: color.AppColor.buttonColor,
              borderRadius: BorderRadius.circular(12.0),
              child: MaterialButton(
                onPressed: bookAndMove,
                minWidth: 200.0,
                height: 45.0,
                child: Text(
                  "Book Flight",
                  style: TextStyle(
                      color: color.AppColor.buttonTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
