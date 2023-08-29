import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:flutter/material.dart';

class KioskQrWidget extends StatelessWidget {
  const KioskQrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(72, 30, 72, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  '내 피부 관리법에 대해 살펴보고,\n시술과 화장품을 추천받고 싶다면?',
                  style: KioskTextTheme.black28m,
                ),
                Spacer(),
                Text(
                  'QR코드를 촬영해 App 다운로드하기',
                  style: KioskTextTheme.blue36b,
                ),
                SizedBox(height: 20)
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3,
                        spreadRadius: 2,
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              padding: const EdgeInsets.all(20),
              height: 200,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/sample_images_01.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
