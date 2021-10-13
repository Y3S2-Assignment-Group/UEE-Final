class Plane {
  String id;
  String planeNo;
  String planeImg;

  Plane({
    required this.id,
    required this.planeNo,
    required this.planeImg,
  });

  factory Plane.fromJson(Map<String, dynamic> json) {
    return Plane(
      id: json['_id'],
      planeNo: json['planeNo'],
      planeImg: json['planeImg'],
    );
  }
}
