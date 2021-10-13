class Customer {
  String token;

  Customer({
    required this.token,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      token: json['token'],
    );
  }
}

