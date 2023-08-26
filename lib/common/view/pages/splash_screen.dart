import 'dart:async';

import 'package:beauty_care/common/const/router.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/layout/app_theme.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/splash_mobile_model.dart';
import 'package:beauty_care/common/provider/splash_mobile_provider.dart';
import 'package:beauty_care/common/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 800),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => MaterialApp.router(
                color: Colors.white,
                debugShowCheckedModeBanner: false,
                theme: appTheme,
                routerConfig: router,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    String splashImgUrl = "124";
    Future<PageResponse<SplashMobileModel>?> response =
        ref.watch(splashMobileRepositoryProvider).getSplashMobileByQuery();
    response.then(
        (value) => splashImgUrl = value!.items!.first.imageId.toString() ?? '');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(
            '${Strings.imageUrl}$splashImgUrl',
            fit: BoxFit.cover,
            // 네트워크 Empty 예외처리
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(
                'assets/images/splash_01.png',
                fit: BoxFit.cover,
              );
            },
          )),
    );
  }
}
