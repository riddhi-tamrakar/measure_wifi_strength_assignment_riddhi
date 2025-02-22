import 'package:flutter/material.dart';

class VerticalDashDivider extends StatelessWidget {
  final double height; // Total height of the dotted line
  final double width; // Width of each dot
  final Color color; // Color of the dots
  final double dashHeight; // Height of each dot
  final double dashSpacing; // Spacing between dots

  const VerticalDashDivider({
    Key? key,
    this.height = 100,
    this.width = 2,
    this.color = Colors.grey,
    this.dashHeight = 5,
    this.dashSpacing = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: height,
        width: width,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double totalHeight = constraints.maxHeight;
            final int dashCount = (totalHeight / (dashHeight + dashSpacing)).floor();
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(dashCount, (_) {
                return Container(
                  height: dashHeight,
                  width: width,
                  color: color,
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
