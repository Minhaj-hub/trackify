import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/order_model.dart';
import '../../../logic/functions/common_function.dart';
import '../../../utils/colors.dart';
import '../../../utils/responsive_ui.dart';
import '../../widgets/custom_widgets.dart';
import 'order_details_popup_screen.dart';

class AllOrdersScreen extends StatelessWidget {
  const AllOrdersScreen(
      {super.key, required this.status, required this.orders});

  final String status;

  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.navigate_before),
                        CSizedBox(
                          width: 10.w,
                        ),
                        CText(
                          txt: status,
                          fontSize: 16.sp,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showConfirmationDialog(context, orders);
                      },
                      icon: const Icon(Icons.file_download_outlined)),
                ],
              ),
              CSizedBox(
                height: 25.h,
              ),
              SizedBox(
                height: screenSize.height * 0.75,
                child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: OrderStatusContainer(
                          order: order,
                          orderNo: order.orderNo,
                          status: order.status,
                          statusColor: blueColor,
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrderStatusContainer extends StatelessWidget {
  const OrderStatusContainer(
      {super.key,
      required this.order,
      required this.orderNo,
      required this.status,
      required this.statusColor});

  final Order order;
  final String orderNo, status;
  final Color statusColor;
  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: whiteClr,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CText(txt: orderNo),
          Row(
            children: [
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.w),
                      color: predictColor(status)),
                  child: CText(
                    txt: status,
                  )),
              CSizedBox(
                width: 15.w,
              ),
              InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          insetPadding:
                              const EdgeInsets.symmetric(vertical: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Builder(
                              builder: (context) {
                                return SizedBox(
                                    height: screenSize.height * 0.9,
                                    width: screenSize.width * 0.9,
                                    child:
                                        OrderDetailsPopupScreen(order: order));
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.more_vert_sharp))
            ],
          )
        ],
      ),
    );
  }
}
