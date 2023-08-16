import 'package:beauty_care/cosmetic/provider/skin_product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';

class SkinCategoryState extends ChangeNotifier {
  final Ref ref;

  SkinCategoryState(this.ref);

  // horizontal Category
  int productTypeCurIndex = 0; //cosmetic
  int productLineCurIndex = 0; //cosmetic

  // order
  int selectedTypeValue = 0;
  int selectedLineValue = 0;
}
