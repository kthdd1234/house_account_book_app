import 'package:flutter/cupertino.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:provider/provider.dart';

class CommonSwitch extends StatelessWidget {
  CommonSwitch({
    super.key,
    required this.activeColor,
    required this.value,
    required this.onChanged,
  });

  Color activeColor;
  bool value;
  Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<ThemeProvider>().isLight;

    return SizedBox(
      width: 45,
      height: 25,
      child: CupertinoSwitch(
        trackColor: isLight ? null : darkNotSelectedBgColor,
        activeColor: activeColor,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
