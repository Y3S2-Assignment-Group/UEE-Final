import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:srilankan_airline/model/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:srilankan_airline/screens/checkin/checkin.dart';

class UserProvider with ChangeNotifier {
  late User user;
  late String customername;
  late String flightid;
  late String departuretime;
  late String arivaltime;
  late String departure;
  late String arival;
  late String gate;
  late String seat;

  void setFlightID(String flightid) {
    this.flightid = flightid;
  }

  String getFlightID() {
    return this.flightid;
  }

  void setCustomerName(String customername) {
    this.customername = customername;
  }

  String getCustomerName() {
    return this.customername;
  }

  void setDeparturetime(String departuretime) {
    this.departuretime = departuretime;
  }

  String getDeparturetime() {
    return this.departuretime;
  }

  void setArivaltime(String arivaltime) {
    this.arivaltime = arivaltime;
  }

  String getArivaltime() {
    return this.arivaltime;
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

  void setGate(String gate) {
    this.gate = gate;
  }

  String getGate() {
    return this.gate;
  }

  void setSeat(String seat) {
    this.seat = seat;
  }

  String getSeat() {
    return this.seat;
  }

  Future<User> getUserProfile() async {
    final authToken = await FlutterSecureStorage().read(key: 'token');

    if (authToken != null) {
      final profileResponse = await http.get(
        Uri.parse('https://srilankanairline-backend.herokuapp.com/api/user'),
        headers: {'x-auth-token': authToken},
      );
      print(profileResponse.statusCode);

      if (profileResponse.statusCode == 200) {
        notifyListeners();
        final data = jsonDecode(profileResponse.body);
        user = new User.fromJson(data);
        return user;
      } else {
        return user;
      }
    } else {
      return user;
    }
  }

  void checkin(String tripID) async {
    final authToken = await FlutterSecureStorage().read(key: 'token');

    if (authToken != null) {
      final checkinResponse = await http.put(
        Uri.parse(
            'https://srilankanairline-backend.herokuapp.com/api/user/checkIn/$tripID'),
        headers: {'x-auth-token': authToken},
      );
      print(checkinResponse.statusCode);
    }
  }
}
