import 'package:flutter/material.dart';
import 'package:household_account_book_app/common/CommonBackground.dart';
import 'package:household_account_book_app/common/CommonContainer.dart';
import 'package:household_account_book_app/common/CommonNull.dart';
import 'package:household_account_book_app/common/CommonScaffold.dart';
import 'package:household_account_book_app/common/CommonSwitch.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/util/class.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/widget/bottomSheet/CategoryNameBottomSheet.dart';
import 'package:household_account_book_app/widget/button/CategoryButton.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({super.key, required this.householdInfo});

  HouseholdInfoClass householdInfo;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isEdit = false;

  onEdit() {
    setState(() => isEdit = !isEdit);
  }

  onAdd() {
    showModalBottomSheet(
      context: context,
      builder: (context) => CategoryNameBottomSheet(
        householdInfo: widget.householdInfo,
      ),
    );
  }

  onSwitch(bool newValue) {
    //
  }

  onCategory() {
    showModalBottomSheet(
      context: context,
      builder: (context) => CategoryNameBottomSheet(
        householdInfo: widget.householdInfo,
      ),
    );
  }

  onRemove() {
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertPopup(
    //     desc: '최소 1개 이상의 카테고리가 존재해야 합니다.',
    //     buttonText: '확인',
    //     height: 157,
    //     onTap: () => navigatorPop(context),
    //   ),
    // );
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertPopup(
    //     desc: '정말로 삭제할까요?',
    //     buttonText: '삭제하기',
    //     isCancel: true,
    //     height: 157,
    //     onTap: () async {
    //       navigatorPop(context);
    //     },
    //   ),
    // );
  }

  onReorder(int oldIndex, int newIndex) {
    //
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: CommonScaffold(
        appBarInfo: AppBarInfoClass(
          title: '${widget.householdInfo.name} 카테고리',
          actions: [
            InkWell(
              onTap: onEdit,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: CommonText(
                  text: isEdit ? '편집 해제' : '편집',
                  fontSize: defaultFontSize + 1,
                  color: isEdit ? red.original : Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ReorderableListView.builder(
            itemCount: 2,
            physics: const ClampingScrollPhysics(),
            onReorder: onReorder,
            itemBuilder: (context, index) {
              return CategoryItem(
                key: Key('$index'),
                isEdit: isEdit,
                householdInfo: widget.householdInfo,
                onCategory: onCategory,
                onSwitch: onSwitch,
                onRemove: onRemove,
              );
            },
          ),
        ),
        floatingActionButton: CategoryActionButton(onAdd: onAdd),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.isEdit,
    required this.householdInfo,
    required this.onCategory,
    required this.onSwitch,
    required this.onRemove,
  });

  bool isEdit;
  HouseholdInfoClass householdInfo;
  Function() onCategory;
  Function(bool) onSwitch;
  Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          isEdit
              ? InkWell(
                  onTap: onRemove,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 15, bottom: 5, top: 5),
                    child: Icon(
                      Icons.remove_circle_outline_rounded,
                      color: red.s300,
                    ),
                  ),
                )
              : const CommonNull(),
          Expanded(
            child: CommonContainer(
              onTap: onCategory,
              child: Row(
                children: [
                  CommonText(text: '야미'),
                  const Spacer(),
                  CommonSwitch(
                    activeColor: householdInfo.color.s300,
                    value: true,
                    onChanged: onSwitch,
                  ),
                ],
              ),
            ),
          ),
          isEdit
              ? const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(
                    Icons.reorder_rounded,
                    color: Colors.grey,
                  ),
                )
              : const CommonNull(),
        ],
      ),
    );
  }
}
