import 'package:beauty_care/common/dio/click_count_api.dart';

class ClickCountRepository {
  final ClickCountApi clickCountApi;

  ClickCountRepository(this.clickCountApi);

  Future<int> updateClickCount(int itemId, String category) async {
    return await clickCountApi.updateClickCount(itemId, {
      'itemId': itemId,
      'category': category,
    });
  }
}
