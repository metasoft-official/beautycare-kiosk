import 'package:beauty_care/clinic/model/clinic_model.dart';
import 'package:beauty_care/common/model/wishlist_clinic_model.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/common/provider/wishlist_change_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClinicWishlistState extends ChangeNotifier {
  Ref ref;
  Map<int, String> clinicColors = {};
  List<WishlistClinicModel> wishlist = [];

  ClinicWishlistState(this.ref);

  Future<void> getColors(clinics) async {
    if (clinicColors.length != clinics.length) {
      for (var e in clinics) {
        clinicColors[e.id] = 'grey';
      }
    }
  }

  Future<void> getWishList() async {
    final userId = ref.read(userNotifierProvider).id;
    final response = await ref
        .read(wishlistApiProvider)
        .getWishlistClinicByUserId({'userId': userId});
    if (response != null && response.items != null) {
      wishlist = response.items!;
    } else {
      wishlist = [];
    }
    notifyListeners();
  }

  // 위시리스트 처음 로드
  Future<void> getInitClinicWishlist(
      List<ClinicModel> clinics, int clinicId) async {
    await getColors(clinics);
    await getWishList();

    for (int i = 0; i < wishlist.length; i++) {
      if (wishlist[i].clinicId == clinicId) {
        clinicColors[clinicId] = 'red';
        break;
      }
    }
    notifyListeners();
  }

  Future<void> removeClinicWishlist(clinicId) async {
    final userId = ref.read(userNotifierProvider).id;
    final api = ref.read(wishlistApiProvider);

    // 위시리스트에 클리닉을 삭제합니다.
    await api.removeWishlistClinicByUserId({
      'userId': userId.toString(),
      'clinicId': clinicId.toString(),
    });

    // 이미지를 회색으로 변경합니다.
    clinicColors[clinicId] = 'grey';
    getWishList();
    notifyListeners();
  }

  Future<void> createClinicWishlist(clinicId) async {
    final userId = ref.read(userNotifierProvider).id;
    final api = ref.read(wishlistApiProvider);
    await api.createWishlistClinic(
      {
        'userId': userId,
        'clinicId': clinicId,
      },
    );

    // 이미지를 빨간색으로 변경합니다.
    clinicColors[clinicId] = 'red';
    getWishList();
  }

  Future<String> getProductWishlist({int? productId}) async {
    // 현재 사용자 ID 가져오기
    final userId = ref.watch(userNotifierProvider).id;
    final api = ref.read(wishlistApiProvider);

    // 위시리스트 API 호출
    final response = await api.getWishlistSkincareProduct(
        userId.toString(), productId.toString());

    // 위시리스트에  있는 경우
    if (response != null && response.skincareProduct != null) {
      // 삭제합니다.
      await api.removeWishlistSkincareProductByUserId({
        'userId': userId.toString(),
        'skincareProductId': productId.toString(),
      });

      // 이미지를 회색으로 변경합니다.
      return 'grey';
    } else {
      await api.createWishlistSkincareProduct(
        {
          'userId': userId,
          'skincareProductId': productId,
        },
      );

      // 이미지를 빨간색으로 변경합니다.
      return 'red';
    }
  }
}
