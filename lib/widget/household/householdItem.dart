// import 'package:flutter/material.dart';
// import 'package:household_account_book_app/common/CommonSpace.dart';
// import 'package:household_account_book_app/common/CommonText.dart';
// import 'package:household_account_book_app/util/constants.dart';
// import 'package:household_account_book_app/util/final.dart';
// import 'package:household_account_book_app/widget/bottomSheet/DirectionBottomSheet.dart';

// class HouseholdItem extends StatelessWidget {
//   HouseholdItem({
//     super.key,
//     required this.title,
//   });

//   String title;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: Row(
//         children: [
//           CommonText(text: title),
//           CommonSpace(width: 20),
//           Expanded(
//             child: NumberPad(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NumberPad extends StatelessWidget {
//   const NumberPad({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       autofocus: true,
//       keyboardType: TextInputType.numberWithOptions(decimal: true),
//       cursorColor: red.s200,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.symmetric(vertical: 7),
//         hintText: '금액',
//         hintStyle: TextStyle(color: grey.s400),
//         isDense: true,
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: grey.s400),
//         ),
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: red.s400,
//           ),
//         ),
//       ),
//     );
//   }
// }
