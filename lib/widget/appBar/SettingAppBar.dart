import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/util/constants.dart';

class SettingAppBar extends StatelessWidget {
  const SettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [CommonText(text: '설정', fontSize: defaultFontSize + 4)],
      ),
    );
  }
}
