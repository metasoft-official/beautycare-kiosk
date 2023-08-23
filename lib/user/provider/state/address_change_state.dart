import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class AddressChangeState extends ChangeNotifier {
  late Ref ref;
  TextEditingController postcordTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController detailAddressTextController = TextEditingController();

  FocusNode detailAddressFocus = FocusNode();

  // 주소 검색
  searchPost(BuildContext context) async {
    KopoModel? model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );

    if (model != null) {
      postcordTextController.clear();
      addressTextController.clear();
      detailAddressTextController.clear();

      postcordTextController.text = model.zonecode.toString();
      addressTextController.text =
          model.buildingName != null && model.buildingName != ""
              ? '${model.address.toString()} (${model.buildingName.toString()})'
              : model.address.toString();
    }

    notifyListeners();
  }
}
