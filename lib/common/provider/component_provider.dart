import 'package:beauty_care/common/component/dialog/error_message.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorNotifier extends StateNotifier<String?> {
  ErrorNotifier() : super(null);

  void showError(String message) {
    state = message;
  }

  void dismissError() {
    state = null;
  }
}

final errorNotifierProvider =
    StateNotifierProvider<ErrorNotifier, String?>((ref) => ErrorNotifier());
