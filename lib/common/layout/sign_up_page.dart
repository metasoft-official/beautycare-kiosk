import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../style/app_text.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static String get routeName => 'register';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final value = ref.watch(registerProvider); //프로바이더 구독

    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // // 연령 고지
                        // const Text('만 14세 미만은 가입 불가능합니다.'),
                        // const SizedBox(height: 20),
                        // // 공지사항 연결 버튼
                        // Expanded(
                        //     flex: 4,
                        //     child: TextButton(
                        //         onPressed: () async {
                        //           final url = Uri.parse(Strings.noticeUrl);
                        //           if (await canLaunchUrl(url)) {
                        //             await launchUrl(url);
                        //           } else {
                        //             throw 'Could not launch $url';
                        //           }
                        //         } //추후 관련 공지사항 페이지 연결
                        //         ,
                        //         style: const ButtonStyle(
                        //             alignment: Alignment
                        //                 .centerRight), // => Get.ToNamed(Routes.공지사항)
                        //         child: const Text('관련 내용 보기')))

                        // 필수 입력
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text('필수 입력 정보',
                              style: AppTextTheme.black18b),
                        ),
                        const Text('필수항목이므로 반드시 입력해 주시기 바랍니다.',
                            style: AppTextTheme.black14),

                        // 아이디
                        Container(
                          margin: const EdgeInsets.only(top: 14, bottom: 8),
                          child:
                          const Text('아이디', style: AppTextTheme.black18b),
                        ),
                        Row(
                          children: const [
                            // TextFormField(
                            //   readOnly: controller.isIdFormDisabled,
                            //   autocorrect: false,
                            //   controller: controller.idTextController,
                            //   focusNode: controller.idFocus,
                            //   keyboardType: TextInputType.name,
                            //   // textInputAction: TextInputAction.next,
                            //   onChanged: (value) =>
                            //   {controller.isIdChecked = false},
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return "아이디를 입력해주세요.";
                            //     } else if (!controller.idPwFormat
                            //         .hasMatch(value)) {
                            //       return "아이디는 영문+숫자, 6~12자리입니다.";
                            //     }
                            //     return null;
                            //   },
                            // )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
