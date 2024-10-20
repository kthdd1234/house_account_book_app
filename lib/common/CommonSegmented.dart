import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:household_account_book_app/util/enum.dart';
import 'package:provider/provider.dart';

class CommonSegmented extends StatelessWidget {
  CommonSegmented({
    super.key,
    required this.selectedSegment,
    required this.children,
    required this.onSegmentedChanged,
  });

  SegmentedTypeEnum selectedSegment;
  Map<SegmentedTypeEnum, Widget> children;

  Function(SegmentedTypeEnum? type) onSegmentedChanged;

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<ThemeProvider>().isLight;

    return Row(
      children: [
        Expanded(
          child: CupertinoSlidingSegmentedControl(
            backgroundColor: isLight ? Colors.white : darkNotSelectedBgColor,
            thumbColor: isLight ? selectedColor : darkNotSelectedTextColor,
            groupValue: selectedSegment,
            children: children,
            onValueChanged: onSegmentedChanged,
          ),
        ),
      ],
    );
  }
}
