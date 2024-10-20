import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonButton.dart';
import 'package:household_account_book_app/common/CommonContainer.dart';
import 'package:household_account_book_app/common/CommonModalSheet.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/util/func.dart';
import 'package:provider/provider.dart';

class AmountBottomSheet extends StatefulWidget {
  AmountBottomSheet({super.key, required this.category});

  String category;

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
        title: widget.category,
        height: 178,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonContainer(
                height: 55,
                outerPadding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: controller,
                  autofocus: true,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  cursorColor: isLight ? blue.s300 : Colors.white,
                  decoration: InputDecoration(
                    hintText: '수입 금액을 입력해주세요.'.tr(),
                    hintStyle: TextStyle(color: grey.s400),
                    contentPadding: const EdgeInsets.all(0),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                  ),
                  onEditingComplete: onCompleted,
                ),
              ),
              CommonButton(
                text: '완료',
                textColor: Colors.white,
                buttonColor: blue.s200,
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
