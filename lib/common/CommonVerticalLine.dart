import 'package:flutter/material.dart';

class CommonVerticalLine extends StatelessWidget {
  CommonVerticalLine({
    super.key,
    required this.color,
    this.width,
    this.right,
  });

  Color color;
  double? width, right;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Padding(
        padding: EdgeInsets.only(right: right ?? 10),
        child: Container(
          width: width ?? 3,
          height: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(2),
              bottom: Radius.circular(2),
            ),
          ),
        ),
      ),
    );
  }
}
