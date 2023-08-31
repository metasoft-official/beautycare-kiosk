import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/wishlist_api.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wishlistApiProvider = Provider<WishlistApi>((ref) {
  final dio = ref.read(dioProvider);
  return WishlistApi(dio);
});

final wishlistChangeProvider =
    ChangeNotifierProvider((ref) => WishlistChangeState());

class WishlistChangeState extends ChangeNotifier {
  late Ref ref;

  Future<String> clickWish(
      {required BuildContext context, int? clinicId, int? productId}) async {
    // 현재 사용자 ID 가져오기
    final userId = ref.watch(userNotifierProvider).id;
    final api = ref.read(wishlistApiProvider);

    // 위시리스트 API 호출
    final response = clinicId != null
        ? await api.getWishlistClinic(
            userId.toString(),
            clinicId.toString(),
          )
        : await api.getWishlistSkincareProduct(
            userId.toString(), productId.toString());

    // 위시리스트에 클리닉이 있는 경우
    if (response.items != null && response.items!.isNotEmpty) {
      // 위시리스트에 클리닉을 삭제합니다.
      clinicId != null
          ? await api.removeWishlistClinicByUserId({
              'userId': userId.toString(),
              'clinicId': clinicId.toString(),
            })
          : await api.removeWishlistSkincareProductByUserId({
              'userId': userId.toString(),
              'skincareProductId': productId.toString(),
            });

      // 이미지를 회색으로 변경합니다.
      return 'grey';
    } else {
      // 위시리스트에 클리닉을 추가합니다.
      clinicId != null
          ? await api.createWishlistClinic(
              {
                'userId': userId,
                'clinicId': clinicId,
              },
            )
          : await api.createWishlistSkincareProduct(
              {
                'userId': userId,
                'skincareProductId': productId,
              },
            );

      // 이미지를 빨간색으로 변경합니다.
      return 'red';
    }
  }

  reload() {
    notifyListeners();
  }
}
