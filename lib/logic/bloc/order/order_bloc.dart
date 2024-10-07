import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/order_repository.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc(this.orderRepository) : super(OrderInitial()) {
    on<FetchOrder>(_onFetchOrder);
  }

  Future<void> _onFetchOrder(FetchOrder event, Emitter<OrderState> emit) async {
    try {
      final order = await orderRepository.getOrder();
      emit(OrderLoaded(order));
    } catch (e) {
      emit(OrderError('Failed to fetch order details: $e'));
    }
  }
}
