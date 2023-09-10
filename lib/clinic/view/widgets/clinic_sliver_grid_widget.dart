import 'package:beauty_care/clinic/model/clinic_model.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/wishlist_clinic_model.dart';
import 'package:beauty_care/common/provider/click_count_provider.dart';
import 'package:beauty_care/common/provider/wishlist_change_provider.dart';
import 'package:beauty_care/main.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk_talk/kakao_flutter_sdk_talk.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

// todo 찜 로직 추가
class ClinicSliverGridWidget extends ConsumerWidget {
  const ClinicSliverGridWidget(
      {Key? key,
      required this.clinics,
      this.mainAxisSpacing = 16.0,
      this.crossAxisSpacing = 20.0,
      this.wishlist})
      : super(key: key);

  final List<ClinicModel> clinics; // 상품 리스트

  // 그 외 커스텀 가능한 설정값
  final double mainAxisSpacing; //행 간 거리
  final double crossAxisSpacing; //열 간 거리
  final List<WishlistClinicModel>? wishlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: 1.1,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    height: 112,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border:
                            Border.all(color: AppColor.lightGrey, width: 2)),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        constraints:
                            const BoxConstraints(minWidth: 1, minHeight: 1),
                        child: clinics[index].logoImageId != null
                            ? Image.network(
                                '${Strings.imageUrl}${clinics[index].logoImageId}',
                                fit: BoxFit.cover,
                                // 네트워크 Empty 예외처리
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Image.asset(
                                    'assets/images/sample_images_01.png',
                                    fit: BoxFit.cover,
                                  );
                                },
                              )
                            // 이미지 아이디 Null 예외처리
                            : Image.asset(
                                'assets/images/sample_images_01.png',
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  if (clinics[index].specialtyStoreStatus != null &&
                      clinics[index].specialtyStoreStatus!.contains('T')) ...[
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 15),
                        decoration: const BoxDecoration(
                          color: AppColor.appColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Text(
                          '공식 전문점',
                          style: AppTextTheme.white10b.copyWith(height: 1.2),
                        ),
                      ),
                    ),
                  ],
                  Consumer(
                    builder: (context, ref, child) {
                      ref.watch(clinicWishlistChangeProvider);
                      final state =
                          ref.watch(clinicWishlistChangeProvider.notifier);
                      state.getInitClinicWishlist(
                          clinics, clinics[index].id ?? -1);
                      return Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () async {
                            state.clinicColors[clinics[index].id] == 'grey'
                                ? await state.createClinicWishlist(
                                    clinics[index].id ?? -1)
                                : await state.removeClinicWishlist(
                                    clinics[index].id ?? -1);
                          },
                          child: Image.asset(
                              'assets/icons/ic_wishlist_${state.clinicColors[clinics[index].id]}.png',
                              width: 16,
                              height: 16),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              clinics[index].addressDepth1Name ?? '-',
                              style: AppTextTheme.middleGrey8
                                  .copyWith(height: 1.2),
                            ),
                            Text(
                              clinics[index].name?.replaceAll('', '\u{200B}') ??
                                  '-', //말줄임 적용
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  AppTextTheme.black10b.copyWith(height: 1.2),
                            ),
                          ]),
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () async {
                          await ref
                              .read(clickCountRepositoryProvider)
                              .updateClickCount(clinics[index].id ?? -1, 'C');

                          final kakao =
                              clinics[index].kakaotalkChannelLink?.split('/');
                          if (kakao != null) {
                            // 카카오톡 채널 채팅 URL
                            Uri url = Uri.parse(
                                "https://pf.kakao.com/${kakao.last}/chat");
                            // await TalkApi.instance.channelChatUrl('_LxnHBxl');

                            // 디바이스 브라우저 열기
                            try {
                              await launchBrowserTab(url);
                            } catch (error) {
                              print('카카오톡 채널 채팅 실패 $error');
                            }
                          }
                        },
                        child: Image.asset('assets/icons/ic_kakao_channel.png',
                            width: 25),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
        childCount: clinics.length,
      ),
    );
  }
}
