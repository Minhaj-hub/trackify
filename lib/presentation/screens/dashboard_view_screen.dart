import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackify/presentation/screens/status_screen.dart';
import 'package:trackify/presentation/widgets/custom_widgets.dart';
import 'package:trackify/utils/colors.dart';

import '../../utils/string.dart';
import 'dashboard_screen.dart';

class DashboardViewScreen extends StatelessWidget {
  const DashboardViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatisticsContainer(
          cornerRadius: 8.w,
          child: Column(
            children: [
              const CText(
                txt: 'Orders Statistics',
                weight: FontWeight.bold,
                fontSize: 16,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // navigate(context, const AllOrdersScreen());
                      },
                      child: const InsightContainer(
                        image: moneyBag,
                        quantity: 12,
                        title: 'Orders Count',
                      ),
                    ),
                    // CSizedBox(
                    //   width: 15.w,
                    // ),
                    const InsightContainer(
                      image: moneyExchange,
                      quantity: 5600,
                      title: 'Total Delivery Charge',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        CSizedBox(
          height: 10.h,
        ),
        StatisticsContainer(
            cornerRadius: 8.w,
            child: Column(
              children: [
                const CText(
                  txt: 'Finance Statistics',
                  weight: FontWeight.bold,
                  fontSize: 16,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InsightContainer(
                                image: tax,
                                quantity: 55600,
                                title: 'Invoice Value'),
                            InsightContainer(
                                image: analytics,
                                quantity: 3,
                                title: 'Pending Invoice'),
                          ],
                        ),
                        CSizedBox(
                          height: 20.h,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InsightContainer(
                                image: coins,
                                quantity: 25600,
                                title: 'Paid Invoice Value'),
                            InsightContainer(
                                image: approval,
                                quantity: 9,
                                title: 'Approved Invoice'),
                          ],
                        )
                      ],
                    ))
              ],
            )),
        CSizedBox(
          height: 10.h,
        ),
        StatisticsContainer(
            cornerRadius: 16.w,
            child: Column(
              children: [
                const CText(
                  txt: 'Status Statistics',
                  weight: FontWeight.bold,
                  fontSize: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      poInvoice,
                      width: 45.w,
                      height: 45.h,
                      fit: BoxFit.fitWidth,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const DashboardScreen(
                              body: StatusScreen(), title: '');
                        }));
                      },
                      child: const CText(
                        txt: 'Show more details',
                        color: linkBlue,
                      ),
                    )
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
