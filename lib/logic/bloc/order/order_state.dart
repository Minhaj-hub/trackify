import 'package:equatable/equatable.dart';

import '../../../data/model/order_model.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

// class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final List<Order> order;

  const OrderLoaded(this.order);

  @override
  List<Object> get props => [order];
}

class OrderError extends OrderState {
  final String message;

  const OrderError(this.message);

  @override
  List<Object> get props => [message];
}
