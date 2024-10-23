import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonButton.dart';
import 'package:household_account_book_app/common/CommonContainer.dart';
import 'package:household_account_book_app/common/CommonDivider.dart';
import 'package:household_account_book_app/common/CommonSpace.dart';
import 'package:household_account_book_app/common/CommonTag.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/widget/bottomSheet/CategoryBottomSheet.dart';
import 'package:household_account_book_app/widget/bottomSheet/TitleSettingModalSheet.dart';
import 'package:household_account_book_app/widget/view/recordView/RecordButtonView.dart';
import 'package:household_account_book_app/widget/view/recordView/RecordItemView.dart';
import 'package:household_account_book_app/widget/view/recordView/RecordTitleView.dart';

class RecordContainerView extends StatefulWidget {
  RecordContainerView({super.key});

  @override
  State<RecordContainerView> createState() => _RecordContainerViewState();
}

class _RecordContainerViewState extends State<RecordContainerView> {
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      outerPadding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecordTitleView(),
          CommonSpace(height: 5),
          RecordItemView(
            categoryName: '용돈',
            price: '12,000원',
            categoryColor: blue.s100,
            householdColor: blue.s400,
            symbol: '+',
            accountName: '현금',
          ),
          RecordItemView(
            categoryName: '광고비',
            price: '110,000원',
            categoryColor: red.s100,
            householdColor: red.s400,
            symbol: '-',
            accountName: '체크카드',
          ),
          CommonSpace(height: 5),
          RecordButtonView()
        ],
      ),
    );
  }
}

  // InkWell(
  //               onTap: onOpen,
  //               child: svgAsset(
  //                 name: '${isOpen ? 'open' : 'close'}-light',
  //                 width: 20,
  //                 color: indigo.s200,
  //               ),
  //             ),