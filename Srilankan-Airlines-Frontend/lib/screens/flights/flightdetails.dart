import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srilankan_airline/provider/flightplane_provider.dart';

class FlightDetails extends StatefulWidget {
  const FlightDetails({Key? key}) : super(key: key);

  @override
  _FlightDetailsState createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Image.network(
                context.read<FlightPlaneProvider>().getplaneImg()),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.read<FlightPlaneProvider>().getplaneNo(),
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container()),
                  Text(
                    context.read<FlightPlaneProvider>().getfrom() + "---",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF0064D4),
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.airplanemode_active,
                    color: Color(0xFF0064D4),
                  ),
                  Text(
                    "---" + Provider.of<FlightPlaneProvider>(context).to,
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF0064D4),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Departure",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        context
                            .read<FlightPlaneProvider>()
                            .getdeparture()
                            .toString()
                            .substring(0, 10),
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Arrival",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        context
                            .read<FlightPlaneProvider>()
                            .getarrival()
                            .toString()
                            .substring(0, 10),
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Gate",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    context.read<FlightPlaneProvider>().getgate(),
                    style: TextStyle(fontSize: 16),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
