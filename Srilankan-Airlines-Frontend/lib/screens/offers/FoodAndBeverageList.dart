import 'package:flutter/material.dart';

class FoodAndBeverageList extends StatefulWidget {
  const FoodAndBeverageList({Key? key}) : super(key: key);

  @override
  _FoodAndBeverageListState createState() => _FoodAndBeverageListState();
}

class _FoodAndBeverageListState extends State<FoodAndBeverageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                    "Note: This offer is only valid until the seasonal period and the flights that are booked within the period cannot be rescheduled",
                    style: TextStyle(fontSize: 17, color: Colors.grey)),
                SizedBox(
                  height: 30,
                )
              ],
            )),
      ),
    );
  }
}
