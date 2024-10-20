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
import 'package:household_account_book_app/widget/view/recordView/RecordItemView.dart';

class RecordContainerView extends StatefulWidget {
  RecordContainerView({super.key});

  @override
  State<RecordContainerView> createState() => _RecordContainerViewState();
}

class _RecordContainerViewState extends State<RecordContainerView> {
  onTitle() {
    showModalBottomSheet(
      context: context,
      builder: (context) => TitleSettingModalSheet(),
    );
  }

  onOpen() {
    //
  }

  onAdd() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => CategoryBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isOpen = true;
    // HouseholdContainerClass householdContainer =
    //     widget.type == eIncome ? incomeContainer : spendContainer;

    return CommonContainer(
      outerPadding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CommonTag(
                text: '수입/지출 리스트',
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
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  text: '+ 수입',
                  fontSize: defaultFontSize + 1,
                  textColor: blue.original,
                  buttonColor: blue.s50.withOpacity(0.7),
                  verticalPadding: 10,
                  borderRadius: 5,
                  onTap: onAdd,
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
                  onTap: onAdd,
                ),
              ),
            ],
          ),
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