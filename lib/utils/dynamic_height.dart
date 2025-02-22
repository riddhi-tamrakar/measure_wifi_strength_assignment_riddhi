import 'package:flutter/material.dart';

class DynamicSize {
  static double height(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }

  static double width(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }

  static EdgeInsets symmetricPadding(
    BuildContext context, {
    required double verticalPercentage,
    required double horizontalPercentage,
  }) {
    return EdgeInsets.symmetric(
      vertical: height(context, verticalPercentage),
      horizontal: width(context, horizontalPercentage),
    );
  }

  static EdgeInsets allPadding(BuildContext context, double percentage) {
    return EdgeInsets.all(width(context, percentage));
  }

  static EdgeInsets onlyPadding(
    BuildContext context, {
    double topPercentage = 0,
    double bottomPercentage = 0,
    double leftPercentage = 0,
    double rightPercentage = 0,
  }) {
    return EdgeInsets.only(
      top: height(context, topPercentage),
      bottom: height(context, bottomPercentage),
      left: width(context, leftPercentage),
      right: width(context, rightPercentage),
    );
  }
}
