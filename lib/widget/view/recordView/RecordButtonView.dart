import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonButton.dart';
import 'package:household_account_book_app/common/CommonSpace.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/widget/bottomSheet/CategoryBottomSheet.dart';

class RecordButtonView extends StatefulWidget {
  const RecordButtonView({super.key});

  @override
  State<RecordButtonView> createState() => _RecordButtonViewState();
}

class _RecordButtonViewState extends State<RecordButtonView> {
  onAdd(String type) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => CategoryBottomSheet(type: type),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CommonButton(
            text: '+ 수입',
            fontSize: defaultFontSize + 1,
            textColor: blue.original,
            buttonColor: blue.s50.withOpacity(0.7),
            verticalPadding: 10,
            borderRadius: 5,
            onTap: () => onAdd(eIncome),
          ),
        ),
        CommonSpace(width: 5),
        Expanded(
          child: CommonButton(
            text: '- 지출',
            fontSize: defaultFontSize + 1,
            textColor: red.original,
            buttonColor: red.s50.withOpacity(0.7),
            verticalPadding: 10,
            borderRadius: 5,
            onTap: () => onAdd(eSpend),
          ),
        ),
      ],
    );
  }
}
