import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonButton.dart';
import 'package:household_account_book_app/common/CommonContainer.dart';
import 'package:household_account_book_app/common/CommonModalSheet.dart';
import 'package:household_account_book_app/common/CommonInputField.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/class.dart';
import 'package:household_account_book_app/util/func.dart';
import 'package:provider/provider.dart';

class AmountBottomSheet extends StatefulWidget {
  AmountBottomSheet({
    super.key,
    required this.householdInfo,
    required this.categoryInfo,
  });

  HouseholdInfoClass householdInfo;
  CategoryInfoClass categoryInfo;

  @override
  State<AmountBottomSheet> createState() => _AmountBottomSheetState();
}

class _AmountBottomSheetState extends State<AmountBottomSheet> {
  TextEditingController controller = TextEditingController();

  onCompleted() async {
    navigatorPop(context);
  }

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<ThemeProvider>().isLight;
    double bottom = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: CommonModalSheet(
        title: widget.categoryInfo.name,
        background: widget.householdInfo.background,
        height: 180,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonContainer(
                height: 55,
                outerPadding: const EdgeInsets.only(bottom: 10),
                child: CommonInputField(
                  controller: controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  cursorColor:
                      isLight ? widget.householdInfo.color.s200 : Colors.white,
                  hintText: '${widget.householdInfo.name} 금액을 입력해주세요.',
                  onCompleted: onCompleted,
                ),
              ),
              CommonButton(
                text: '완료',
                textColor: Colors.white,
                buttonColor: widget.householdInfo.color.s200,
                verticalPadding: 12.5,
                borderRadius: 5,
                isBold: true,
                onTap: onCompleted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
