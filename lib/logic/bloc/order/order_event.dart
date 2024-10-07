import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class FetchOrder extends OrderEvent {
  // final String orderStatus;

  const FetchOrder();

  @override
  List<Object> get props => [];
}
