import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FlightPlaneProvider with ChangeNotifier {
  String planeNo = "Plane Number";
  String planeImg =
      "https://firebasestorage.googleapis.com/v0/b/econnecteee.appspot.com/o/plane_0030.png?alt=media&token=965372bc-4674-43f1-8090-3bdb068e7f90";
  String to = "To";
  String from = "From";
  DateTime departure = new DateTime(2021);
  DateTime arrival = new DateTime(2021);
  String gate = "Gate";

  void setplaneNo(String planeNo) {
    this.planeNo = planeNo;
    notifyListeners();
  }

  String getplaneNo() {
    notifyListeners();
    return this.planeNo;
  }

  void setplaneImg(String planeImg) {
    this.planeImg = planeImg;
    notifyListeners();
  }

  String getplaneImg() {
    notifyListeners();
    return this.planeImg;
  }

  void setto(String to) {
    this.to = to;
    notifyListeners();
  }

  String getto() {
    notifyListeners();
    return this.to;
  }

  void setfrom(String from) {
    this.from = from;
    notifyListeners();
  }

  String getfrom() {
    notifyListeners();
    return this.from;
  }

  void setdeparture(DateTime departure) {
    this.departure = departure;
    notifyListeners();
  }

  DateTime getdeparture() {
    notifyListeners();
    return this.departure;
  }

  void setarrival(DateTime arrival) {
    this.arrival = arrival;
    notifyListeners();
  }

  DateTime getarrival() {
    notifyListeners();
    return this.arrival;
  }

  void setgate(String gate) {
    this.gate = gate;
    notifyListeners();
  }

  String getgate() {
    notifyListeners();
    return this.gate;
  }
}
