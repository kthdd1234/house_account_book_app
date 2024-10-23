import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonDivider.dart';
import 'package:household_account_book_app/common/CommonSpace.dart';
import 'package:household_account_book_app/common/CommonTag.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/widget/bottomSheet/TitleSettingModalSheet.dart';

class RecordTitleView extends StatefulWidget {
  const RecordTitleView({super.key});

  @override
  State<RecordTitleView> createState() => _RecordTitleViewState();
}

class _RecordTitleViewState extends State<RecordTitleView> {
  onTitle() {
    showModalBottomSheet(
      context: context,
      builder: (context) => TitleSettingModalSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CommonTag(
              text: '수입/지출 목록',
              textColor: indigo.original,
              bgColor: indigo.s50.withOpacity(0.5),
              onTap: onTitle,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CommonText(
                  text: '+12,000원',
                  fontSize: defaultFontSize - 4.5,
                  color: blue.s400,
                ),
                CommonText(
                  text: '-110,000원',
                  fontSize: defaultFontSize - 4.5,
                  color: red.s400,
                )
              ],
            ),
          ],
        ),
        CommonSpace(height: 10),
        CommonDivider(color: indigo.s50),
      ],
    );
  }
}
