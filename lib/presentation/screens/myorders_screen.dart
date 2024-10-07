import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackify/logic/bloc/order/order_bloc.dart';
import 'package:trackify/logic/bloc/order/order_state.dart';
import 'package:trackify/presentation/screens/all_orders/all_orders_screen.dart';
import 'package:trackify/presentation/screens/dashboard_screen.dart';
import 'package:trackify/utils/string.dart';

import '../../data/repositories/order_repository.dart';
import '../../logic/bloc/order/order_event.dart';
import '../widgets/custom_widgets.dart';

class MyordersScreen extends StatelessWidget {
  const MyordersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderRepository orderRepository = OrderRepository();

    return BlocProvider(
      create: (context) =>
          OrderBloc(OrderRepository())..add(const FetchOrder()),
      child: Padding(
        padding: EdgeInsets.all(20.0.w),
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is OrderLoaded) {
              final orders = state.order;
              final drafts = orderRepository.filterOrders(
                  ordersList: orders, status: 'Draft');
              final confirmed = orderRepository.filterOrders(
                  ordersList: orders, status: 'Confirmed');
              final cancelled = orderRepository.filterOrders(
                  ordersList: orders, status: 'Cancelled');
              final delivered = orderRepository.filterOrders(
                  ordersList: orders, status: 'Delivered');
              final partiallyDelivered = orderRepository.filterOrders(
                  ordersList: orders, status: 'Partially Delivered');
              final rescheduled = orderRepository.filterOrders(
                  ordersList: orders, status: 'Rescheduled');
              final failureToDelivered = orderRepository.filterOrders(
                  ordersList: orders, status: 'Failure to Delivered');

              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.1,
                ),
                children: [
                  StatisticsCard(
                      image: moneyBag,
                      title: 'All orders',
                      value: '${orders.length}',
                      onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DashboardScreen(
                              body: AllOrdersScreen(
                                orders: orders,
                                status: 'All Orders',
                              ),
                              title: 'My Orders',
                            );
                          }))),
                  StatisticsCard(
                    image: moneyExchange,
                    title: 'Draft',
                    value: '${drafts.length}',
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DashboardScreen(
                        body: AllOrdersScreen(
                          orders: drafts,
                          status: 'Draft',
                        ),
                        title: 'My Orders',
                      );
                    })),
                  ),
                  StatisticsCard(
                    image: tax,
                    title: 'Confirmed',
                    value: '${confirmed.length}',
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DashboardScreen(
                        body: AllOrdersScreen(
                          orders: confirmed,
                          status: 'Confirmed',
                        ),
                        title: 'My Orders',
                      );
                    })),
                  ),
                  StatisticsCard(
                    image: analytics,
                    title: 'Cancelled',
                    value: '${cancelled.length}',
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DashboardScreen(
                        body: AllOrdersScreen(
                          orders: cancelled,
                          status: 'Cancelled',
                        ),
                        title: 'My Orders',
                      );
                    })),
                  ),
                  StatisticsCard(
                    image: coins,
                    title: 'Delivered',
                    value: '${delivered.length}',
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DashboardScreen(
                        body: AllOrdersScreen(
                          orders: delivered,
                          status: 'Delivered',
                        ),
                        title: 'My Orders',
                      );
                    })),
                  ),
                  StatisticsCard(
                    image: approval,
                    title: 'Partially Delivered',
                    value: '${partiallyDelivered.length}',
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DashboardScreen(
                        body: AllOrdersScreen(
                          orders: partiallyDelivered,
                          status: 'Partially Delivered',
                        ),
                        title: 'My Orders',
                      );
                    })),
                  ),
                  StatisticsCard(
                    image: coins,
                    title: 'Rescheduled',
                    value: '${rescheduled.length}',
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DashboardScreen(
                        body: AllOrdersScreen(
                          orders: rescheduled,
                          status: 'Rescheduled',
                        ),
                        title: 'My Orders',
                      );
                    })),
                  ),
                  StatisticsCard(
                    image: approval,
                    title: 'Failure to Delivered',
                    value: '${failureToDelivered.length}',
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DashboardScreen(
                        body: AllOrdersScreen(
                          orders: confirmed,
                          status: 'Failure to Delivered',
                        ),
                        title: 'My Orders',
                      );
                    })),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
