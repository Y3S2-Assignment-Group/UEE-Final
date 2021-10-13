import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srilankan_airline/provider/customer_provider.dart';
import 'package:srilankan_airline/provider/feedback_provider.dart';
import 'package:srilankan_airline/provider/flightplane_provider.dart';
import 'package:srilankan_airline/provider/flights_provider.dart';
import 'package:srilankan_airline/provider/offers_provider.dart';
import 'package:srilankan_airline/provider/user_current_trip_provider.dart';
import 'package:srilankan_airline/provider/user_previous_trips_provider.dart';
import 'package:srilankan_airline/provider/user_provider.dart';
import 'package:srilankan_airline/provider/user_scheduled_trips_provider.dart';
import 'package:srilankan_airline/screens/Login/Login.dart';
import 'package:srilankan_airline/screens/Payment/payment.dart';
import 'package:srilankan_airline/screens/Register/Register.dart';
import 'package:srilankan_airline/screens/bookflight/flightbook.dart';
import 'package:srilankan_airline/screens/checkin/checkin.dart';
import 'package:srilankan_airline/screens/dashboard/dashboard.dart';
import 'package:srilankan_airline/screens/feedback/feedback.dart';
import 'package:srilankan_airline/screens/flights/flights.dart';
import 'package:srilankan_airline/screens/myTrips/mytrips.dart';
import 'package:srilankan_airline/screens/offers/Offers.dart';
import 'package:srilankan_airline/screens/offers/singleOffer.dart';
import 'package:srilankan_airline/screens/previousTrips/previousTrips.dart';
import 'package:srilankan_airline/screens/profile/profile.dart';
import 'package:srilankan_airline/screens/recipt/confirmationrecipt.dart';
import 'package:srilankan_airline/screens/scheduleTrips/scheduleTrips.dart';
import 'package:srilankan_airline/screens/seats/seats.dart';
import 'package:srilankan_airline/screens/splashScreen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CustomerProvider()),
    ChangeNotifierProvider(create: (_) => FlightProvider()),
    ChangeNotifierProvider(create: (_) => OfferProvider()),
    ChangeNotifierProvider(create: (_) => FeedbackProvider()),
    ChangeNotifierProvider(create: (_) => FlightPlaneProvider()),
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => UserPreviousTripProvider()),
    ChangeNotifierProvider(create: (_) => UserCurrentTripProvider()),
    ChangeNotifierProvider(create: (_) => UserScheduledTripProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => login(),
        '/register': (context) => register(),
        '/profile': (context) => Profile(),
        '/mytrips': (context) => myTrips(),
        '/bookflight': (context) => bookaflight(),
        '/schedule': (context) => scheduleTrips(),
        '/home': (context) => dashboard(),
        '/previousTrips': (context) => previousTrips(),
        '/checkin': (context) => checkin(),
        '/payment': (context) => payment(),
        '/recipt': (context) => recipt(),
        '/offers': (context) => Offers(),
        '/feedback': (context) => feedback(),
        '/flights': (context) => Flights(),
        '/seats': (context) => Seats(),
        '/singleoffer': (context) => SingleOffer(),
      },
    );
  }
}
