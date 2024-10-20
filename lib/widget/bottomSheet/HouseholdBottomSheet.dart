// import 'dart:developer';

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:household_account_book_app/common/CommonButton.dart';
// import 'package:household_account_book_app/common/CommonContainer.dart';
// import 'package:household_account_book_app/common/CommonModalSheet.dart';
// import 'package:household_account_book_app/common/CommonText.dart';
// import 'package:household_account_book_app/provider/ThemeProvider.dart';
// import 'package:household_account_book_app/util/class.dart';
// import 'package:household_account_book_app/util/constants.dart';
// import 'package:household_account_book_app/util/final.dart';
// import 'package:household_account_book_app/util/func.dart';
// import 'package:provider/provider.dart';

// class HouseholdBottomSheet extends StatefulWidget {
//   const HouseholdBottomSheet({super.key});

//   @override
//   State<HouseholdBottomSheet> createState() => _HouseholdBottomSheetState();
// }

// class _HouseholdBottomSheetState extends State<HouseholdBottomSheet> {
//   TextEditingController controller = TextEditingController();
//   String selectedCategory = '';
//   bool isAmount = false;

//   onNext() {
//     // setState(() {
//     //   isAmount = true;
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double bottom = MediaQuery.of(context).viewInsets.bottom;

//     return AnimatedPadding(
//       padding: EdgeInsets.only(bottom: bottom),
//       duration: const Duration(milliseconds: 100),
//       curve: Curves.decelerate,
//       child: CommonModalSheet(
//           title: '지출 카테고리',
//           height: 400,
//           child: AmountContainer(
//             controller: controller,
//             onCompleted: onCompleted,
//           )),
//     );
//   }
// }
