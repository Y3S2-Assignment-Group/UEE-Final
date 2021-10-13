import 'package:flutter/material.dart';
import 'package:srilankan_airline/modules/BottomNavigation.dart';
import 'package:srilankan_airline/screens/seats/SeatSelection.dart';
import 'package:srilankan_airline/widgets/appbar.dart';
import '../../Util/colors.dart' as color;

class Seats extends StatefulWidget {
  const Seats({Key? key}) : super(key: key);

  @override
  _SeatsState createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(selIndex: 1),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          appbar(),
          SizedBox(
            height: 10,
          ),
          Expanded(
              //height: 1000,
              //padding: EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SeatSelection(),
          )),
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
                  Navigator.pushNamed(context, '/payment');
                },
                minWidth: 200.0,
                height: 45.0,
                child: Text(
                  "Book",
                  style: TextStyle(
                      color: color.AppColor.buttonTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
