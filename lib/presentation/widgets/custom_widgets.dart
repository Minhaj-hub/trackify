import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:trackify/utils/responsive_ui.dart';

import '../../utils/colors.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField(
      {super.key,
      required this.labelName,
      required this.prefixIcon,
      required this.controller});

  final String labelName;
  final IconData prefixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 1.5.h),
          prefixIcon: Icon(prefixIcon),
          label: Text(labelName)),
    );
  }
}

class CSizedBox extends StatelessWidget {
  const CSizedBox({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}

class CText extends StatelessWidget {
  const CText(
      {super.key, required this.txt, this.fontSize, this.color, this.weight});

  final String txt;
  final double? fontSize;
  final Color? color;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(fontSize: fontSize, color: color, fontWeight: weight),
    );
  }
}

class StatisticsContainer extends StatelessWidget {
  const StatisticsContainer(
      {super.key, required this.child, required this.cornerRadius});

  final Widget child;
  final double cornerRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerRadius),
          color: whiteClr,
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.1), // Shadow color with transparency
              offset: const Offset(0, 2), // Horizontal and vertical offset
              blurRadius: 4, // Spread radius of the shadow
              spreadRadius: 1, // How much the shadow should spread
            ),
          ],
        ),
        child: child);
  }
}

class InsightContainer extends StatelessWidget {
  const InsightContainer(
      {super.key,
      required this.image,
      required this.quantity,
      required this.title});

  final String image, title;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context);
    return SizedBox(
      width: screenSize.width / 2.75,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 45.w,
            height: 45.h,
            fit: BoxFit.fitWidth,
          ),
          CSizedBox(
            width: 10.w,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    txt: '$quantity',
                    fontSize: 25.sp,
                    weight: FontWeight.bold,
                  ),
                  CText(txt: title)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.color});

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          leading: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: color, // Set a custom background color
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white, // Set icon color to white
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
          ),
          children: const [
            // Add content that should be expanded here
            ListTile(
              title: Text('Expanded Content'),
              subtitle: Text('Additional details can go here.'),
            ),
          ],
        ));
  }
}

// class StatusCard extends StatelessWidget {
//   const StatusCard(
//       {super.key,
//       required this.icon,
//       required this.title,
//       required this.color});

//   final IconData icon;
//   final String title;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
//       padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3), // changes position of shadow
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // Circular Icon Container
//           Container(
//             width: 40.w,
//             height: 40.h,
//             decoration: BoxDecoration(
//               color: color, // Red background for the circle
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               icon, // The clock icon
//               color: Colors.white, // White icon color
//             ),
//           ),
//           SizedBox(width: 12.w), // Spacing between the icon and text

//           // Text 'Cancelled'
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//           ),
//           const Spacer(),

//           // Down Arrow Icon
//           const Icon(
//             Icons.keyboard_arrow_down, // Down arrow icon
//             color: Colors.grey,
//           ),
//         ],
//       ),
//     );
//   }
// }

class StatisticsCard extends StatelessWidget {
  const StatisticsCard(
      {super.key,
      required this.image,
      required this.title,
      required this.value,
      required this.onPressed});

  final String image, title, value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          color: whiteClr,
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.1), // Shadow color with transparency
              offset: const Offset(0, 2), // Horizontal and vertical offset
              blurRadius: 4, // Spread radius of the shadow
              spreadRadius: 1, // How much the shadow should spread
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 50.w,
              height: 50.h,
              fit: BoxFit.fitWidth,
            ),
            CText(
              txt: value,
              fontSize: 20.sp,
              weight: FontWeight.bold,
            ),
            // Row(
            //   // mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Image.asset(
            //       image,
            //       width: 55.w,
            //       height: 55.h,
            //       fit: BoxFit.fitWidth,
            //     ),
            //     CText(txt: value)
            //   ],
            // ),
            CSizedBox(
              height: 5.h,
            ),
            Flexible(child: CText(txt: title))
          ],
        ),
      ),
    );
  }
}

class CElevatedBtn extends StatelessWidget {
  const CElevatedBtn({super.key, required this.txt, required this.onPressed});

  final String txt;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF033D8C),
                Color(0xFF0598D1)
              ], // Define your gradient colors here.
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            // borderRadius: borderRadius,
          ),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: onPressed,
              child: CText(
                txt: txt,
                color: whiteClr,
              )),
        ));
  }
}

class BuildTimelineLine extends StatelessWidget {
  const BuildTimelineLine({
    super.key,
    required this.endChild,
    required this.index,
    required this.length,
  });

  final Widget endChild;
  final int index, length;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      lineXY: 0.5,
      isFirst: index == 0,
      isLast: index == length - 1,
      indicatorStyle: const IndicatorStyle(
        width: 20,
        color: Colors.blue,
        // padding: EdgeInsets.all(8),
      ),
      beforeLineStyle: const LineStyle(
        color: Colors.blue,
        thickness: 2,
      ),
      afterLineStyle: const LineStyle(
        color: Colors.blue,
        thickness: 2,
      ),
      endChild: endChild,
    );
  }
}
