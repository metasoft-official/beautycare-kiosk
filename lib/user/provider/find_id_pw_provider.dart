import 'package:beauty_care/user/provider/state/send_email_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final findChangeProvider = ChangeNotifierProvider<FindChangeState>((ref) {
  return FindChangeState();
});

final sendEmailProvider =
    AutoDisposeStateNotifierProvider<SendEmailState, String>(
        (ref) => SendEmailState(ref));

class FindChangeState extends ChangeNotifier {
  void resetState() {
    FindChangeState();
    notifyListeners();
  }
}
