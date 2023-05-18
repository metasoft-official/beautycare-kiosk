import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../provider/login_provider.dart';
import '../layout/app_button_theme.dart';

const myInputDecoration = InputDecoration(
  border: OutlineInputBorder(),
  filled: true,
  fillColor: Colors.white,
);

final myTextStyle = TextStyle(color: Colors.blue, fontSize: 20);

class PredictSkinDiseasePage extends ConsumerStatefulWidget {
  static String get routeName => 'predictSkinDisease';

  @override
  _PredictSkinDiseasePageState createState() => _PredictSkinDiseasePageState();
}

class _PredictSkinDiseasePageState
    extends ConsumerState<PredictSkinDiseasePage> {
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
        title: const Text('나의 피부 질환 진단하기'),
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
