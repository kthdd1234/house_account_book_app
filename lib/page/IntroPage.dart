// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonBackground.dart';
import 'package:household_account_book_app/common/CommonButton.dart';
import 'package:household_account_book_app/common/CommonNull.dart';
import 'package:household_account_book_app/common/CommonScaffold.dart';
import 'package:household_account_book_app/common/CommonSpace.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/service/AuthService.dart';
import 'package:household_account_book_app/util/class.dart';
import 'package:household_account_book_app/util/constants.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  AuthService authService = AuthService();

  onGoogleLogin() {
    authService.signInWithGoogle(context);
  }

  onAppleLogin() {
    authService.signInWithApple(context);
  }

  onkakaoLogin() {
    // authService.signInWithKakao(context);
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: CommonScaffold(
        appBarInfo: AppBarInfoClass(title: '로그인', isCenter: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            CommonText(text: '반가워요! 가계부 메이트와 함께'),
            CommonSpace(height: 2),
            CommonText(text: '꾸준히 가계부 쓰는 습관을 만들어봐요 :D'),
            const Spacer(),
            CommonButton(
              svg: 'google-logo',
              outerPadding: const EdgeInsets.symmetric(horizontal: 10),
              text: 'Google로 로그인',
              textColor: darkButtonColor,
              buttonColor: Colors.white,
              verticalPadding: 15,
              borderRadius: 7,
              onTap: onGoogleLogin,
            ),
            CommonSpace(height: 10),
            Platform.isIOS
                ? CommonButton(
                    svg: 'apple-logo',
                    outerPadding: const EdgeInsets.symmetric(horizontal: 10),
                    text: 'Apple로 로그인',
                    textColor: Colors.white,
                    buttonColor: darkButtonColor,
                    verticalPadding: 15,
                    borderRadius: 7,
                    onTap: onAppleLogin,
                  )
                : const CommonNull()
          ],
        ),
      ),
    );
  }
}

          // CommonButton(
            //   svg: 'kakao-logo',
            //   outerPadding: const EdgeInsets.symmetric(horizontal: 10),
            //   text: 'Kakao로 로그인',
            //   textColor: kakaoTextColor,
            //   buttonColor: kakaoBgColor,
            //   verticalPadding: 15,
            //   borderRadius: 7,
            //   onTap: onkakaoLogin,
            // ),
            // CommonSpace(height: 10),