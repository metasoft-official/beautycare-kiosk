import 'package:beauty_care/clinic/model/clinic_model.dart';
import 'package:beauty_care/clinic/provider/state/clinic_wishlist_state.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/wishlist_api.dart';
import 'package:beauty_care/common/model/wishlist_clinic_model.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/common/repository/wishlist_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../main.dart';

final wishlistApiProvider = Provider<WishlistApi>((ref) {
  final dio = ref.read(dioProvider);
  return WishlistApi(dio);
});

final wishlistRepositoryProvider = Provider<WishlistRepository>((ref) {
  final wishlistApi = ref.read(wishlistApiProvider);
  return WishlistRepository(wishlistApi);
});

final clinicWishlistChangeProvider =
    ChangeNotifierProvider((ref) => ClinicWishlistState(ref));
