import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonContainer.dart';
import 'package:household_account_book_app/common/CommonModalItem.dart';
import 'package:household_account_book_app/common/CommonModalSheet.dart';
import 'package:household_account_book_app/common/CommonOutlineInputField.dart';
import 'package:household_account_book_app/common/CommonSpace.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/class.dart';
import 'package:household_account_book_app/util/func.dart';
import 'package:household_account_book_app/widget/list/ColorList.dart';
import 'package:provider/provider.dart';

class TitleSettingModalSheet extends StatefulWidget {
  TitleSettingModalSheet({super.key});

  @override
  State<TitleSettingModalSheet> createState() => _TitleSettingModalSheetState();
}

class _TitleSettingModalSheetState extends State<TitleSettingModalSheet> {
  String selectedColorName = '남색';
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // if (widget.groupInfo != null) {
    //   controller.text = widget.groupInfo!.name;
    //   selectedColorName = widget.groupInfo!.colorName;
    // }

    super.initState();
  }

  onColor(String colorName) {
    setState(() => selectedColorName = colorName);
  }

  @override
  Widget build(BuildContext context) {
    bool isLight = context.watch<ThemeProvider>().isLight;
    ColorClass color = getColorClass(selectedColorName);
    double bottom = MediaQuery.of(context).viewInsets.bottom;

    onEditingComplete() async {
      DateTime now = DateTime.now();
      //

      navigatorPop(context);
    }

    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: CommonModalSheet(
        title: '제목 편집',
        height: 210,
        child: CommonContainer(
          innerPadding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              CommonModalItem(
                title: '색상',
                onTap: () {},
                child: ColorList(
                  selectedColorName: selectedColorName,
                  onColor: onColor,
                ),
              ),
              CommonSpace(height: 15),
              CommonOutlineInputField(
                controller: controller,
                hintText: '제목을 입력해주세요',
                selectedColor: isLight ? color.s200 : color.s300,
                onSuffixIcon: onEditingComplete,
                onEditingComplete: onEditingComplete,
                onChanged: (_) => setState(() {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
