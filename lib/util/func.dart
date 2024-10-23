// ignore_for_file: unused_local_variable, prefer_const_declarations

import 'dart:developer';
import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/util/class.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:household_account_book_app/util/enum.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

SvgPicture svgAsset({
  required String name,
  required double width,
  Color? color,
}) {
  return SvgPicture.asset(
    'assets/svgs/$name.svg',
    width: width,
    colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );
}

String ymdFormatter({required String locale, required DateTime dateTime}) {
  return DateFormat.yMd(locale).format(dateTime);
}

String ymdFullFormatter({required String locale, required DateTime dateTime}) {
  return DateFormat.yMMMMd(locale).format(dateTime);
}

String mdeFormatter({required String locale, required DateTime dateTime}) {
  return DateFormat.MMMEd(locale).format(dateTime);
}

String mdFormatter({required String locale, required DateTime dateTime}) {
  return DateFormat.MMMd(locale).format(dateTime);
}

String ymdeFormatter({required String locale, required DateTime dateTime}) {
  return DateFormat.yMMMEd(locale).format(dateTime);
}

String ymdeShortFormatter(
    {required String locale, required DateTime dateTime}) {
  return DateFormat.yMEd(locale).format(dateTime);
}

String yMFormatter({required String locale, required DateTime dateTime}) {
  return DateFormat.yMMM(locale).format(dateTime);
}

String yFormatter({required String locale, required DateTime dateTime}) {
  return DateFormat.y(locale).format(dateTime);
}

String dFormatter({required String locale, required DateTime dateTime}) {
  return DateFormat.d(locale).format(dateTime);
}

String eFormatter({required String locale, required DateTime dateTime}) {
  return DateFormat.E(locale).format(dateTime);
}

String eeeeFormatter({required String locale, required DateTime dateTime}) {
  return DateFormat.EEEE(locale).format(dateTime);
}

String hmFormatter({required String locale, required DateTime dateTime}) {
  return DateFormat.jm(locale).format(dateTime);
}

ColorClass getColorClass(String? name) {
  if (name == null) {
    return indigo;
  }

  return colorList.firstWhere((info) => info.colorName == name);
}

void navigatorPop(context) {
  Navigator.of(context, rootNavigator: true).pop('dialog');
}

int ymdToInt(DateTime? dateTime) {
  if (dateTime == null) {
    return 0;
  }

  DateFormat formatter = DateFormat('yyyyMMdd');
  String strDateTime = formatter.format(dateTime);

  return int.parse(strDateTime);
}

int dateTimeKey(DateTime? dateTime) {
  if (dateTime == null) {
    return 0;
  }

  DateFormat formatter = DateFormat('yyyyMMdd');
  String strDateTime = formatter.format(dateTime);

  return int.parse(strDateTime);
}

String uuid() {
  return DateTime.now().microsecondsSinceEpoch.toString();
}

Future<Map<String, dynamic>> getAppInfo() async {
  PackageInfo info = await PackageInfo.fromPlatform();

  return {
    "appVerstion": info.version,
    'appBuildNumber': info.buildNumber,
  };
}

movePage({required BuildContext context, required Widget page}) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(builder: (BuildContext context) => page),
  );
}

// ad: banner, native, appOpening
String getAdId(String ad) {
  final platform = Platform.isIOS ? 'ios' : 'android';
  final env = kDebugMode ? 'debug' : 'real';
  final adId = {
    'android': {
      'banner': {
        'debug': androidBannerTestId,
        'real': androidBannerRealId,
      },
      'native': {
        'debug': androidNativeTestId,
        'real': androidNativeRealId,
      },
      'appOpening': {
        'debug': androidAppOpeningTestId,
        'real': androidAppOpeningRealId,
      }
    },
    'ios': {
      'banner': {
        'debug': iOSBannerTestId,
        'real': iOSBannerRealId,
      },
      'native': {
        'debug': iOSNativeTestId,
        'real': iOSNativeRealId,
      },
      'appOpening': {
        'debug': iOSAppOpeningTestId,
        'real': iOSAppOpeningRealId,
      }
    },
  };

  return adId[platform]![ad]![env]!;
}

Future<bool> setPurchasePremium(Package package) async {
  try {
    CustomerInfo customerInfo = await Purchases.purchasePackage(package);
    return customerInfo.entitlements.all[entitlementIdentifier]?.isActive ==
        true;
  } on PlatformException catch (e) {
    log('e =>> ${e.toString()}');
    return false;
  }
}

Future<bool> isPurchasePremium() async {
  try {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    bool isActive =
        customerInfo.entitlements.all[entitlementIdentifier]?.isActive == true;
    return isActive;
    // return true;
  } on PlatformException catch (e) {
    log('e =>> ${e.toString()}');
    return false;
  }
}

