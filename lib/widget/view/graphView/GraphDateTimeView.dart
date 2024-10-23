import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonSegmented.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/enum.dart';
import 'package:household_account_book_app/util/func.dart';
import 'package:provider/provider.dart';

class GraphDateTimeView extends StatelessWidget {
  GraphDateTimeView({
    super.key,
    required this.dateTimeSegment,
    required this.onDateTimeChanged,
  });

  SegmentedTypeEnum dateTimeSegment;
  Function(SegmentedTypeEnum?) onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<ThemeProvider>().isLight;

    return CommonSegmented(
      selectedSegment: dateTimeSegment,
      children: dateTimeSegmented(dateTimeSegment, isLight),
      onSegmentedChanged: onDateTimeChanged,
    );
  }
}
