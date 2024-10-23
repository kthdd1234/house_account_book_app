import 'package:flutter/material.dart';
import 'package:household_account_book_app/body/RecordBody.dart';
import 'package:household_account_book_app/body/GraphBody.dart';
import 'package:household_account_book_app/body/SettingBody.dart';
import 'package:household_account_book_app/body/TableBody.dart';
import 'package:household_account_book_app/common/CommonBackground.dart';
import 'package:household_account_book_app/common/CommonScaffold.dart';
import 'package:household_account_book_app/provider/BottomTabIndexProvider.dart';
import 'package:household_account_book_app/provider/SelectedDateTimeProvider.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/provider/TitleDateTimeProvider.dart';
import 'package:household_account_book_app/util/func.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.locale});

  String locale;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  onBottomNavigation(int newIndex) {
    DateTime now = DateTime.now();

    if (newIndex == 0) {
      context
          .read<SelectedDateTimeProvider>()
          .changeSelectedDateTime(dateTime: now);
      context.read<TitleDateTimeProvider>().changeTitleDateTime(dateTime: now);
    }

    context.read<BottomTabIndexProvider>().changeSeletedIdx(newIndex: newIndex);
  }

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<ThemeProvider>().isLight;
    int seletedIdx = context.watch<BottomTabIndexProvider>().seletedIdx;

    Widget body = [
      const RecordBody(),
      const GraphBody(),
      const SettingBody()
    ][seletedIdx];

    return CommonBackground(
      child: CommonScaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: body,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: BottomNavigationBar(
            items: getBnbiList(isLight, seletedIdx),
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: seletedIdx,
            onTap: onBottomNavigation,
          ),
        ),
      ),
    );
  }
}
