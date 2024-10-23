import 'package:flutter/material.dart';
import 'package:household_account_book_app/util/enum.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/util/func.dart';
import 'package:household_account_book_app/widget/appBar/GraphAppBar.dart';
import 'package:household_account_book_app/widget/view/graphView/GraphContentsView.dart';
import 'package:household_account_book_app/widget/view/graphView/GraphDateTimeView.dart';
import 'package:household_account_book_app/widget/view/graphView/GraphTitleView.dart';
import 'package:household_account_book_app/widget/view/graphView/GraphTypeView.dart';

class GraphBody extends StatefulWidget {
  const GraphBody({super.key});

  @override
  State<GraphBody> createState() => _GraphBodyState();
}

class _GraphBodyState extends State<GraphBody> {
  late DateTime startDateTime, endDateTime;

  SegmentedTypeEnum graphTypeSegment = SegmentedTypeEnum.spend;
  SegmentedTypeEnum dateTimeSegment = SegmentedTypeEnum.week;

  @override
  void initState() {
    initializeDateTime();
    super.initState();
  }

  initializeDateTime() {
    DateTime now = DateTime.now();

    startDateTime = jumpDayDateTime(
      type: JumpDayTypeEnum.subtract,
      dateTime: now,
      days: rangeInfo[dateTimeSegment]!,
    );
    endDateTime = now;
  }

  onGraphTypeChanged(graphType) {
    setState(() => graphTypeSegment = graphType);
  }

  onDateTimeChanged(dateTime) {
    setState(() {
      dateTimeSegment = dateTime;
      initializeDateTime();
    });
  }

  onChartSwipeDirectionStart() {
    setState(() {
      endDateTime = startDateTime;
      startDateTime = jumpDayDateTime(
        type: JumpDayTypeEnum.subtract,
        dateTime: endDateTime,
        days: rangeInfo[dateTimeSegment]!,
      );
    });
  }

  onChartSwipeDirectionEnd() {
    setState(() {
      if (dateTimeKey(endDateTime) >= dateTimeKey(DateTime.now())) {
        // ignore: void_checks
        return showSnackBar(
          context: context,
          text: '미래의 날짜를 불러올 순 없어요.',
          buttonName: '확인',
        );
      }

      startDateTime = endDateTime;
      endDateTime = jumpDayDateTime(
        type: JumpDayTypeEnum.add,
        dateTime: startDateTime,
        days: rangeInfo[dateTimeSegment]!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GraphAppBar(),
        GraphTypeView(
          graphTypeSegment: graphTypeSegment,
          onGraphTypeChanged: onGraphTypeChanged,
        ),
        GraphTitleView(startDateTime: startDateTime, endDateTime: endDateTime),
        GraphContentsView(),
        GraphDateTimeView(
          dateTimeSegment: dateTimeSegment,
          onDateTimeChanged: onDateTimeChanged,
        )
      ],
    );
  }
}
