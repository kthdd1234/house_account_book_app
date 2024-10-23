import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonButton.dart';
import 'package:household_account_book_app/common/CommonContainer.dart';
import 'package:household_account_book_app/common/CommonNull.dart';
import 'package:household_account_book_app/common/CommonPopup.dart';
import 'package:household_account_book_app/common/CommonSpace.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/util/func.dart';
import 'package:provider/provider.dart';

class AlertPopup extends StatelessWidget {
  AlertPopup({
    super.key,
    required this.desc,
    required this.buttonText,
    required this.height,
    required this.onTap,
    this.isCancel,
  });

  double height;
  String desc, buttonText;
  bool? isCancel;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<ThemeProvider>().isLight;

    return CommonPopup(
      insetPaddingHorizontal: 20,
      height: height,
      child: Column(
        children: [
          CommonContainer(child: CommonText(text: desc, isBold: !isLight)),
          CommonSpace(height: 15),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  text: buttonText,
                  textColor: Colors.white,
                  buttonColor: isLight ? red.s200 : darkButtonColor,
                  verticalPadding: 15,
                  borderRadius: 7,
                  onTap: onTap,
                ),
              ),
              CommonSpace(width: isCancel == true ? 10 : 0),
              isCancel == true
                  ? Expanded(
                      child: CommonButton(
                        text: '취소',
                        textColor: Colors.black,
                        buttonColor: Colors.white,
                        verticalPadding: 15,
                        borderRadius: 7,
                        isBold: false,
                        onTap: () => navigatorPop(context),
                      ),
                    )
                  : const CommonNull()
            ],
          ),
        ],
      ),
    );
  }
}
