import 'dart:convert';

PreviousTrips previousTripsFromJson(String str) =>
    PreviousTrips.fromJson(json.decode(str));

String previousTripsToJson(PreviousTrips data) => json.encode(data.toJson());

class PreviousTrips {
  PreviousTrips({
    required this.id,
    required this.flightClass,
    required this.seatNo,
    required this.flight,
    required this.checkinStatus,
    required this.bookingStatus,
    required this.v,
  });

  String id;
  String flightClass;
  String seatNo;
  Flight flight;
  bool checkinStatus;
  bool bookingStatus;
  int v;

  factory PreviousTrips.fromJson(Map<String, dynamic> json) => PreviousTrips(
        id: json["_id"],
        flightClass: json["flightClass"],
        seatNo: json["seatNo"],
        flight: Flight.fromJson(json["flight"]),
        checkinStatus: json["checkinStatus"],
        bookingStatus: json["bookingStatus"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "flightClass": flightClass,
        "seatNo": seatNo,
        "flight": flight.toJson(),
        "checkinStatus": checkinStatus,
        "bookingStatus": bookingStatus,
        "__v": v,
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
    required this.v,
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
  int v;

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
        v: json["__v"],
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
        "__v": v,
      };
}
