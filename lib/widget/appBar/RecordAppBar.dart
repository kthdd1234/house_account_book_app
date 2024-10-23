import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonSpace.dart';
import 'package:household_account_book_app/common/CommonSvgText.dart';
import 'package:household_account_book_app/common/CommonTag.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/provider/SelectedDateTimeProvider.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/provider/TitleDateTimeProvider.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:household_account_book_app/util/enum.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/util/func.dart';
import 'package:provider/provider.dart';

class RecordAppBar extends StatelessWidget {
  RecordAppBar({super.key, required this.onTitleDateTime});

  Function(DateTime dateTime) onTitleDateTime;

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<ThemeProvider>().isLight;
    String locale = context.locale.toString();
    DateTime titleDateTime =
        context.watch<TitleDateTimeProvider>().titleDateTime;

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CommonSvgText(
              text: yMFormatter(locale: locale, dateTime: titleDateTime),
              fontSize: defaultFontSize + 4,
              isNotTr: true,
              textColor: isLight ? darkButtonColor : Colors.white,
              svgWidth: 6,
              svgLeft: 3,
              svgName: 'dir-right-s',
              svgColor: isLight ? darkButtonColor : Colors.white,
              svgDirection: SvgDirectionEnum.right,
              onTap: () => onTitleDateTime(titleDateTime),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonText(text: '수입'),
                  CommonSpace(width: 5),
                  CommonText(text: '122,000원', color: blue.original),
                  CommonSpace(width: 10),
                  CommonText(text: '지출'),
                  CommonSpace(width: 5),
                  CommonText(text: '40,250원', color: red.original),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
