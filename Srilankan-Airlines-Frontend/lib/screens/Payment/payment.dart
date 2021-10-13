import 'package:flutter/material.dart';
import 'package:srilankan_airline/modules/BottomNavigation.dart';
import 'package:srilankan_airline/provider/customer_provider.dart';
import 'package:srilankan_airline/provider/flights_provider.dart';
import '../../Util/colors.dart' as color;
import 'package:provider/src/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  String customerName = '';
  String cardNumber = '';
  String expirationDate = '';

  void completePayment() {
    print(customerName);
    print(cardNumber);
    print(expirationDate);

    if (cardNumber.length == 12) {
      String month = expirationDate.split("/")[0];
      String year = expirationDate.split("/")[1];

      if (month.length == 2 && year.length == 2) {
        context
            .read<CustomerProvider>()
            .bookflight(context.read<FlightProvider>().getFlightGetter().id);
        context.read<FlightProvider>().updateFlightSeast(
            context.read<FlightProvider>().getFlightGetter().id);
        Fluttertoast.showToast(
            msg: "Ticket booking successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
        Navigator.pushNamed(context, '/home');
      } else {
        Fluttertoast.showToast(
            msg: "Input the correct expiration date ex: 08/12",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Input the correct card number with 12 digits",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 65,
            ),
            Center(
              child: Text(
                "Online Payment",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Travel Card",
                    style: TextStyle(
                      color: Color(0xFFB2B2B6),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "4225   9765   0008   6141",
                    style: TextStyle(
                        color: Color(0xFFB2B2B6),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "DELUXE PACKAGE",
                    style: TextStyle(
                        color: Color(0xFFB2B2B6),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "DWAYNE JHONSON",
                    style: TextStyle(
                      color: Color(0xFFB2B2B6),
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Color(0xFFF1F3F7),
                  image: DecorationImage(
                    image: AssetImage("assets/images/birdiconlogin.png"),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text("Card holder's name")
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (ch) {
                  setState(() {
                    this.customerName = ch;
                  });
                },
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    focusColor: color.AppColor.textFieldFocusColor,
                    labelText: "Card holder name",
                    prefixIcon: Icon(Icons.person),
                    hintStyle:
                        TextStyle(color: color.AppColor.textFieldHintColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0)))),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text("Card number")
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.left,
                onChanged: (ch) {
                  setState(() {
                    this.cardNumber = ch;
                  });
                },
                decoration: InputDecoration(
                    focusColor: color.AppColor.textFieldFocusColor,
                    labelText: "Card number",
                    prefixIcon: Icon(Icons.credit_card),
                    hintStyle:
                        TextStyle(color: color.AppColor.textFieldHintColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0)))),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text("Expiration date")
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (ch) {
                  setState(() {
                    this.expirationDate = ch;
                  });
                },
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    focusColor: color.AppColor.textFieldFocusColor,
                    labelText: "08/22",
                    prefixIcon: Icon(Icons.credit_card),
                    hintStyle:
                        TextStyle(color: color.AppColor.textFieldHintColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0)))),
              ),
            ),
            Material(
              elevation: 2,
              color: color.AppColor.buttonColor,
              borderRadius: BorderRadius.circular(12.0),
              child: MaterialButton(
                onPressed: completePayment,
                minWidth: 200.0,
                height: 45.0,
                child: Text(
                  "Pay",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selIndex: 1,
      ),
    );
  }
}
