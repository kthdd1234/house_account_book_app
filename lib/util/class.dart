import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:household_account_book_app/util/func.dart';

class AppBarInfoClass {
  AppBarInfoClass({
    required this.title,
    this.isCenter,
    this.actions,
    this.fontSize,
    this.isNotTr,
    this.isBold,
    this.color,
  });

  String title;
  bool? isCenter, isNotTr, isBold;
  List<Widget>? actions;
  double? fontSize;
  Color? color;
}

class BottomNavigationBarClass {
  BottomNavigationBarClass({
    required this.svgAsset,
    required this.index,
    required this.label,
    required this.body,
  });

  String svgAsset, label;
  int index;
  Widget body;
}

class ColorClass {
  ColorClass({
    required this.s50,
    required this.s100,
    required this.s200,
    required this.s300,
    required this.s400,
    required this.original,
    required this.colorName,
  });

  String colorName;
  Color s50, s100, s200, s300, s400, original;
}

class PremiumBenefitClass {
  PremiumBenefitClass({
    required this.svgName,
    required this.mainTitle,
    required this.subTitle,
  });

  String svgName, mainTitle, subTitle;
}

class WidgetHeaderClass {
  final String title, today;
  final List<int> textRGB, bgRGB;

  WidgetHeaderClass(this.title, this.today, this.textRGB, this.bgRGB);

  WidgetHeaderClass.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        today = json['today'] as String,
        textRGB = json['textRGB'] as List<int>,
        bgRGB = json['bgRGB'] as List<int>;

  Map<String, dynamic> toJson() => {
        'title': title,
        'today': today,
        'textRGB': textRGB,
        'bgRGB': bgRGB,
      };
}

class WidgetItemClass {
  final String id, name, mark;
  final List<int> barRGB, lineRGB, markRGB;
  final List<int>? highlightRGB;

  WidgetItemClass(
    this.id,
    this.name,
    this.mark,
    this.barRGB,
    this.lineRGB,
    this.markRGB,
    this.highlightRGB,
  );

  WidgetItemClass.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        mark = json['mark'] as String,
        barRGB = json['barRGB'] as List<int>,
        lineRGB = json['lineRGB'] as List<int>,
        markRGB = json['markRGB'] as List<int>,
        highlightRGB = json['highlightRGB'] as List<int>?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'mark': mark,
        'barRGB': barRGB,
        'lineRGB': lineRGB,
        'markRGB': markRGB,
        'highlightRGB': highlightRGB
      };
}

class BackgroundClass {
  BackgroundClass({
    required this.path,
    required this.name,
  });

  String path, name;
}

class BNClass {
  BNClass({
    required this.index,
    required this.name,
    required this.icon,
    required this.svgName,
  });

  int index;
  String name, svgName;
  Widget icon;
}

class FadePageRoute extends PageRouteBuilder {
  final Widget page;

  FadePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        );
}

class HouseholdContainerClass {
  HouseholdContainerClass({
    required this.type,
    required this.title,
    required this.color,
    required this.symbol,
  });

  String type, title, symbol;
  ColorClass color;
}

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ firestore data modeling ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//

// class UserInfoClass {
//   UserInfoClass({
//     required this.uid,
//     required this.loginType,
//     required this.createDateTime,
//     required this.fontFamily,
//     required this.background,
//     required this.theme,
//     required this.widgetTheme,
//     required this.groupOrderList,
//     required this.appStartIndex,
//     this.passwords,
//     this.email,
//     this.displayName,
//     this.imgUrl,
//   });

//   String uid, loginType, fontFamily, background, theme, widgetTheme;
//   DateTime createDateTime;
//   int appStartIndex;
//   List<String> groupOrderList;
//   String? email, displayName, imgUrl, passwords;

//   UserInfoClass.fromJson(Map<String, dynamic> json)
//       : uid = json['uid'] as String,
//         loginType = json['loginType'] as String,
//         createDateTime = timestampToDateTime(json['createDateTime']),
//         appStartIndex = json['appStartIndex'] as int,
//         fontFamily = json['fontFamily'] as String,
//         background = json['background'] as String,
//         theme = json['theme'] as String,
//         groupOrderList = dynamicToIdList(json['groupOrderList']),
//         widgetTheme = json['widgetTheme'] as String,
//         passwords = json['passwords'] as String?,
//         email = json['email'] as String?,
//         displayName = json['displayName'] as String?,
//         imgUrl = json['imgUrl'] as String?;

//   Map<String, dynamic> toJson() => {
//         'uid': uid,
//         'loginType': loginType,
//         'createDateTime': createDateTime,
//         'appStartIndex': appStartIndex,
//         'fontFamily': fontFamily,
//         'background': background,
//         'theme': theme,
//         'groupOrderList': groupOrderList,
//         'widgetTheme': widgetTheme,
//         'passwords': passwords,
//         'email': email,
//         'displayName': displayName,
//         'imgUrl': imgUrl,
//       };
// }
