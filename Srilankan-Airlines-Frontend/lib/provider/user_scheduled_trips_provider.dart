import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:srilankan_airline/model/user_previous_trips_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:srilankan_airline/model/user_scheduled_trips_model.dart';

class UserScheduledTripProvider with ChangeNotifier {
  List<ScheduledTrips> scheduledTripsList = [];

  Future<List<ScheduledTrips>> getUserscheduledTripsList() async {
    scheduledTripsList = [];

    final authToken = await FlutterSecureStorage().read(key: 'token');
    final responseData = await http.get(
      Uri.parse(
          'https://srilankanairline-backend.herokuapp.com/api/user/scheduletrips'),
      headers: {'x-auth-token': authToken!},
    );
    print(responseData.statusCode);
    print(responseData.body);

    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body) as List;
      for (Map<String, dynamic> item in data) {
        var previousTrip = ScheduledTrips.fromJson(item);
        scheduledTripsList.add(previousTrip);
      }
      return scheduledTripsList;
    } else {
      return [];
    }
  }
}
