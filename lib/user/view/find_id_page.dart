import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../../common/provider/login_provider.dart';
import '../../common/layout/app_button_theme.dart';
import '../../common/layout/app_color.dart';

class FindIdPage extends ConsumerStatefulWidget {
  const FindIdPage({super.key});

  static String get routeName => 'findId';

  @override
  _FindIdPageState createState() => _FindIdPageState();
}

class _FindIdPageState extends ConsumerState<FindIdPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(title: const Text('아이디/비밀번호 찾기')),
          body: Column(
            children: [
              const TabBar(
                  indicatorColor: AppColor.tabBarColor,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  labelColor: AppColor.titleColor,
                  unselectedLabelColor: Colors.blue,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(
                      text: '아이디 찾기',
                      height: 50,
                    ),
                    Tab(
                      text: '비밀번호 찾기',
                      height: 50,
                    ),
                  ]),
              Expanded(
                  child: TabBarView(children: [
                Column(),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 100, 0, 10),
                      child: TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: '아이디 입력',
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: '비밀번호',
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ]))
            ],
          )),
    );
  }
}
