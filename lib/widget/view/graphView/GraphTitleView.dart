import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/util/func.dart';

class GraphTitleView extends StatelessWidget {
  GraphTitleView({
    super.key,
    required this.startDateTime,
    required this.endDateTime,
  });

  DateTime startDateTime, endDateTime;

  @override
  Widget build(BuildContext context) {
    String locale = context.locale.toString();

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CommonText(
            text: '${ymdeShortFormatter(
              locale: locale,
              dateTime: startDateTime,
            )} ~ ${ymdeShortFormatter(
              locale: locale,
              dateTime: endDateTime,
            )}',
            fontSize: defaultFontSize - 1,
            color: grey.original,
            isNotTr: true,
          )
        ],
      ),
    );
  }
}
