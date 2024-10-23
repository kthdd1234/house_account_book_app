import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonContainer.dart';
import 'package:household_account_book_app/common/CommonModalSheet.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/page/CategoryPage.dart';
import 'package:household_account_book_app/util/class.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/util/func.dart';
import 'package:household_account_book_app/widget/bottomSheet/AmountBottomSheet.dart';

class CategoryBottomSheet extends StatefulWidget {
  CategoryBottomSheet({super.key, required this.type});

  String type;

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  String selectedCategoryInfoId = '';

  @override
  Widget build(BuildContext context) {
    HouseholdInfoClass householdInfo =
        widget.type == eIncome ? incomeInfo : spendInfo;
    List<CategoryInfoClass> categoryInfoList = widget.type == eIncome
        ? initIncomeCategoryInfoList
        : initSpendCategoryInfoList;

    onCategory(CategoryInfoClass categoryInfo) {
      setState(() => selectedCategoryInfoId = categoryInfo.id);
      showModalBottomSheet(
        context: context,
        builder: (context) => AmountBottomSheet(
          householdInfo: householdInfo,
          categoryInfo: categoryInfo,
        ),
      );
    }

    onManage() {
      movePage(
        context: context,
        page: CategoryPage(householdInfo: householdInfo),
      );
    }

    return CommonModalSheet(
      title: '${householdInfo.name} 카테고리',
      color: householdInfo.color.original,
      actionButton: InkWell(
        onTap: onManage,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
          child: svgAsset(
            name: 'list-add',
            width: 18,
            color: householdInfo.color.original,
          ),
        ),
      ),
      background: householdInfo.background,
      height: 400,
      child: CommonContainer(
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: categoryInfoList
                .map((categoryInfo) => CategoryInfo(
                      selectedCategoryInfoId: selectedCategoryInfoId,
                      householdInfo: householdInfo,
                      categoryInfo: categoryInfo,
                      onCategory: onCategory,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class CategoryInfo extends StatelessWidget {
  CategoryInfo({
    super.key,
    required this.selectedCategoryInfoId,
    required this.householdInfo,
    required this.categoryInfo,
    required this.onCategory,
  });

  String selectedCategoryInfoId;
  HouseholdInfoClass householdInfo;
  CategoryInfoClass categoryInfo;
  Function(CategoryInfoClass) onCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCategory(categoryInfo),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: selectedCategoryInfoId == categoryInfo.id
              ? householdInfo.color.s50
              : grey.s100,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: CommonText(
          text: categoryInfo.name,
          color: selectedCategoryInfoId == categoryInfo.id
              ? householdInfo.color.original
              : Colors.grey,
          isNotTr: true,
        ),
      ),
    );
  }
}
