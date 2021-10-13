import 'dart:convert';

List<ScheduledTrips> scheduledTripsFromJson(String str) =>
    List<ScheduledTrips>.from(
        json.decode(str).map((x) => ScheduledTrips.fromJson(x)));

String scheduledTripsToJson(List<ScheduledTrips> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScheduledTrips {
  ScheduledTrips({
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
  FlightSchedule flight;
  bool checkinStatus;
  bool bookingStatus;
  int v;

  factory ScheduledTrips.fromJson(Map<String, dynamic> json) => ScheduledTrips(
        id: json["_id"],
        flightClass: json["flightClass"],
        seatNo: json["seatNo"],
        flight: FlightSchedule.fromJson(json["flight"]),
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

class FlightSchedule {
  FlightSchedule({
    required this.id,
    required this.to,
    required this.from,
    required this.departure,
    required this.arrival,
    required this.gate,
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
  String status;
  String plane;
  int v;

  factory FlightSchedule.fromJson(Map<String, dynamic> json) => FlightSchedule(
        id: json["_id"],
        to: json["to"],
        from: json["from"],
        departure: DateTime.parse(json["departure"]),
        arrival: DateTime.parse(json["arrival"]),
        gate: json["gate"],
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
        "status": status,
        "plane": plane,
        "__v": v,
      };
}
