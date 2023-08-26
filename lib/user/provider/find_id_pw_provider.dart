import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final findChangeProvider = ChangeNotifierProvider<FindChangeState>((ref) {
  return FindChangeState();
});

class FindChangeState extends ChangeNotifier {
  void resetState() {
    FindChangeState();
    notifyListeners();
  }
}
