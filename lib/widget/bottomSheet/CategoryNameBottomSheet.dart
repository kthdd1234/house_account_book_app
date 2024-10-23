import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonContainer.dart';
import 'package:household_account_book_app/common/CommonModalSheet.dart';
import 'package:household_account_book_app/common/CommonInputField.dart';
import 'package:household_account_book_app/util/class.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/util/func.dart';

class CategoryNameBottomSheet extends StatefulWidget {
  CategoryNameBottomSheet({super.key, required this.householdInfo});

  HouseholdInfoClass householdInfo;

  @override
  State<CategoryNameBottomSheet> createState() =>
      _CategoryNameBottomSheetState();
}

class _CategoryNameBottomSheetState extends State<CategoryNameBottomSheet> {
  TextEditingController controller = TextEditingController();

  onCompleted() {
    navigatorPop(context);
  }

  @override
  Widget build(BuildContext context) {
    double bottom = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: CommonModalSheet(
        title: '${widget.householdInfo.name} 카테고리 추가',
        height: 125,
        child: CommonContainer(
          outerPadding: const EdgeInsets.only(bottom: 5),
          child: CommonInputField(
            controller: controller,
            keyboardType: TextInputType.text,
            cursorColor: widget.householdInfo.color.s300,
            hintText: '이름을 입력해주세요',
            onCompleted: onCompleted,
          ),
        ),
      ),
    );
  }
}
