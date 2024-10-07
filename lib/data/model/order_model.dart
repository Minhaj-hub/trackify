import 'package:trackify/data/model/customer_model.dart';
import 'package:trackify/data/model/merchant_model.dart';

class Order {
  final String orderNo;
  final String status;
  final double price;
  final double weight;
  final DateTime createdDate;
  final Merchant merchant;
  final Customer customer;

  Order({
    required this.orderNo,
    required this.status,
    required this.price,
    required this.weight,
    required this.createdDate,
    required this.merchant,
    required this.customer,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderNo: json['orderNo'],
      status: json['status'],
      price: json['price'].toDouble(),
      weight: json['weight'].toDouble(),
      createdDate: DateTime.parse(json['createdDate']),
      merchant: Merchant.fromJson(json['merchant']),
      customer: Customer.fromJson(json['customer']),
    );
  }
}
