import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:srilankan_airline/model/user_current_trip.dart';
import 'package:srilankan_airline/model/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserCurrentTripProvider with ChangeNotifier {
  late UserCurrentTrip userCurrentTrip;

  Future<UserCurrentTrip?> getUserCurrentTrip() async {
    final authToken = await FlutterSecureStorage().read(key: 'token');

    if (authToken != null) {
      print('called');
      final profileResponse = await http.get(
        Uri.parse(
            'https://srilankanairline-backend.herokuapp.com/api/user/currenttrip'),
        headers: {'x-auth-token': authToken},
      );

      if (profileResponse.statusCode == 200) {
        notifyListeners();
        final data = jsonDecode(profileResponse.body);
        userCurrentTrip = new UserCurrentTrip.fromJson(data);
        print(data);
        return userCurrentTrip;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
