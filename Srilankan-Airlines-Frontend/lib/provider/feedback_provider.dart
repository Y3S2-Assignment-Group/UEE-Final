import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FeedbackProvider with ChangeNotifier {
  String name = '';
  String description = '';
  double rating = 0;

  void setName(String name) {
    this.name = name;
  }

  String getName() {
    return this.name;
  }

  void setDescription(String description) {
    this.description = description;
  }

  String getDescription() {
    return this.description;
  }

  void setRating(double rating) {
    this.rating = rating;
  }

  double getRating() {
    return this.rating;
  }

  void addFeedback() async {
    await http.post(
      Uri.parse("https://srilankanairline-backend.herokuapp.com/api/feedBack"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'name': this.name,
        'description': this.description,
        'rating': this.rating,
      }),
    );
  }
}
