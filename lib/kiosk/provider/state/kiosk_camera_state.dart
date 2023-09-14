import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KioskCameraState extends ChangeNotifier {
  int cameraId = -1;

  setCameraId(id) {
    cameraId = id;
    notifyListeners();
  }
}
