import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 로그인 상태 관리
class AuthStateNotifier extends StateNotifier<bool> {
  AuthStateNotifier() : super(false);

  void logIn() {
    state = true;
  }

  void logOut() {
    state = false;
  }
}
