import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_project/common/style/app_button_theme.dart';
import '../style/app_text.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static String get routeName => 'register';

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends ConsumerState<SignUpPage> {
  // final SignUpController signUpController =  Provider<SignUpController>((ref){
  //   return signUpController(ref);
  // }) as SignUpController;

  final idTextController = TextEditingController();
  final pwTextController = TextEditingController();
  final rePwTextController = TextEditingController();
  final nmTextController = TextEditingController();
  final phTextController = TextEditingController();
  final bdayTextController = TextEditingController();
  final emTextController = TextEditingController();
  final domainTextController = TextEditingController();
  final postcordTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final detailAddressTextController = TextEditingController();
  final pwFocus = FocusNode();
  final idFocus = FocusNode();
  final rePwFocus = FocusNode();
  final nmFocus = FocusNode();
  final phFocus = FocusNode();
  final bdayFocus = FocusNode();
  final emFocus = FocusNode();
  final domainFocus = FocusNode();
  final postcordFocus = FocusNode();
  final addressFocus = FocusNode();
  final detailAddressFocus = FocusNode();

  List<String> list = <String>['직접입력', 'naver.com', 'gmail.com'];

  List<bool> isGenderSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    // final value = ref.watch(registerProvider); //프로바이더 구독
    // SignUpController signUpController = ref.read(signUpController);

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
            margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 필수 입력
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child:
                          const Text('필수 입력 정보', style: AppTextTheme.black18b),
                    ),
                    const Text('필수항목이므로 반드시 입력해 주시기 바랍니다.',
                        style: AppTextTheme.black14),

                    // 아이디
                    Container(
                      margin: const EdgeInsets.only(top: 14, bottom: 8),
                      child: const Text('아이디', style: AppTextTheme.black14b),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: TextFormField(
                            readOnly: false,
                            autocorrect: false,
                            controller: idTextController,
                            focusNode: idFocus,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            //   onChanged :(value) => {
                            //     return null;
                            //   },
                            // validator : (value) => {
                            //   return null;
                            // },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: AppButtonTheme.roundedElevatedButtonTheme,
                            child: const Text('중복확인'),
                          ),
                        )
                      ],
                    ),

                    // 비밀번호
                    Container(
                      margin: const EdgeInsets.only(top: 14, bottom: 8),
                      child: const Text('비밀번호', style: AppTextTheme.black14b),
                    ),
                    TextFormField(
                      readOnly: false,
                      autocorrect: false,
                      controller: pwTextController,
                      focusNode: pwFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      //   onChanged :(value) => {
                      //     return null;
                      //   },
                      // validator : (value) => {
                      //   return null;
                      // },
                    ),

                    // 비밀번호 확인
                    Container(
                      margin: const EdgeInsets.only(top: 14, bottom: 8),
                      child:
                          const Text('비밀번호 확인', style: AppTextTheme.black14b),
                    ),
                    TextFormField(
                      readOnly: false,
                      autocorrect: false,
                      controller: rePwTextController,
                      focusNode: rePwFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      //   onChanged :(value) => {
                      //     return null;
                      //   },
                      // validator : (value) => {
                      //   return null;
                      // },
                    ),

                    // 이름
                    Container(
                      margin: const EdgeInsets.only(top: 14, bottom: 8),
                      child: const Text('이름', style: AppTextTheme.black14b),
                    ),
                    TextFormField(
                      readOnly: false,
                      autocorrect: false,
                      controller: nmTextController,
                      focusNode: nmFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      //   onChanged :(value) => {
                      //     return null;
                      //   },
                      // validator : (value) => {
                      //   return null;
                      // },
                    ),

                    // 휴대전화
                    Container(
                      margin: const EdgeInsets.only(top: 14, bottom: 8),
                      child: const Text('휴대전화', style: AppTextTheme.black14b),
                    ),
                    TextFormField(
                      readOnly: false,
                      autocorrect: false,
                      controller: phTextController,
                      focusNode: phFocus,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      //   onChanged :(value) => {
                      //     return null;
                      //   },
                      // validator : (value) => {
                      //   return null;
                      // },
                    ),

                    // 생년월일
                    Container(
                      margin: const EdgeInsets.only(top: 14, bottom: 8),
                      child: const Text('생년월일', style: AppTextTheme.black14b),
                    ),
                    Row(children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: false,
                          autocorrect: false,
                          controller: bdayTextController,
                          focusNode: bdayFocus,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          //   onChanged :(value) => {
                          //     return null;
                          //   },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "생년월일을 입력해주세요.";
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.date_range,
                          size: 30,
                        ),
                      ),
                    ]),

                    // 이메일
                    Container(
                      margin: const EdgeInsets.only(top: 14, bottom: 8),
                      child: const Text('이메일', style: AppTextTheme.black14b),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          readOnly: false,
                          autocorrect: false,
                          controller: emTextController,
                          focusNode: emFocus,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          //   onChanged :(value) => {
                          //     return null;
                          //   },
                          // validator : (value) => {
                          //   return null;
                          // },
                        )),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Text('@')),
                        DropdownButton<String>(
                          style: AppTextTheme.deepGrey16m,
                          elevation: 0,
                          value: dropdownValue,
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      readOnly: false,
                      autocorrect: false,
                      controller: domainTextController,
                      focusNode: domainFocus,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      //   onChanged :(value) => {
                      //     return null;
                      //   },
                      // validator : (value) => {
                      //   return null;
                      // },
                    ),

                    // 성별
                    Container(
                      margin: const EdgeInsets.only(top: 14, bottom: 8),
                      child: const Text('성별', style: AppTextTheme.black14b),
                    ),
                    Row(
                      children: [
                        Expanded(child: LayoutBuilder(
                          builder: (context, constraints) {
                            return ToggleButtons(
                              constraints: BoxConstraints.expand(
                                  width: (constraints.maxWidth - 4) / 2),
                              isSelected: isGenderSelected.toList(),
                              onPressed: (index) =>
                                  {isGenderSelected[index] = true},
                              children: const [
                                Text(
                                  "여성",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "남성",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          },
                        ))
                      ],
                    ),

                    // 주소
                    Container(
                      margin: const EdgeInsets.only(top: 14, bottom: 8),
                      child: const Text('주소', style: AppTextTheme.black14b),
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 6,
                            child: TextFormField(
                              readOnly: false,
                              autocorrect: false,
                              controller: postcordTextController,
                              focusNode: postcordFocus,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                hintText: '우편번호',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 14),
                                //   onChanged :(value) => {
                                //     return null;
                                //   },
                                // validator : (value) => {
                                //   return null;
                                // },
                              ),
                            )),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: AppButtonTheme.roundedElevatedButtonTheme,
                            child: const Text('우편번호'),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      readOnly: false,
                      autocorrect: false,
                      controller: addressTextController,
                      focusNode: addressFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          hintText: '주소 검색',
                          contentPadding: EdgeInsets.symmetric(horizontal: 14)),
                      //   onChanged :(value) => {
                      //     return null;
                      //   },
                      // validator : (value) => {
                      //   return null;
                      // },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      readOnly: false,
                      autocorrect: false,
                      controller: detailAddressTextController,
                      focusNode: detailAddressFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration:
                          const InputDecoration(hintText: '상세 주소를 입력하세요.'),
                      //   onChanged :(value) => {
                      //     return null;
                      //   },
                      // validator : (value) => {
                      //   return null;
                      // },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: AppButtonTheme.outlinedRoundedButtonTheme,
                            child: const Text('취소'),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: AppButtonTheme.roundedElevatedButtonTheme,
                            child: const Text('회원가입'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
