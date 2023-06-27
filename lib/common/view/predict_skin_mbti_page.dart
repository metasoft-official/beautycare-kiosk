import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../provider/login_provider.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';

class PredictSkinMbtiPage extends ConsumerStatefulWidget {
  static String get routeName => 'predictSkinMbti';

  @override
  _PredictSkinMbtiPageState createState() => _PredictSkinMbtiPageState();
}

class _PredictSkinMbtiPageState extends ConsumerState<PredictSkinMbtiPage> {
  //flutter_secure_storage 사용을 위한 초기화 작업
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 피부 MBTI 진단하기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
