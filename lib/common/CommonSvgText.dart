import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonNull.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/util/enum.dart';
import 'package:household_account_book_app/util/func.dart';

class CommonSvgText extends StatelessWidget {
  CommonSvgText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.svgWidth,
    required this.svgDirection,
    this.svgName,
    this.isBold,
    this.isNotTr,
    this.svgRight,
    this.svgLeft,
    this.svgColor,
    this.textColor,
    this.onTap,
    this.isCenter,
  });

  String text;
  String? svgName;
  Color? textColor, svgColor;
  double svgWidth, fontSize;
  double? svgLeft, svgRight;
  bool? isBold, isNotTr, isCenter;
  SvgDirectionEnum svgDirection;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      CommonText(
        text: text,
        fontSize: fontSize,
        isNotTr: isNotTr,
        isBold: isBold,
        color: textColor,
        overflow: TextOverflow.ellipsis,
      )
    ];

    svgDirection == SvgDirectionEnum.left
        ? svgName != null
            ? children.insert(
                0,
                Padding(
                  padding: EdgeInsets.only(right: svgRight ?? 5),
                  child: svgAsset(
                    name: svgName!,
                    width: svgWidth,
                    color: svgColor,
                  ),
                ))
            : const CommonNull()
        : svgName != null
            ? children.add(Padding(
                padding: EdgeInsets.only(left: svgLeft ?? 5, top: 1),
                child: svgAsset(
                  name: svgName!,
                  width: svgWidth,
                  color: svgColor,
                ),
              ))
            : const CommonNull();

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: isCenter == true
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}
