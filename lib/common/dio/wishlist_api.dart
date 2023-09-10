import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/wishlist_clinic_model.dart';
import 'package:beauty_care/common/model/wishlist_skincare_product_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'wishlist_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class WishlistApi {
  factory WishlistApi(Dio dio, {String baseUrl}) = _WishlistApi;

  @GET('/common/wishlist-skincare-products/{userId}/{skincareProductId}')
  Future<WishlistSkincareProductModel?> getWishlistSkincareProduct(
      @Path("userId") String userId,
      @Path("skincareProductId") String clinicId);

  @POST('/common/wishlist-skincare-products')
  Future<int?> createWishlistSkincareProduct(
      @Body() Map<String, dynamic> query);

  @DELETE('/common/wishlist-skincare-products')
  Future<int?> removeWishlistSkincareProductByUserId(
      @Body() Map<String, dynamic> query);

  @GET('/common/wishlist-clinics/{userId},{clinicId}')
  Future<WishlistClinicModel?> getWishlistClinic(
      @Path("userId") int userId, @Path("clinicId") int clinicId);

  @GET('/common/wishlist-clinics')
  Future<PageResponse<WishlistClinicModel>?> getWishlistClinicByUserId(
      @Body() Map<String, dynamic> query);

  @POST('/common/wishlist-clinics')
  Future<int?> createWishlistClinic(@Body() Map<String, dynamic> query);

  @DELETE('/common/wishlist-clinics')
  Future<int?> removeWishlistClinicByUserId(@Body() Map<String, dynamic> query);
}
