import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImg,
    required this.passportNumber,
    required this.country,
    required this.mobileNumber,
  });

  String id;
  String name;
  String email;
  String profileImg;
  String passportNumber;
  String country;
  String mobileNumber;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        profileImg: json["profileImg"],
        passportNumber: json["passportNumber"],
        country: json["country"],
        mobileNumber: json["mobileNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "profileImg": profileImg,
        "passportNumber": passportNumber,
        "country": country,
        "mobileNumber": mobileNumber,
      };
}
