import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:srilankan_airline/model/user_previous_trips_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserPreviousTripProvider with ChangeNotifier {
  List<PreviousTrips> previousTripsList = [];

  Future<List<PreviousTrips>> getUserPreviousTripsList() async {
    previousTripsList = [];

    final authToken = await FlutterSecureStorage().read(key: 'token');
    final responseData = await http.get(
      Uri.parse(
          'https://srilankanairline-backend.herokuapp.com/api/user/previoustrips'),
      headers: {'x-auth-token': authToken!},
    );
    print(responseData.statusCode);
    print(responseData.body);

    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body) as List;
      for (Map<String, dynamic> item in data) {
        var previousTrip = PreviousTrips.fromJson(item);
        previousTripsList.add(previousTrip);
      }
      return previousTripsList;
    } else {
      return [];
    }
  }
}
