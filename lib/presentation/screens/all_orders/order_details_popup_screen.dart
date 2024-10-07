import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackify/presentation/screens/all_orders/order_details_screen.dart';
import 'package:trackify/presentation/screens/all_orders/view_order_details_screen.dart';

import '../../../data/model/order_model.dart';

class OrderDetailsPopupScreen extends StatefulWidget {
  const OrderDetailsPopupScreen({super.key, required this.order});

  final Order order;

  @override
  State<OrderDetailsPopupScreen> createState() =>
      _OrderDetailsPopupScreenState();
}

class _OrderDetailsPopupScreenState extends State<OrderDetailsPopupScreen> {
  bool isArrowClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0)
                .copyWith(bottom: 15),
            child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 20,
                  ),
                )),
          ),
          Expanded(
              child: isArrowClicked
                  ? const OrderDetailsScreen()
                  : ViewOrderDetailsScreen(
                      order: widget.order,
                    )),
          Visibility(
            visible: !isArrowClicked,
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.keyboard_double_arrow_down,
                    color: Colors.purple),
                onPressed: () {
                  setState(() {
                    isArrowClicked = true;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
