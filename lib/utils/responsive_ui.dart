import 'package:flutter/material.dart';

class ScreenSize {
  final BuildContext context;

  ScreenSize(this.context);

  double get height => MediaQuery.of(context).size.height;

  double get width => MediaQuery.of(context).size.width;

  double get aspectRatio => MediaQuery.of(context).size.aspectRatio;

  double get screenHeightPercentage {
    return height / MediaQuery.of(context).size.height;
  }

  double get screenWidthPercentage {
    return width / MediaQuery.of(context).size.width;
  }
}
