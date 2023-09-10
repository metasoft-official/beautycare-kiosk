import 'package:beauty_care/common/dio/wishlist_api.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/wishlist_clinic_model.dart';
import 'package:beauty_care/main.dart';

class WishlistRepository {
  final WishlistApi wishlistApi;

  WishlistRepository(this.wishlistApi);

  Future<WishlistClinicModel?> getWishlistClinic(
      int userId, int clinicId) async {
    try {
      final response = await wishlistApi.getWishlistClinic(userId, clinicId);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  Future<PageResponse<WishlistClinicModel>?> getWishlistClinicByUserId(
      int userId, int clinicId) async {
    final Map<String, dynamic> query = {'userId': userId};
    try {
      final response = await wishlistApi.getWishlistClinicByUserId(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
