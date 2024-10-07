import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackify/presentation/screens/all_orders/general_remark_screen.dart';

import 'invoice_history_screen.dart';
import 'order_history_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
                child: const TabBar(
                  tabs: [
                    Tab(
                      text: 'Order History',
                    ),
                    Tab(text: 'Invoice History'),
                    Tab(text: 'General Remark'),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    OrderHistoryScreen(),
                    InvoiceHistoryScreen(),
                    GeneralRemarkScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
