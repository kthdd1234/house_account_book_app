import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/common/CommonVerticalLine.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:household_account_book_app/util/final.dart';

class RecordItemView extends StatelessWidget {
  RecordItemView({
    super.key,
    required this.categoryName,
    required this.price,
    required this.symbol,
    required this.accountName,
    required this.categoryColor,
    required this.householdColor,
    this.memo,
  });

  String categoryName, price, symbol, accountName;
  String? memo;
  Color categoryColor, householdColor;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          children: [
            CommonVerticalLine(color: categoryColor),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(text: categoryName),
                // CommonText(
                //   text: '$accountName${memo != null ? ', $memo' : ''}',
                //   color: Colors.grey,
                //   fontSize: defaultFontSize - 2,
                // ),
              ],
            ),
            const Spacer(),
            CommonText(text: '$symbol$price', color: householdColor),
          ],
        ),
      ),
    );
  }
}
