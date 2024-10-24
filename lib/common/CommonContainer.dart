import 'package:flutter/material.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:provider/provider.dart';

class CommonContainer extends StatelessWidget {
  CommonContainer({
    super.key,
    required this.child,
    this.innerPadding,
    this.outerPadding,
    this.color,
    this.radius,
    this.onTap,
    this.height,
  });

  Widget child;
  Color? color;
  double? radius, height;
  EdgeInsets? innerPadding, outerPadding;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<ThemeProvider>().isLight;

    // themeContainerColor
    return Padding(
      padding: outerPadding ?? const EdgeInsets.all(0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          padding: innerPadding ?? const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color ?? (isLight ? Colors.white : darkContainerColor),
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          child: child,
        ),
      ),
    );
  }
}
