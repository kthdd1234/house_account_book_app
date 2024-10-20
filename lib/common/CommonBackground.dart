import 'package:flutter/material.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:provider/provider.dart';

class CommonBackground extends StatelessWidget {
  CommonBackground({
    super.key,
    required this.child,
    this.isRadius,
    this.width,
    this.height,
    this.borderRadius,
    this.background,
  });

  bool? isRadius;
  double? width, height;
  BorderRadius? borderRadius;
  String? background;
  Widget child;

  @override
  Widget build(BuildContext context) {
    // UserInfoClass userInfo = context.watch<UserInfoProvider>().userInfo;
    bool isLight = context.watch<ThemeProvider>().isLight;
    // String path = background ?? userInfo.background;

    return Container(
      width: width,
      height: height ?? MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: isLight ? null : darkBgColor,
        borderRadius: borderRadius ??
            BorderRadius.circular(isRadius == true ? 10.0 : 0.0),
        image: isLight
            ? const DecorationImage(
                image: AssetImage('assets/images/background-image.png'),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: child,
    );
  }
}
