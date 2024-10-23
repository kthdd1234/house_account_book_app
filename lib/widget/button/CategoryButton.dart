import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:provider/provider.dart';

class CategoryActionButton extends StatelessWidget {
  CategoryActionButton({super.key, required this.onAdd});

  Function() onAdd;

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<ThemeProvider>().isLight;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        elevation: 0,
        foregroundColor: isLight ? Colors.black : Colors.white,
        backgroundColor: isLight ? Colors.white : darkContainerColor,
        onPressed: onAdd,
        icon: const Icon(Icons.add_rounded, size: 18),
        label: CommonText(text: '카테고리 추가', fontSize: 15),
      ),
    );
  }
}
