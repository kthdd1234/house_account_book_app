import 'package:flutter/material.dart';
import 'package:household_account_book_app/provider/SelectedDateTimeProvider.dart';
import 'package:household_account_book_app/provider/TitleDateTimeProvider.dart';
import 'package:household_account_book_app/util/func.dart';
import 'package:household_account_book_app/widget/appBar/RecordAppBar.dart';
import 'package:household_account_book_app/widget/popup/CalendarPopup.dart';
import 'package:household_account_book_app/widget/view/recordView/RecordCalendarView.dart';
import 'package:household_account_book_app/widget/view/recordView/RecordContainerView.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RecordBody extends StatefulWidget {
  const RecordBody({super.key});

  @override
  State<RecordBody> createState() => _RecordBodyState();
}

class _RecordBodyState extends State<RecordBody> {
  onTitleDateTime(DateTime titleDateTime) {
    showDialog(
      context: context,
      builder: (context) => CalendarPopup(
        view: DateRangePickerView.year,
        initialdDateTime: titleDateTime,
        onSelectionChanged: (args) async {
          context
              .read<TitleDateTimeProvider>()
              .changeTitleDateTime(dateTime: args.value);
          context
              .read<SelectedDateTimeProvider>()
              .changeSelectedDateTime(dateTime: args.value);

          navigatorPop(context);
        },
      ),
    );
  }

  onHorizontalDragEnd(
    DragEndDetails dragEndDetails,
    DateTime selectedDateTime,
  ) {
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

  @override
  Widget build(BuildContext context) {
    DateTime selectedDateTime =
        context.watch<SelectedDateTimeProvider>().seletedDateTime;

    return GestureDetector(
      onHorizontalDragEnd: (dragDetails) => onHorizontalDragEnd(
        dragDetails,
        selectedDateTime,
      ),
      child: Column(
        children: [
          RecordAppBar(onTitleDateTime: onTitleDateTime),
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
