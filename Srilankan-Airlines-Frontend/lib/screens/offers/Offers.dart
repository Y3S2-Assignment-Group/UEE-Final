import 'package:flutter/material.dart';
import 'package:srilankan_airline/modules/BottomNavigation.dart';
import 'package:srilankan_airline/screens/offers/offerlist.dart';
import '../../Util/colors.dart' as color;

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        selIndex: 1,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: Text(
                      "Offers",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.left,
                    // controller: password,
                    decoration: InputDecoration(
                        focusColor: color.AppColor.textFieldFocusColor,
                        labelText: "Search..",
                        prefixIcon: Icon(Icons.search),
                        hintStyle:
                            TextStyle(color: color.AppColor.textFieldHintColor),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.0)))),
                  ),
                ],
              ),
              height: 175,
            ),
            Expanded(
              child: Offerlist(),
            )
          ],
        ),
      ),
    );
  }
}
