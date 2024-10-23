import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:household_account_book_app/util/final.dart';

class CommonInputField extends StatelessWidget {
  CommonInputField({
    super.key,
    required this.controller,
    required this.cursorColor,
    required this.hintText,
    required this.keyboardType,
    required this.onCompleted,
  });

  TextEditingController controller;
  Color cursorColor;
  String hintText;
  TextInputType keyboardType;
  Function() onCompleted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      keyboardType: keyboardType,
      cursorColor: cursorColor,
      decoration: InputDecoration(
        hintText: hintText.tr(),
        hintStyle: TextStyle(color: grey.s400),
        contentPadding: const EdgeInsets.all(0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
      onEditingComplete: onCompleted,
    );
  }
}
