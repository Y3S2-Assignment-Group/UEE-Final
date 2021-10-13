import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:srilankan_airline/model/customer_model.dart';
import 'package:srilankan_airline/screens/bookflight/flightbook.dart';

class CustomerProvider with ChangeNotifier {
  final storage = new FlutterSecureStorage();
  String name = '';
  String token = '';
  String email = '';
  String passportNumber = '';
  String mobileNumber = '';
  String password = '';

  String flightID = '';
  String departure = '';
  String arival = '';
  String departureDate = '';
  String arivalDate = '';
  String flightId = '';
  String flightClass = '';
  String seatNo = '';
  String returnflight = '';
  String returnDate = '';

  void setFlightId(String flightId) {
    this.flightId = flightId;
  }

  String getFlightId() {
    return this.flightId;
  }

  void setSeatNo(String seat) {
    this.seatNo = seat;
  }

  dynamic getSeatNo() {
    return this.seatNo;
  }

  void setFlightClass(String fclass) {
    this.flightClass = fclass;
  }

  String getFlightClass() {
    return this.flightClass;
  }

  void setDeparture(String departure) {
    this.departure = departure;
  }

  String getDeparture() {
    return this.departure;
  }

  void setArival(String arival) {
    this.arival = arival;
  }

  String getArival() {
    return this.arival;
  }

  void setReturnflight(String arival) {
    this.arival = arival;
  }

  String getReturnflight() {
    return this.arival;
  }

  void setDepartureDate(String departureDate) {
    this.departureDate = departureDate;
  }

  String getDepartureDate() {
    return this.departureDate;
  }

  void setArivalDate(String arivalDate) {
    this.arivalDate = arivalDate;
  }

  String getArivalDate() {
    return this.arivalDate;
  }

  void setReturnDate(String arivalDate) {
    this.arivalDate = arivalDate;
  }

  String getReturnDate() {
    return this.arivalDate;
  }

  String getToken() {
    return this.token;
  }

  void setName(String name) {
    this.name = name;
  }

  String getName() {
    return this.name;
  }

  void setEmail(String email) {
    this.email = email;
  }

  String getEmail() {
    return this.email;
  }

  void setPassportNumber(String passportNumber) {
    this.passportNumber = passportNumber;
  }

  String getPassportNumber() {
    return this.passportNumber;
  }

  void setMobileNumber(String mobileNumber) {
    this.mobileNumber = mobileNumber;
  }

  String getMobileNumber() {
    return this.mobileNumber;
  }

  void setPasswor(String password) {
    this.password = password;
  }

  String getPassword() {
    return this.password;
  }

//todo: set the token
  void register(BuildContext context) async {
    final registerResponse = await http.post(
      Uri.parse(
          "https://srilankanairline-backend.herokuapp.com/api/user/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'name': this.name,
        'email': this.email,
        'password': this.password,
        'passportNumber': this.password,
        'mobileNumber': this.mobileNumber,
        'profileImg':
            'https://www.pngkit.com/png/detail/108-1082173_male-profile-face.png',
      }),
    );
    print(registerResponse.statusCode);
    if (registerResponse.statusCode == 200) {
      final data = jsonDecode(registerResponse.body);
      var customerData = Customer.fromJson(data);
      await storage.write(key: 'token', value: customerData.token);
      Navigator.pushNamed(context, '/home');
    }
  }

//todo: set the token
  void login(BuildContext context) async {
    final loginResponse = await http.post(
      Uri.parse(
          "https://srilankanairline-backend.herokuapp.com/api/user/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'email': this.email,
        'password': this.password,
      }),
    );

    print(loginResponse.statusCode);
    if (loginResponse.statusCode == 200) {
      final data = jsonDecode(loginResponse.body);
      var customerData = Customer.fromJson(data);
      await storage.write(key: 'token', value: customerData.token);
      Navigator.pushNamed(context, '/home');
    }
  }

//todo: update the flight seats.
  void bookflight(String flightID) async {
    final String? authToken = await FlutterSecureStorage().read(key: 'token');
    final bookflightResponse = await http.post(
      Uri.parse(
          "https://srilankanairline-backend.herokuapp.com/api/user/bookTrip"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': authToken!,
      },
      body: jsonEncode(<String, dynamic>{
        'flightClass': this.flightClass,
        'seatNo': 'F29',
        'flight': {"_id": flightID},
      }),
    );
    print("flightClass" + this.flightClass);
    print("flight" + flightID);
    print("book flight status" + bookflightResponse.statusCode.toString());
  }

  void scheduleflight(String flightID) async {
    final String? authToken = await FlutterSecureStorage().read(key: 'token');
    final scheduleFlight = await http.post(
      Uri.parse(
          "https://srilankanairline-backend.herokuapp.com/api/user/scheduleTrip"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': authToken!,
      },
      body: jsonEncode(<String, dynamic>{
        'flightClass': this.flightClass,
        'seatNo': 'F29',
        'flight': {"_id": flightID},
      }),
    );

    print("flightClass" + this.flightClass);
    print("flight" + flightID);
    print("book flight status" + scheduleFlight.statusCode.toString());
  }
}
