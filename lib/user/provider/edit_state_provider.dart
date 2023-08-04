import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final editStateProvider = ChangeNotifierProvider<EditState>((ref) {
  return EditState();
});

class EditState extends ChangeNotifier {
  TextEditingController nmTextController = TextEditingController();
  FocusNode nmFocus = FocusNode();

  void resetState() {
    EditState();
    notifyListeners();
  }
}
