import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:provider/provider.dart';

class CommonText extends StatelessWidget {
  CommonText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.isNotTr,
    this.isBold,
    this.highlightColor,
    this.nameArgs,
    this.onTap,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.decoration,
    this.decorationColor,
  });

  String text;
  Color? color;
  double? fontSize;
  bool? isNotTr, isBold;
  Color? highlightColor;
  Map<String, String>? nameArgs;
  TextAlign? textAlign;
  TextOverflow? overflow;
  bool? softWrap;
  TextDecoration? decoration;
  Color? decorationColor;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<ThemeProvider>().isLight;
    Color defaultColor = isLight ? Colors.black : darkTextColor;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(highlightColor != null ? 3 : 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: highlightColor,
        ),
        child: Text(
          isNotTr == true ? text : text.tr(namedArgs: nameArgs),
          textAlign: textAlign ?? TextAlign.center,
          softWrap: softWrap ?? true,
          style: TextStyle(
            color: color ?? defaultColor,
            fontSize: fontSize ?? defaultFontSize,
            fontWeight: isBold == true ? FontWeight.bold : FontWeight.w400,
            overflow: overflow,
            decoration: decoration,
            decorationColor: decorationColor,
          ),
        ),
      ),
    );
  }
}
