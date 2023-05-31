import 'package:flutter/material.dart';

class LineSeperator extends StatelessWidget {
  const LineSeperator({super.key, required this.color, this.height = 2.0});
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: height, color: color),
      )),
    );
  }
}
