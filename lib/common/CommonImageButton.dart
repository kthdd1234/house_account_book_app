import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonText.dart';

class ImageButton extends StatelessWidget {
  ImageButton({
    super.key,
    required this.path,
    required this.text,
    required this.padding,
    required this.onTap,
    this.nameArgs,
  });

  String path, text;
  EdgeInsets padding;
  Map<String, String>? nameArgs;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
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
          isBold: true,
        ),
      ),
    );
  }
}
