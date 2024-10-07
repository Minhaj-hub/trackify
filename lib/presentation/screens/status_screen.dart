import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackify/presentation/screens/dashboard_screen.dart';
import 'package:trackify/presentation/screens/myorders_screen.dart';
import 'package:trackify/presentation/widgets/custom_widgets.dart';
import 'package:trackify/utils/colors.dart';
import 'package:trackify/utils/string.dart';

class CContainer extends StatelessWidget {
  const CContainer(
      {super.key,
      required this.title,
      required this.image,
      required this.value});

  final String title, image, value;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      width: screenWidth / 2.5,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        children: [
          CText(txt: title),
          CSizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Image.asset(width: 40, image),
              CSizedBox(
                width: 10.w,
              ),
              Flexible(child: CText(txt: value))
            ],
          )
        ],
      ),
    );
  }
}

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.navigate_before),
                    ),
                  ),
                  CSizedBox(
                    width: 10.w,
                  ),
                  CText(
                    txt: 'Status Statistics',
                    fontSize: 16.sp,
                    weight: FontWeight.w500,
                  )
                ],
              ),
              CSizedBox(
                height: 20.h,
              ),
              StatisticsContainer(
                  cornerRadius: 16,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryPurple,
                            child: IconButton(
                              highlightColor: Colors.transparent,
                              onPressed: () {},
                              icon: const Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                          CSizedBox(
                            width: 10.w,
                          ),
                          const CText(txt: 'PickUp Rider Assigned')
                        ],
                      ),
                      CSizedBox(
                        height: 20.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CContainer(
                            title: 'No of Orders',
                            image: sigin,
                            value: '12',
                          ),
                          CContainer(
                            title: 'Delivery Charge',
                            image: cash,
                            value: '7800',
                          )
                        ],
                      ),
                      CSizedBox(
                        height: 20.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CText(txt: 'Radio : 47%'),
                          Icon(Icons.keyboard_arrow_up)
                        ],
                      )
                    ],
                  )),
              CSizedBox(height: 5.h),
              const CustomExpansionTile(
                icon: Icons.done,
                title: 'Picked Up',
                color: orangeYellowColor,
              ),
              const CustomExpansionTile(
                icon: Icons.done,
                title: 'Confirmed',
                color: greenColor,
              ),
              const CustomExpansionTile(
                icon: Icons.watch_later,
                title: 'Cancelled',
                color: redPinkColor,
              ),
              const CustomExpansionTile(
                icon: Icons.add,
                title: 'Delivered',
                color: tealGreenColor,
              ),
              const CustomExpansionTile(
                icon: Icons.done,
                title: 'Partially Delivered',
                color: blueColor,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DashboardScreen(
                            body: MyordersScreen(), title: 'My Orders');
                      }));
                    },
                    child: const CText(
                      txt: 'See more',
                      color: linkBlue,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: linkBlue,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
