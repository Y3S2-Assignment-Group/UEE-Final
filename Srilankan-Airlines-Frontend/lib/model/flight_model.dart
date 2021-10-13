import 'dart:convert';

List<Flight> flightFromJson(String str) =>
    List<Flight>.from(json.decode(str).map((x) => Flight.fromJson(x)));

String flightToJson(List<Flight> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  Plane plane;
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
        plane: Plane.fromJson(json["plane"]),
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
        "plane": plane.toJson(),
        "__v": v,
      };
}

class Plane {
  Plane({
    required this.id,
    required this.planeNo,
    required this.planeImg,
    required this.flight,
    required this.v,
  });

  String id;
  String planeNo;
  String planeImg;
  List<String> flight;
  int v;

  factory Plane.fromJson(Map<String, dynamic> json) => Plane(
        id: json["_id"],
        planeNo: json["planeNo"],
        planeImg: json["planeImg"],
        flight: List<String>.from(json["flight"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "planeNo": planeNo,
        "planeImg": planeImg,
        "flight": List<dynamic>.from(flight.map((x) => x)),
        "__v": v,
      };
}