Future<bool> isPurchaseRestore() async {
  try {
    CustomerInfo customerInfo = await Purchases.restorePurchases();
    bool isActive =
        customerInfo.entitlements.all[entitlementIdentifier]?.isActive == true;
    return isActive;
  } on PlatformException catch (e) {
    log('e =>> ${e.toString()}');
    return false;
  }
}

// //
// bool isSearchCategory(String? id) {
//   if (id == null) return false;

//   UserBox? user = userRepository.user;
//   List<String> filterList = user.filterIdList ?? [];

//   return filterList.contains(id) == true;
// }

DateTime weeklyStartDateTime(DateTime dateTime) {
  if (dateTime.weekday == 7) {
    return dateTime;
  }

  return dateTime.subtract(Duration(days: dateTime.weekday));
}

DateTime weeklyEndDateTime(DateTime dateTime) {
  if (dateTime.weekday == 7) {
    return dateTime.add(const Duration(days: 6));
  }

  return dateTime.add(Duration(
    days: DateTime.daysPerWeek - dateTime.weekday - 1,
  ));
}

calendarHeaderStyle(bool isLight) {
  return HeaderStyle(
    titleCentered: true,
    titleTextStyle: TextStyle(
      color: isLight ? Colors.black : Colors.white,
      fontWeight: isLight ? null : FontWeight.bold,
    ),
    formatButtonVisible: false,
    leftChevronIcon: Icon(
      Icons.chevron_left,
      color: isLight ? buttonColor : Colors.white,
    ),
    rightChevronIcon: Icon(
      Icons.chevron_right,
      color: isLight ? buttonColor : Colors.white,
    ),
  );
}

calendarDaysOfWeekStyle(bool isLight) {
  return DaysOfWeekStyle(
    weekdayStyle: TextStyle(
      fontSize: 13,
      color: isLight ? Colors.black : darkTextColor,
      fontWeight: isLight ? null : FontWeight.bold,
    ),
    weekendStyle: TextStyle(
      fontSize: 13,
      color: red.s300,
      fontWeight: isLight ? null : FontWeight.bold,
    ),
  );
}

calendarDetailStyle(bool isLight) {
  return CalendarStyle(
    todayDecoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    todayTextStyle: TextStyle(
      color: isLight ? Colors.black : darkTextColor,
      fontWeight: isLight ? null : FontWeight.bold,
    ),
    outsideDaysVisible: false,
  );
}

String getLocaleName(String locale) {
  if (locale == 'ko') {
    return '한국어';
  } else if (locale == 'ja') {
    return '日本語';
  } else {
    return 'English';
  }
}

onSegmentedWidget({
  required String title,
  required SegmentedTypeEnum type,
  required SegmentedTypeEnum selected,
  required bool isLight,
  Map<String, String>? nameArgs,
}) {
  Color color = isLight
      ? selected == type
          ? Colors.black
          : grey.original
      : selected == type
          ? Colors.white
          : grey.original;

  return CommonText(
    text: title,
    nameArgs: nameArgs,
    color: color,
    isBold: !isLight,
  );
}

Map<SegmentedTypeEnum, Widget> householdSegmented(
  SegmentedTypeEnum segmented,
  bool isLight,
) {
  return {
    SegmentedTypeEnum.spend: onSegmentedWidget(
      title: '지출',
      isLight: isLight,
      type: SegmentedTypeEnum.spend,
      selected: segmented,
    ),
    SegmentedTypeEnum.income: onSegmentedWidget(
      title: '수입',
      isLight: isLight,
      type: SegmentedTypeEnum.income,
      selected: segmented,
    ),
  };
}

Map<SegmentedTypeEnum, Widget> dateTimeSegmented(
  SegmentedTypeEnum segmented,
  bool isLight,
) {
  return {
    SegmentedTypeEnum.week: onSegmentedWidget(
      title: '일주일',
      isLight: isLight,
      type: SegmentedTypeEnum.week,
      selected: segmented,
    ),
    SegmentedTypeEnum.twoWeek: onSegmentedWidget(
      title: '2주',
      isLight: isLight,
      type: SegmentedTypeEnum.twoWeek,
      selected: segmented,
    ),
    SegmentedTypeEnum.month: onSegmentedWidget(
      title: '1개월',
      isLight: isLight,
      type: SegmentedTypeEnum.month,
      selected: segmented,
    ),
    SegmentedTypeEnum.threeMonth: onSegmentedWidget(
      title: '3개월',
      isLight: isLight,
      type: SegmentedTypeEnum.threeMonth,
      selected: segmented,
    ),
    SegmentedTypeEnum.sixMonth: onSegmentedWidget(
      title: '6개월',
      isLight: isLight,
      type: SegmentedTypeEnum.sixMonth,
      selected: segmented,
    ),
    SegmentedTypeEnum.oneYear: onSegmentedWidget(
      title: '1년',
      isLight: isLight,
      type: SegmentedTypeEnum.oneYear,
      selected: segmented,
    ),
  };
}

// DateTime timestampToDateTime(Timestamp timestamp) {
//   return DateTime.parse(timestamp.toDate().toString());
// }

