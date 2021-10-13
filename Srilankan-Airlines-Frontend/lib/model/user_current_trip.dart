import 'dart:convert';

UserCurrentTrip userCurrentTripFromJson(String str) =>
    UserCurrentTrip.fromJson(json.decode(str));

String userCurrentTripToJson(UserCurrentTrip data) =>
    json.encode(data.toJson());

class UserCurrentTrip {
  UserCurrentTrip({
    required this.id,
    required this.flightClass,
    required this.seatNo,
    required this.flight,
    required this.checkinStatus,
    required this.bookingStatus,
  });

  String id;
  String flightClass;
  String seatNo;
  Flight flight;
  bool checkinStatus;
  bool bookingStatus;

  factory UserCurrentTrip.fromJson(Map<String, dynamic> json) =>
      UserCurrentTrip(
        id: json["_id"],
        flightClass: json["flightClass"],
        seatNo: json["seatNo"],
        flight: Flight.fromJson(json["flight"]),
        checkinStatus: json["checkinStatus"],
        bookingStatus: json["bookingStatus"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "flightClass": flightClass,
        "seatNo": seatNo,
        "flight": flight.toJson(),
        "checkinStatus": checkinStatus,
        "bookingStatus": bookingStatus,
      };
}

class Flight {
  Flight({
    required this.id,
    required this.to,
    required this.from,
    required this.departure,
    required this.arrival,
    required this.gate,
    required this.seats,
    required this.status,
    required this.plane,
  });

  String id;
  String to;
  String from;
  DateTime departure;
  DateTime arrival;
  String gate;
  List<List<int>> seats;
  String status;
  String plane;

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
        id: json["_id"],
        to: json["to"],
        from: json["from"],
        departure: DateTime.parse(json["departure"]),
        arrival: DateTime.parse(json["arrival"]),
        gate: json["gate"],
        seats: List<List<int>>.from(
            json["seats"].map((x) => List<int>.from(x.map((x) => x)))),
        status: json["status"],
        plane: json["plane"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "to": to,
        "from": from,
        "departure": departure.toIso8601String(),
        "arrival": arrival.toIso8601String(),
        "gate": gate,
        "seats": List<dynamic>.from(
            seats.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "status": status,
        "plane": plane,
      };
}
