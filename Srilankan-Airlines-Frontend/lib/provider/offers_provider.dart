import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:srilankan_airline/model/offer_model.dart';

class OfferProvider with ChangeNotifier {
  List<Offer> offersList = [];
  String singleOfferId = "";
  String destination = "";
  String percentages = "";
  String ticketPrice = "";
  String destinationImg = "";
  String flightRefFlight = "";

  void setSingleOfferId(String singleOfferId) {
    this.singleOfferId = singleOfferId;
  }

  String getSingleOfferId() {
    return this.singleOfferId;
  }

  void setDestination(String destination) {
    this.destination = destination;
  }

  String getDestination() {
    return this.destination;
  }

  void setPercentages(String percentages) {
    this.percentages = percentages;
  }

  String getPercentages() {
    return this.percentages;
  }

  void setTicketPrice(String ticketPrice) {
    this.ticketPrice = ticketPrice;
  }

  String getTicketPrice() {
    return this.ticketPrice;
  }

  void setDestinationImg(String destinationImg) {
    this.destinationImg = destinationImg;
  }

  String getDestinationImg() {
    return this.destinationImg;
  }

  void setFlightRefFlight(String flightRefFlight) {
    this.flightRefFlight = flightRefFlight;
  }

  String getFlightRefFlight() {
    return this.flightRefFlight;
  }

  Future<List<Offer>> getOfferList() async {
    final responseData = await http.get(
        Uri.parse('https://srilankanairline-backend.herokuapp.com/api/offer'));
    print(responseData.statusCode);

    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body) as List;
      if (offersList.isNotEmpty) {
        return offersList;
      } else {
        for (Map<String, dynamic> item in data) {
          var offer = Offer.fromJson(item);
          offersList.add(offer);
        }
        return offersList;
      }
    } else {
      return offersList;
    }
  }
}
