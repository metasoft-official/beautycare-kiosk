import 'package:flutter/material.dart';

import 'app_color.dart';

// 추후 뷰티케어 디자인에 맞춰 수정
class AppTextTheme {
  // w300 : Light
  // w400 : Normal / regular / plain
  // w500 : Medium
  // w700 : bold

  // 앱바
  static const appBarTitle = TextStyle(
      fontFamily: 'Kufam',
      fontSize: 15,
      fontWeight: FontWeight.w700,
      height: 1.3,
      letterSpacing: 0.3,
      color: AppColor.appBarTitleColor);
  // 앱바(로고)
  static const appBarLogoTitle = TextStyle(
    fontFamily: 'Kufam',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.3,
    letterSpacing: 0.36,
    color: AppColor.appColor,
  );
  static const app24b = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.4475,
    letterSpacing: 0.36,
    color: AppColor.appColor,
  );
  static const app18b = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.4475,
    letterSpacing: 0.36,
    color: AppColor.appColor,
  );

  static const app13b = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 1.4475,
    letterSpacing: 0.36,
    color: AppColor.appColor,
  );

  // 메인 - 탭바에 사용
  static const tabBarText = TextStyle(
      fontFamily: 'NotoSansKR',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.4475,
      color: AppColor.tabBarColor);
  static const title = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: -2.52,
    color: AppColor.titleColor,
  );
  static const body1 = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.4475,
    color: AppColor.grey,
  );
  static const body2 = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: -0.26,
    color: AppColor.boldGrey,
  );
  static const elevatedButton = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: 0.35,
    color: Colors.white,
  );
  static const textButton = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: 0.06,
    color: AppColor.textButtonColor,
  );
  static const hintText = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4475,
    letterSpacing: -0.21,
    color: AppColor.middleGrey,
  );
  static const textFieldHintText = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.4475,
    letterSpacing: -0.21,
    color: AppColor.hintTextColor,
  );
  static const tableHeader = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    color: AppColor.black,
  );
  static const tableBody = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: -0.49,
    color: Color(0xff3f3f3f),
  );

  static const userRoleText = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: -0.42,
    color: AppColor.userRoleColor,
  );
  static const userNameText = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: -1.08,
    color: AppColor.userNameColor,
  );
  static const header = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.4475,
    letterSpacing: -0.08,
    color: AppColor.boldBlack,
  );
  static const content = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4475,
    letterSpacing: -0.42,
    color: Color(0xff676767),
  );
  static const mediumContent = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: -0.42,
    color: Color(0xff676767),
  );
  static const label = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: -0.64,
    color: Color(0xff5c5c5c),
  );
  static const highlightContent = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: -0.42,
    color: AppColor.appColor,
  );
  static const selectedChipText = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: 0.35,
    color: AppColor.selectedChipColor,
  );
  static const unselectedChipText = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: 0.35,
    color: AppColor.unselectedChipColor,
  );
  static const unselectedToggleButtonText = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4475,
    letterSpacing: 0.35,
    color: AppColor.unselectedToggleColor,
  );
  static const greyElevatedButtonText = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: 0.35,
    color: Color(0xff818181),
  );
  static const attachedFileOutlinedButtonText = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: -0.24,
    color: AppColor.tabBarColor,
  );
  static const basic12 = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4475,
    letterSpacing: 0.06,
    color: AppColor.black,
  );
  static const basic14 = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4475,
    letterSpacing: 0.06,
    color: AppColor.black,
  );
  static const basic20 = TextStyle(
    fontFamily: 'NotoSansKR',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4475,
    letterSpacing: 0.06,
    color: AppColor.black,
  );
  static const userInfoTitle = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColor.titleColor);
  static const userInfoBody = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xff5C5C5C));
  static const userInfoDescribe = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color(0xff5C5C5C));
  static const manageRecipKinDescribe = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xffD7A21E));
  static const consultationDescribe = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: Color(0xff222222));
  static const businessDiaryStepUnselected = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.035,
      color: Color(0xff7C7C7C));
  static const businessDiaryStepSelected = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.035,
      color: Color(0xff169B90));
  static const leftGrey14 = TextStyle(
    fontFamily: 'noto_sans_kr',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.03,
    color: AppColor.leftGrey,
  );
  // Common Style
  // boldBlack
  static const boldBlack16b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.boldBlack);
  static const boldBlack20 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColor.boldBlack);
  // black
  static const black14 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColor.black);
  static const black14m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.black);
  static const black14b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColor.black);
  static const black10 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColor.black);
  static const black10m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColor.black);
  static const black10b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: AppColor.black);
  static const black11 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: AppColor.black);
  static const black11m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: AppColor.black);
  static const black11b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 11,
      fontWeight: FontWeight.w700,
      color: AppColor.black);
  static const black12 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.black);
  static const black12l = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColor.black);
  static const black12m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.black);
  static const black12b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.black);
  static const black16 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColor.black);
  static const black16m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColor.black);
  static const black16b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.black);
  static const black18 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColor.black);
  static const black18m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColor.black);
  static const black18b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColor.black);
  static const black20 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColor.black);
  static const black20m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColor.black);
  static const black20b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColor.black);
  static const black24 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: AppColor.black);
  static const black24m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColor.black);
  static const black24b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColor.black);
  //semiRowGrey
  static const semiRowGrey12 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.semiRowGrey);
  static const semiRowGrey12m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.semiRowGrey);
  static const semiRowGrey12b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.semiRowGrey);
  //deepGrey
  static const deepGrey14 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColor.deepGrey);
  static const deepGrey14m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.deepGrey);
  static const deepGrey14b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColor.deepGrey);
  static const deepGrey16 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColor.deepGrey);
  static const deepGrey16m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColor.deepGrey);
  static const deepGrey16b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.deepGrey);
  //middleGrey
  static const middleGrey8 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 8,
      fontWeight: FontWeight.w400,
      color: AppColor.middleGrey);
  static const middleGrey8m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 8,
      fontWeight: FontWeight.w500,
      color: AppColor.middleGrey);
  static const middleGrey8b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 8,
      fontWeight: FontWeight.w700,
      color: AppColor.middleGrey);
  static const middleGrey10 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColor.middleGrey);
  static const middleGrey10m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColor.middleGrey);
  static const middleGrey10b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: AppColor.middleGrey);
  static const middleGrey12 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.middleGrey);
  static const middleGrey12m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.middleGrey);
  static const middleGrey12b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.middleGrey);
  static const middleGrey16 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColor.middleGrey);
  static const middleGrey16m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColor.middleGrey);
  static const middleGrey16b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.middleGrey);
  static const middleGrey24 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: AppColor.middleGrey);
  static const middleGrey24m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColor.middleGrey);
  static const middleGrey24b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColor.middleGrey);
  static const middleGrey14m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.middleGrey);
  static const allBlack14m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.allBlack);
  // white
  static const white10 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static const white10m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: Colors.white);
  static const white10b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: Colors.white);
  static const white12 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static const white12m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.white);
  static const white12b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Colors.white);
  static const white14 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static const white14m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white);
  static const white14b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.white);
  static const white16 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static const white16m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white);
  static const white16b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white);
  static const white20 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static const white20m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white);
  static const white20b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.white);
  static const white24 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static const white24m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.white);
  static const white24b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.white);
  // grey
  static const grey10 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColor.grey);
  static const grey10m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColor.grey);
  static const grey10b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: AppColor.grey);
  static const grey12 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.grey);
  static const grey12m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.grey);
  static const grey12b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.grey);
  static const grey14 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColor.grey);
  static const grey14m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.grey);
  static const grey14b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColor.grey);
  static const grey15 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColor.grey);
  static const grey15m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColor.grey);
  static const grey15b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: AppColor.grey);
  static const grey20 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColor.grey);
  static const grey20m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColor.grey);
  static const grey20b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColor.grey);
  // semiGrey
  static const semiGrey12 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.semiGrey);
  static const semiGrey12m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.semiGrey);
  static const semiGrey12b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.semiGrey);
  static const semiGrey14 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColor.semiGrey);
  static const semiGrey14m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.semiGrey);
  static const semiGrey14b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColor.semiGrey);
  //deepGrey
  static const deepGrey12 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.deepGrey);
  static const deepGrey12m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.deepGrey);
  static const deepGrey12b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.semiGrey);
  static const deepGrey20 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.035,
      color: AppColor.deepGrey);
  //leftLowGrey
  static const leftLowGrey16 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.035,
      color: AppColor.leftLowGrey);
  // orange
  static const orange12m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.orange);
  static const orange14m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.orange);
  // lightBlue
  static const lightBlue14 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColor.lightBlue);
  // semiBlue
  static const semiBlue10l = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w300,
      color: AppColor.semiBlue);
  static const semiBlue12l = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w300,
      color: AppColor.semiBlue);
  // purple

  static const purple12 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColor.purple);
  static const purple12m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.purple);
  static const purple12b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.purple);
  // blue
  static const blue10 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: AppColor.appColor);
  static const blue10m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColor.appColor);
  static const blue10b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: AppColor.appColor);
  static const blue12 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColor.appColor);
  static const blue12m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.appColor);
  static const blue12b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.appColor);
  static const blue13 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 13,
      fontWeight: FontWeight.w300,
      color: AppColor.appColor);
  static const blue13m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColor.appColor);
  static const blue13b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: AppColor.appColor);
  static const blue14 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColor.appColor);
  static const blue14m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.appColor);
  static const blue14b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColor.appColor);
  static const blue16 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: AppColor.appColor);
  static const blue16m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColor.appColor);
  static const blue16b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.appColor);
  static const blue18 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: AppColor.appColor);
  static const blue18m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColor.appColor);
  static const blue18b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColor.appColor);
  static const blue20 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: AppColor.appColor);
  static const blue20m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColor.appColor);
  static const blue20b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColor.appColor);
  static const blue24 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: AppColor.appColor);
  static const blue24m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColor.appColor);
  static const blue24b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColor.appColor);
  static const blue36 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 36,
      fontWeight: FontWeight.w300,
      color: AppColor.appColor);
  static const blue36m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 36,
      fontWeight: FontWeight.w500,
      color: AppColor.appColor);
  static const blue36b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 36,
      fontWeight: FontWeight.w900,
      color: AppColor.appColor);
  static const blueBlack12l = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.035,
      color: AppColor.blueBlack);
  static const blueBlack12m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.035,
      color: AppColor.blueBlack);
  static const boldBlack26 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 26,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.035,
      color: AppColor.boldBlack);
  // deepPrimary
  static const deepPrimary12b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.deepPrimary);
  // yellow
  static const yellow20 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: AppColor.yellow);
  static const yellow20m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColor.yellow);
  static const yellow20b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColor.yellow);
  static const yellow24 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: AppColor.yellow);
  static const yellow24m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColor.yellow);
  static const yellow24b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColor.yellow);

  // #888888
  static const color88888824b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xff888888));

  static const color88888810b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: Color(0xff888888));

  // home active font
  static const homeActive10b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: AppColor.appColor);

  // #BBBBBB
  static const colorBBBBBB12 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color(0xffBBBBBB));

  // #BBBBBB
  static const colorDDDDDD12 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color(0xffDDDDDD));

  static const red10 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColor.red);
  static const red10m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColor.red);
  static const red10b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: AppColor.red);
  static const red12 = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.red);
  static const red12m = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.red);
  static const red12b = TextStyle(
      fontFamily: 'noto_sans_kr',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.red);
}
