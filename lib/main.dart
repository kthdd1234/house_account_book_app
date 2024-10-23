import 'dart:developer';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:household_account_book_app/page/HomePage.dart';
import 'package:household_account_book_app/page/LoadingPage.dart';
import 'package:household_account_book_app/page/introPage.dart';
import 'package:household_account_book_app/provider/BottomTabIndexProvider.dart';
import 'package:household_account_book_app/provider/PremiumProvider.dart';
import 'package:household_account_book_app/provider/ReloadProvider.dart';
import 'package:household_account_book_app/provider/SelectedDateTimeProvider.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/provider/TitleDateTimeProvider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomTabIndexProvider()),
        ChangeNotifierProvider(create: (context) => SelectedDateTimeProvider()),
        ChangeNotifierProvider(create: (context) => TitleDateTimeProvider()),
        ChangeNotifierProvider(create: (context) => PremiumProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ReloadProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('ko'), Locale('en'), Locale('ja')],
        path: 'assets/translation',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /* start: 로그인 페이지, loading: 로딩 페이지, succeed: 홈 페에지 */
  String loginStatus = 'succeed';

  initializeATT() async {
    try {
      TrackingStatus status =
          await AppTrackingTransparency.trackingAuthorizationStatus;

      if (status == TrackingStatus.notDetermined) {
        await AppTrackingTransparency.requestTrackingAuthorization();
      }
    } on PlatformException {
      log('error');
    }
  }

  initializeUserInfo() {
    // userMethod.userSnapshots.listen(
    //   (event) {
    //     WidgetsBinding.instance.addPostFrameCallback(
    //       (_) {
    //         Map<String, dynamic>? json = event.data();

    //         if (json != null) {
    //           UserInfoClass userInfo = UserInfoClass.fromJson(json);

    //           if (mounted) {
    //             context.read<ThemeProvider>().setThemeValue(userInfo.theme);
    //             context
    //                 .read<UserInfoProvider>()
    //                 .changeUserInfo(newuUserInfo: userInfo);

    //             int seletedIdx =
    //                 Provider.of<BottomTabIndexProvider>(context, listen: false)
    //                     .seletedIdx;

    //             if (seletedIdx != 3) {
    //               context
    //                   .read<BottomTabIndexProvider>()
    //                   .changeSeletedIdx(newIndex: userInfo.appStartIndex);
    //             }
    //           }
    //         }
    //       },
    //     );
    //   },
    // ).onError((err) => log('$err'));
  }

  @override
  void initState() {
    initializeATT();
    initializeUserInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String locale = context.locale.toString();
    context.watch<ReloadProvider>().isReload;

    ThemeData themeData = ThemeData(
      useMaterial3: true,
      fontFamily: 'Omyu',
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    );

    return MaterialApp(
      title: 'Todo Tracker',
      theme: themeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: {
        'loading': const LoadingPage(),
        'start': const IntroPage(),
        'succeed': HomePage(locale: locale),
      }[loginStatus],
    );
  }
}
