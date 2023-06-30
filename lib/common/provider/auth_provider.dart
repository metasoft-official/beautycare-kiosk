import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:beauty_care/user/view/pages/login_page.dart';

final secureStorageProvider =
    Provider<FlutterSecureStorage>((ref) => const FlutterSecureStorage());

final authStateProvider = StateNotifierProvider<AuthStateNotifier, bool>(
    (ref) => AuthStateNotifier());

// 로그인 상태 관리
class AuthStateNotifier extends StateNotifier<bool> {
  AuthStateNotifier() : super(false);

  void logIn() {
    state = true;
  }

  void logOut() {
    state = false;
  }

  void navigateToPage(BuildContext context, WidgetRef ref, String routeName) {
    final authState = ref.read(authStateProvider);

    if (authState == true) {
      context.pushNamed(routeName);
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginPage(onLoginSuccess: () {
                    context.pop();
                    context.pushNamed(routeName);
                    // Navigator.pop(context);
                    // Navigator.pushNamed(context, routeName);

                    return routeName;
                  })));
    }
  }
}
