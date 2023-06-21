import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final productStateProvider = ChangeNotifierProvider<ProductState>((ref) {
  return ProductState();
});

class ProductState extends ChangeNotifier {
  Future<void> openWeb(String productUrl) async {
    Uri url = Uri.parse(productUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
