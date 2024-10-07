class Customer {
  final String customerId;
  final String name;
  final String location;
  final String gmail;
  final String phone;
  final String destCity;
  final String destWarehouse;

  Customer({
    required this.customerId,
    required this.name,
    required this.location,
    required this.gmail,
    required this.phone,
    required this.destCity,
    required this.destWarehouse,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerId: json['customerId'],
      name: json['name'],
      location: json['location'],
      gmail: json['gmail'],
      phone: json['phone'],
      destCity: json['destCity'],
      destWarehouse: json['destWarehouse'],
    );
  }
}
