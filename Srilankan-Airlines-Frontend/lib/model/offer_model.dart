class Offer {
  String id;
  String destination;
  String percentages;
  String ticketPrice;
  String destinationImg;
  String flightRefFlight;

  Offer({
    required this.id,
    required this.destination,
    required this.percentages,
    required this.ticketPrice,
    required this.destinationImg,
    required this.flightRefFlight,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['_id'],
      destination: json['destination'],
      percentages: json['percentages'],
      ticketPrice: json['ticketPrice'],
      destinationImg: json['destinationImg'],
      flightRefFlight: json['flightRefFlight'],
    );
  }
}
