import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:household_account_book_app/common/CommonImageButton.dart';
import 'package:household_account_book_app/common/CommonNull.dart';
import 'package:household_account_book_app/common/CommonSpace.dart';
import 'package:household_account_book_app/common/CommonSvgText.dart';
import 'package:household_account_book_app/common/CommonText.dart';
import 'package:household_account_book_app/page/ProfilePage.dart';
import 'package:household_account_book_app/provider/PremiumProvider.dart';
import 'package:household_account_book_app/provider/ReloadProvider.dart';
import 'package:household_account_book_app/provider/ThemeProvider.dart';
import 'package:household_account_book_app/util/class.dart';
import 'package:household_account_book_app/util/constants.dart';
import 'package:household_account_book_app/util/enum.dart';
import 'package:household_account_book_app/util/final.dart';
import 'package:household_account_book_app/util/func.dart';
import 'package:household_account_book_app/widget/appBar/SettingAppBar.dart';
import 'package:household_account_book_app/widget/bottomSheet/LanguageModalSheet.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  String appVerstion = '';
  String appBuildNumber = '';

  @override
  void initState() {
    getInfo() async {
      Map<String, dynamic> appInfo = await getAppInfo();

      appVerstion = appInfo['appVerstion'];
      appBuildNumber = appInfo['appBuildNumber'];

      setState(() {});
    }

    getInfo();
    super.initState();
  }

  onPremium() {
    // movePage(context: context, page: const PremiumPage());
  }

  onPrivate() async {
    Uri url = Uri(
      scheme: 'https',
      host: '',
      path: '',
      queryParameters: {'pvs': '4'},
    );

    await canLaunchUrl(url) ? await launchUrl(url) : throw 'launchUrl error';
  }

  onLanguage() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageModalSheet(),
    );

    setState(() {});
  }

  onReview() async {
    InAppReview inAppReview = InAppReview.instance;
    String? appleId = dotenv.env['APPLE_ID'];
    String? androidId = dotenv.env['ANDROID_ID'];

    await inAppReview.openStoreListing(
      appStoreId: appleId,
      microsoftStoreId: androidId,
    );
  }

  onShare() {
    Platform.isIOS
        ? Share.share(APP_STORE_LINK, subject: '투두 플래너')
        : Share.share(PLAY_STORE_LINK, subject: '투두 플래너');
  }

  onUser() {
    movePage(context: context, page: const ProfilePage());
  }

  onVersion() async {
    Uri url = Uri(
      scheme: 'https',
      host: 'apps.apple.com',
      path: 'app/',
    );

    await canLaunchUrl(url) ? await launchUrl(url) : print('err');
  }

  @override
  Widget build(BuildContext context) {
    context.watch<ReloadProvider>().isReload;

    String locale = context.locale.toString();
    bool isLight = context.read<ThemeProvider>().isLight;
    bool isPremium = context.watch<PremiumProvider>().isPremium;

    onValue(String text, bool? isNotTr) {
      return CommonSvgText(
        text: text,
        fontSize: defaultFontSize,
        textColor: isLight ? textColor : Colors.white,
        svgColor: isLight ? textColor : Colors.white,
        svgName: 'dir-right',
        svgWidth: 6,
        svgLeft: 6,
        isNotTr: isNotTr,
        svgDirection: SvgDirectionEnum.right,
      );
    }

    List<SettingItemClass> settingItemList = [
      SettingItemClass(
        name: '프리미엄',
        svg: 'crown',
        onTap: onPremium,
        value: isPremium
            ? onValue('구매 완료', null)
            : CommonImageButton(
                path: 'remove-ads',
                text: '광고 제거',
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                onTap: onPremium,
              ),
      ),
      SettingItemClass(
        name: '프로필',
        svg: 'user',
        value: onValue('${authButtonInfo['kakao']!['name']}', null),
        onTap: onUser,
      ),
      SettingItemClass(
        name: '언어',
        svg: 'language',
        value: onValue(getLocaleName(locale), true),
        onTap: onLanguage,
      ),
      SettingItemClass(
        name: '개인정보처리방침',
        svg: 'private',
        onTap: onPrivate,
      ),
      SettingItemClass(
        name: '앱 버전',
        svg: 'version',
        onTap: onVersion,
        value: CommonText(
          text: '$appVerstion ($appBuildNumber)',
          color: isLight ? grey.original : darkTextColor,
          isBold: !isLight,
          isNotTr: true,
        ),
      ),
    ];

    return Column(
      children: [
        const SettingAppBar(),
        SingleChildScrollView(
          child: Column(
            children: settingItemList
                .map(
                  (item) => InkWell(
                    onTap: item.onTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.5),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: isLight ? Colors.white : darkSvgBgColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            padding: const EdgeInsets.all(6),
                            child: svgAsset(name: item.svg, width: 17),
                          ),
                          CommonSpace(width: 15),
                          CommonText(
                            text: item.name,
                            isBold: true,
                            fontSize: defaultFontSize + 1,
                            color: isLight ? textColor : darkTextColor,
                          ),
                          const Spacer(),
                          item.value != null ? item.value! : const CommonNull()
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
