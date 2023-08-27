import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:beauty_care/common/layout/kiosk_button_theme.dart';

class SelectDevicePage extends StatelessWidget {
  const SelectDevicePage({super.key});
  static String get routeName => 'selectHome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: KioskButtonTheme.basicElevatedButtonTheme,
                onPressed: () => context.goNamed('home'),
                child: const Text(
                  '모바일 모드',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: KioskButtonTheme.basicElevatedButtonTheme,
                onPressed: () => context.goNamed('kioskMain'),
                child: const Text('키오스크 모드'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
