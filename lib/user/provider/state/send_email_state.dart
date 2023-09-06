import 'dart:math';

import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';

class SendEmailState extends StateNotifier<String> {
  final Ref ref;

  SendEmailState(this.ref) : super('');
  String code = '';
  UserModel user = UserModel();

  Future<String> sendEmail({required String email}) async {
    toastMessage.topYellowBoxBlueText('이메일 검증 중입니다.');
    final userResponse =
        await ref.read(userRepositoryProvider).getUserByEmail(email);
    if (userResponse != null && userResponse.items != null) {
      if (userResponse.items!.isNotEmpty) {
        user = userResponse.items!.first;
        await createCode();
        if (code != '') {
          final response = await ref
              .read(userRepositoryProvider)
              .sendEmail(email: email, code: code);
          if (response != 0) {
            return "메일이 발송되었습니다.";
          } else {
            return "메일 발송 중 오류가 발생하였습니다.";
          }
        }
      } else {
        return "존재하는 회원이 없습니다.";
      }
    }
    return "검증 중 오류가 발생하였습니다.";
  }

  createCode() {
    Random random = Random();
    for (int i = 0; i < 6; i++) {
      code += random.nextInt(10).toString(); // 0부터 9까지의 랜덤한 숫자를 추가
    }
  }

  Future<int?> matchCode(String value) async {
    if (code != '') {
      if (value != '') {
        return code.contains(value) ? 1 : 0;
      }
      return 0;
    }
    return null;
  }
}
