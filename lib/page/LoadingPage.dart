import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonBackground.dart';
import 'package:household_account_book_app/common/CommonScaffold.dart';
import 'package:household_account_book_app/common/CommonSpace.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/util/constants.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: CommonScaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                color: buttonColor,
                strokeWidth: 3,
              ),
              CommonSpace(height: 30),
              CommonText(
                text: '로그인 정보를 불러오고 있어요 ...',
                isBold: true,
                fontSize: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
