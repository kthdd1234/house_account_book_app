import 'package:flutter/material.dart';
import 'package:household_account_book_app/provider/SelectedDateTimeProvider.dart';
import 'package:household_account_book_app/provider/TitleDateTimeProvider.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/widget/appBar/RecordAppBar.dart';
import 'package:household_account_book_app/widget/view/recordView/RecordCalendarView.dart';
import 'package:household_account_book_app/widget/view/recordView/RecordContainerView.dart';
import 'package:provider/provider.dart';

class RecordBody extends StatefulWidget {
  const RecordBody({super.key});

  @override
  State<RecordBody> createState() => _RecordBodyState();
}

class _RecordBodyState extends State<RecordBody> {
  onTitleCalendar() {
    //
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedDateTime =
        context.watch<SelectedDateTimeProvider>().seletedDateTime;

    onHorizontalDragEnd(DragEndDetails dragEndDetails) {
      double? primaryVelocity = dragEndDetails.primaryVelocity;

      if (primaryVelocity == null) {
        return;
      } else if (primaryVelocity > 0) {
        selectedDateTime = selectedDateTime.subtract(const Duration(days: 1));
      } else if (primaryVelocity < 0) {
        selectedDateTime = selectedDateTime.add(const Duration(days: 1));
      }

      context
          .read<SelectedDateTimeProvider>()
          .changeSelectedDateTime(dateTime: selectedDateTime);
      context
          .read<TitleDateTimeProvider>()
          .changeTitleDateTime(dateTime: selectedDateTime);
    }

    return GestureDetector(
      onHorizontalDragEnd: onHorizontalDragEnd,
      child: Column(
        children: [
          RecordAppBar(onTitleCalendar: onTitleCalendar),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RecordCalendarView(),
                  RecordContainerView(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
