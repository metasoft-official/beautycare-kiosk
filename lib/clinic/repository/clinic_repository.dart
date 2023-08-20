import 'package:beauty_care/clinic/model/clinic_model.dart';
import 'package:beauty_care/common/dio/clinic_api.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/model/page_response_model.dart';

class ClinicRepository {
  final ClinicApi clinicApi;

  ClinicRepository(this.clinicApi);

  // all
  Future<PageResponse<ClinicModel>?> getClinicAll() async {
    try {
      final response = await clinicApi.getClinicAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // by query
  Future<PageResponse<ClinicModel>?> getClinicByQuery(
      ClinicModel clinicModel) async {
    final Map<String, dynamic> query = {...clinicModel.toJson()};
    try {
      final response = await clinicApi.getClinicByQuery(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
