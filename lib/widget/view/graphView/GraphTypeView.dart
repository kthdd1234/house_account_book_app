import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonSegmented.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/enum.dart';
import 'package:household_account_book_app/util/func.dart';
import 'package:provider/provider.dart';

class GraphTypeView extends StatelessWidget {
  GraphTypeView({
    super.key,
    required this.graphTypeSegment,
    required this.onGraphTypeChanged,
  });

  SegmentedTypeEnum graphTypeSegment;
  Function(SegmentedTypeEnum?) onGraphTypeChanged;

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<ThemeProvider>().isLight;

    return CommonSegmented(
      selectedSegment: graphTypeSegment,
      children: householdSegmented(graphTypeSegment, isLight),
      onSegmentedChanged: onGraphTypeChanged,
    );
  }
}
