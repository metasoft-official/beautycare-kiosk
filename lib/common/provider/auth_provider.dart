import 'package:beauty_care/common/provider/secure_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:beauty_care/user/view/pages/login_page.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, bool>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return AuthStateNotifier(
    storage,
  );
});

// 로그인 상태 관리
class AuthStateNotifier extends StateNotifier<bool> {
  AuthStateNotifier(this.storage) : super(false);

  final FlutterSecureStorage storage;

  void logIn() async {
    state = true;

    // Secure Storage에 토큰 저장
    // await storage.write(key: 'auth_token', value: token);
  }

  void logOut() {
    state = false;
    storage.delete(key: 'auth_token');
  }

  // 자동 로그인 시도
  Future<void> tryAutoLogin() async {
    final token = await storage.read(key: 'auth_token');
    state = token != null;
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
                    return routeName;
                  })));
    }
  }
}
