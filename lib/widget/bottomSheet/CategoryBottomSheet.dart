import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonContainer.dart';
import 'package:household_account_book_app/common/CommonModalSheet.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/widget/bottomSheet/AmountBottomSheet.dart';

class CategoryBottomSheet extends StatefulWidget {
  const CategoryBottomSheet({super.key});

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  onNext(String category) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AmountBottomSheet(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonModalSheet(
        title: '수입 카테고리',
        height: 400,
        child: CommonContainer(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              CategoryInfo(
                isFilled: true,
                isOutline: true,
                onItem: () => onNext('선경 썬키스트'),
              ),
            ],
          ),
        ));
  }
}

class CategoryInfo extends StatelessWidget {
  CategoryInfo({
    super.key,
    // required this.id,
    // required this.text,
    // required this.colorName,
    // required this.info,
    required this.isFilled,
    required this.onItem,
    this.isOutline,
  });

  // String id, text, colorName;
  bool isFilled;
  bool? isOutline;
  Function() onItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItem(),
      child: Container(
        padding: isOutline == true
            ? const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
            : null,
        decoration: isOutline == true
            ? BoxDecoration(
                color: isFilled ? blue.s50 : null,
                border: Border.all(
                  width: 0.5,
                  color: isFilled ? blue.s50 : grey.s300,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              )
            : null,
        child: CommonText(
          text: '💰선경 썬키스트',
          color: isFilled ? blue.original : grey.s400,
          isNotTr: true,
        ),
      ),
    );
  }
}
