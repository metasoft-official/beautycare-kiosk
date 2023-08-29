import 'dart:async';

import 'package:beauty_care/common/const/router.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_theme.dart';
import 'package:beauty_care/common/provider/splash_mobile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState {
  bool isKioskMode = false;
  String splashImgUrl = '';

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 800),
      () => navigateToApp(),
    );
  }

  void navigateToApp() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            AppWrapper(isKioskMode: isKioskMode, splashImgUrl: splashImgUrl),
      ),
    );
  }

  void checkKioskPermission() {
    Size screenSize = MediaQuery.of(context).size;

    double iPadProScreenWidthThreshold = 1024.0;
    double iPadProScreenHeightThreshold = 1366.0;

    if (screenSize.width >= iPadProScreenWidthThreshold &&
        screenSize.height >= iPadProScreenHeightThreshold) {
      isKioskMode = true;
    } else {
      isKioskMode = false;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadSplashImage();
    checkKioskPermission();
  }

  void loadSplashImage() async {
    final response =
        await ref.read(splashMobileRepositoryProvider).getSplashMobileByQuery();
    splashImgUrl = response?.items?.first.imageId.toString() ?? '';
    setState(
        () {}); // Update the state to trigger a rebuild with the loaded image URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.network(
          '${Strings.imageUrl}$splashImgUrl',
          fit: BoxFit.cover,
          // 네트워크 Empty 예외처리
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset(
              'assets/images/splash_01.png',
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}

class AppWrapper extends StatelessWidget {
  final bool isKioskMode;
  final String splashImgUrl;

  const AppWrapper(
      {super.key, required this.isKioskMode, required this.splashImgUrl});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: isKioskMode ? const Size(1366, 1024) : const Size(800, 600),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          color: AppColor.lightGrey,
        );
      },
    );
  }
}