// List<DateTime> timestampToDateTimeList(List<dynamic> timestampList) {
//   return timestampList
//       .map((timestamp) => timestampToDateTime(timestamp))
//       .toList();
// }

List<String> dynamicToIdList(List<dynamic> dynamicList) {
  return dynamicList.map((id) => id.toString()).toList();
}

String? textAlignToString(TextAlign? textAlign) {
  Map<TextAlign, String> textAlignToString = {
    TextAlign.left: TextAlign.left.toString(),
    TextAlign.center: TextAlign.center.toString(),
    TextAlign.right: TextAlign.right.toString(),
  };

  return textAlign != null ? textAlignToString[textAlign] : null;
}

TextAlign? stringToTextAlign(String? textAlign) {
  Map<String, TextAlign> stringToTextAlign = {
    TextAlign.left.toString(): TextAlign.left,
    TextAlign.center.toString(): TextAlign.center,
    TextAlign.right.toString(): TextAlign.right,
  };

  return textAlign != null ? stringToTextAlign[textAlign] : null;
}

// Future<String?> getDownloadUrl(String imgUrl) async {
//   try {
//     Reference imgRef = storageRef.child(imgUrl);
//     return await imgRef.getDownloadURL();
//   } catch (e) {
//     log('$e');
//     return null;
//   }
// }

// Future<Uint8List> getCacheData(String url) async {
//   File file = await DefaultCacheManager().getSingleFile(url);
//   return file.readAsBytes();
// }

// String getImagePath(String mid) {
//   String uid = auth.currentUser!.uid;
//   return '$uid/$mid/img.jpg';
// }

navigatorRemoveUntil({
  required BuildContext context,
  required Widget page,
}) async {
  FadePageRoute fadePageRoute = FadePageRoute(page: page);
  Navigator.pushAndRemoveUntil(context, fadePageRoute, (_) => false);
}

themeData(String fontFamily) {
  return ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}

List<BNClass> getBnClassList(bool isLight, int seletedIdx) {
  svg(int idx, String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: svgAsset(
        name: name,
        width: idx == 2 ? 21 : 23,
        color: idx == seletedIdx
            ? null
            : isLight
                ? grey.original
                : grey.original,
      ),
    );
  }

  List<BNClass> bnClassList = [
    BNClass(
      index: 0,
      name: '캘린더',
      icon: svg(
        0,
        seletedIdx == 0
            ? 'bnb-calendar-filled-${isLight ? 'light' : 'dark'}'
            : 'bnb-calendar',
      ),
      svgName: 'bnb-calendar',
    ),
    BNClass(
      index: 1,
      name: '캘린더',
      icon: svg(
        1,
        seletedIdx == 1
            ? 'bnb-graph-filled-${isLight ? 'light' : 'dark'}'
            : 'bnb-graph',
      ),
      svgName: seletedIdx == 1 ? 'bnb-graph-filled-light' : 'bnb-graph',
    ),
    // BNClass(
    //   index: 2,
    //   name: '표',
    //   icon: svg(
    //     2,
    //     seletedIdx == 2
    //         ? 'bnb-tracker-filled-${isLight ? 'light' : 'dark'}'
    //         : 'bnb-tracker',
    //   ),
    //   svgName: 'bnb-tracker',
    // ),
    BNClass(
      index: 2,
      name: '설정',
      icon: svg(
        2,
        seletedIdx == 2
            ? 'bnb-setting-filled-${isLight ? 'light' : 'dark'}'
            : 'bnb-setting',
      ),
      svgName: 'bnb-setting',
    )
  ];

  return bnClassList;
}

List<BottomNavigationBarItem> getBnbiList(bool isLight, int seletedIdx) {
  List<BottomNavigationBarItem> bnbList = getBnClassList(
    isLight,
    seletedIdx,
  )
      .map(
        (bn) => BottomNavigationBarItem(label: bn.name.tr(), icon: bn.icon),
      )
      .toList();

  return bnbList;
}

String getBnName(int appStartIndex) {
  return ['홈', '캘린더', '기록표'][appStartIndex];
}

errorMessage({required String msg}) {
  Fluttertoast.showToast(
    msg: msg.tr(),
    gravity: ToastGravity.TOP,
    backgroundColor: darkButtonColor,
    fontSize: 12,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
    fontAsset: 'assets/font/IM_Hyemin.ttf',
  );
}

jumpDayDateTime({
  required JumpDayTypeEnum type,
  required DateTime dateTime,
  required int days,
}) {
  Duration duration = Duration(days: days);

  return JumpDayTypeEnum.subtract == type
      ? dateTime.subtract(duration)
      : dateTime.add(duration);
}

showSnackBar({
  required BuildContext context,
  required String text,
  required String buttonName,
  Function()? onPressed,
  double? width,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(text, style: const TextStyle(color: Colors.white)).tr(),
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonName,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ).tr(),
          )
        ],
      ),
      width: width,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}
