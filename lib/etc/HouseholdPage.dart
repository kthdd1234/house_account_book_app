// import 'package:flutter/material.dart';
// import 'package:household_account_book_app/common/CommonBackground.dart';
// import 'package:household_account_book_app/common/CommonButton.dart';
// import 'package:household_account_book_app/common/CommonContainer.dart';
// import 'package:household_account_book_app/common/CommonScaffold.dart';
// import 'package:household_account_book_app/common/CommonSpace.dart';
// import 'package:household_account_book_app/util/class.dart';
// import 'package:household_account_book_app/util/constants.dart';
// import 'package:household_account_book_app/util/final.dart';
// import 'package:household_account_book_app/widget/household/householdItem.dart';

// class HouseholdPage extends StatefulWidget {
//   const HouseholdPage({super.key});

//   @override
//   State<HouseholdPage> createState() => _HouseholdPageState();
// }

// class _HouseholdPageState extends State<HouseholdPage> {
//   FocusNode amountFocusNode = FocusNode();
//   FocusNode routeFocusNode = FocusNode();
//   FocusNode typeFocusNode = FocusNode();
//   FocusNode memoFocusNode = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return CommonBackground(
//       child: CommonScaffold(
//         appBarInfo: AppBarInfoClass(title: '지출', color: red.s400),
//         body: Padding(
//           padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
//           child: Column(
//             children: [
//               CommonContainer(
//                 child: Column(
//                   children: [
//                     HouseholdItem(title: '금액'),
//                     HouseholdItem(title: '경로'),
//                     HouseholdItem(title: '유형'),
//                     HouseholdItem(title: '메모'),
//                   ],
//                 ),
//               ),
//               Spacer(),
//               Row(
//                 children: [
//                   Expanded(
//                     child: CommonButton(
//                       text: '이전',
//                       textColor: textColor,
//                       buttonColor: Colors.white,
//                       verticalPadding: 15,
//                       borderRadius: 5,
//                       onTap: () {},
//                     ),
//                   ),
//                   CommonSpace(width: 10),
//                   Expanded(
//                     child: CommonButton(
//                       text: '다음',
//                       textColor: Colors.white,
//                       buttonColor: textColor,
//                       verticalPadding: 15,
//                       borderRadius: 5,
//                       onTap: () {},
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// // 금액
// // 경로
// // 유형
// // 메모

// // 다음
// // 이전 / 다음
// // 이전 / 다음
// // 완료