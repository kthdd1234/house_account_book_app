import 'package:flutter/cupertino.dart';
import 'package:household_account_book_app/common/CommonCalendar.dart';
import 'package:household_account_book_app/provider/SelectedDateTimeProvider.dart';
import 'package:household_account_book_app/provider/TitleDateTimeProvider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class RecordCalendarView extends StatefulWidget {
  const RecordCalendarView({super.key});

  @override
  State<RecordCalendarView> createState() => _RecordCalendarViewState();
}

class _RecordCalendarViewState extends State<RecordCalendarView> {
  Widget? stickerBuilder(bool isLight, DateTime dateTime) {
    //
  }

  void onDaySelected(DateTime dateTime) {
    context
        .read<TitleDateTimeProvider>()
        .changeTitleDateTime(dateTime: dateTime);

    context
        .read<SelectedDateTimeProvider>()
        .changeSelectedDateTime(dateTime: dateTime);
  }

  void onPageChanged(DateTime dateTime) {
    context
        .read<TitleDateTimeProvider>()
        .changeTitleDateTime(dateTime: dateTime);
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedDateTime =
        context.watch<SelectedDateTimeProvider>().seletedDateTime;

    return CommonCalendar(
      selectedDateTime: selectedDateTime,
      calendarFormat: CalendarFormat.month,
      shouldFillViewport: false,
      markerBuilder: stickerBuilder,
      onPageChanged: onPageChanged,
      onDaySelected: onDaySelected,
      onFormatChanged: (_) => {},
    );
  }
}
