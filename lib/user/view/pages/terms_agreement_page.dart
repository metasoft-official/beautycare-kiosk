import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';

import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/mark_texts_widget.dart';

class TermsAgreementPage extends ConsumerWidget {
  const TermsAgreementPage({Key? key}) : super(key: key);

  static String get routeName => 'termsAgreement';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(24, 34, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/images/oxygen_logo.png',
                height: 40,
                alignment: Alignment.centerLeft,
              ),
            ),
            const SizedBox(height: 23),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: MarkTextsWidget(
                text: '필수 약관 동의 후\n회원가입이 가능합니다.',
                markText: '필수 약관 동의',
                markTextStyle: AppTextTheme.blue24b,
                defaultTextStyle: AppTextTheme.middleGrey24b,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: AppButtonTheme.greyElevatedButtonTheme,
                onPressed: () {},
                icon: const Icon(Icons.check),
                label: const Text('전체 동의'),
              ),
            ),
            const SizedBox(height: 37),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.check,
                        color: AppColor.middleGrey,
                        size: 15,
                      ),
                      SizedBox(width: 10),
                      MarkTextsWidget(
                          text: '이용 약관 (필수)',
                          markText: '(필수)',
                          defaultTextStyle: AppTextTheme.black14m,
                          markTextStyle: AppTextTheme.blue14m),
                    ],
                  ),
                ),
                const Spacer(),
                // TextButton(onPressed: () { }, child:
                Text(
                  '자세히 보기',
                  style: AppTextTheme.grey12
                      .copyWith(decoration: TextDecoration.underline),
                )
                // )
              ],
            ),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(color: AppColor.semiGrey)),
                child: const Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    '제1조(목적) 이 약관은 ㈜코이즈 회사(전자상거래 사업자)가 운영하는 OO 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」제2조(정의)')),
            const SizedBox(height: 20),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.check,
                        color: AppColor.middleGrey,
                        size: 15,
                      ),
                      SizedBox(width: 10),
                      MarkTextsWidget(
                          text: '개인정보 수집 및 이용 동의 (필수)',
                          markText: '(필수)',
                          defaultTextStyle: AppTextTheme.black14m,
                          markTextStyle: AppTextTheme.blue14m),
                    ],
                  ),
                ),
                const Spacer(),
                // TextButton(onPressed: () { }, child:
                Text(
                  '자세히 보기',
                  style: AppTextTheme.grey12
                      .copyWith(decoration: TextDecoration.underline),
                )
                // )
              ],
            ),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(color: AppColor.semiGrey)),
                child: const Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    '개인정보보호법에 따라 000에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.')),
          ],
        ),
      )),
      bottomNavigationBar: ButtonBottomNavigationBarWidget(
        buttonColor: AppColor.lightGreyButtonColor,
        textStyle: AppTextTheme.blue14b,
        label: '휴대전화 본인인증',
        onPressed: () {
          context.pushNamed('register');
        },
      ),
    ));
  }
}
