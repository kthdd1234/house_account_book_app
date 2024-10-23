import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/util/constants.dart';

class GraphAppBar extends StatelessWidget {
  const GraphAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [CommonText(text: '그래프', fontSize: defaultFontSize + 4)],
      ),
    );
  }
}
