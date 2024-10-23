import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonText.dart';

class CommonImageButton extends StatelessWidget {
  CommonImageButton({
    super.key,
    required this.path,
    required this.text,
    required this.padding,
    required this.onTap,
    this.width,
    this.nameArgs,
  });

  String path, text;
  EdgeInsets padding;
  double? width;
  Map<String, String>? nameArgs;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/$path.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: padding,
        child: CommonText(
          text: text,
          color: Colors.white,
          nameArgs: nameArgs,
        ),
      ),
    );
  }
}
