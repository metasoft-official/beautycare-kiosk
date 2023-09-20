<template>
    <q-page>
        <div style="padding-top: 100px"></div>
        <c-row
            class="bg-white pb-30 wide-container"
            style="border-radius: 90px; box-shadow: 0px 0px 60px 0px #0000001a"
            justify="center"
        >
            <c-col cols="auto" class="flex items-center">
                <div style="position: relative; height: 200px; width: 352px">
                    <q-img
                        :src="mbtiImgObj[userMbti.skinMbtiName as string]"
                        :alt="(userMbti.skinMbtiName as string)"
                        style="
                            max-width: 352px;
                            position: absolute;
                            top: -150px;
                        "
                    ></q-img>
                </div>
            </c-col>
            <c-col cols="12" class="text-center">
                <div class="text-header">나의 피부 MBTI 결과</div>
                <div
                    style="
                        font-size: 108px;
                        font-weight: 900;
                        line-height: 151px;
                        letter-spacing: -0.04em;
                    "
                    class="text-blue-4"
                >
                    {{ userMbti.skinMbtiName }}
                </div>
                <div class="text-subtitle1 text-weight-bold">
                    {{
                        mbti.subtitle?.substring(
                            0,
                            mbti.subtitle?.trim().lastIndexOf(' ')
                        )
                    }}
                    <span class="text-blue-4">{{
                        mbti.subtitle?.substring(
                            mbti.subtitle?.trim().lastIndexOf(' ') + 1
                        )
                    }}</span>
                </div>
                <div class="text-content text-grey-1">
                    {{ mbti.description }}
                </div>
            </c-col>
            <c-col cols="12" class="pt-20">
                <div class="text-content text-weight-bold">
                    피부 고민 키워드
                </div>
            </c-col>
            <c-col
                v-for="(keyword, index) in mbti.keywordList"
                :key="index"
                cols="4"
            >
                <q-card
                    bordered
                    flat
                    style="
                        border: 1px solid var(--c-blue-4);
                        border-radius: 50px;
                    "
                >
                    <q-card-section
                        class="text-content text-weight-bold text-blue-4 text-center"
                    >
                        #{{ keyword.keyword }}
                    </q-card-section>
                </q-card>
            </c-col>
        </c-row>
        <c-row class="pt-10">
            <c-col cols="12">
                <c-row no-gutters justify="between" class="pa-0">
                    <c-col cols="auto">
                        <div>
                            <div class="text-content">
                                App을 다운로드하여 상세 문진표 작성 및<br />
                                자세한 결과를 확인하실 수 있습니다!
                            </div>
                            <div
                                class="mt-20 text-subtitle3 text-blue-4 text-weight-bold flex items-end"
                            >
                                QR코드를 촬영해 App 다운로드하기
                            </div>
                        </div>
                    </c-col>
                    <c-col cols="auto">
                        <q-card
                            class="bg-white"
                            style="aspect-ratio: 1; width: 282px"
                        >
                            <q-card-section>
                                <q-img
                                    :src="qrcodeImg"
                                    alt="QR코드"
                                    style="max-width: 250px"
                                ></q-img>
                            </q-card-section>
                        </q-card>
                    </c-col>
                </c-row>
            </c-col>
        </c-row>
        <c-row>
            <c-col cols="6" class="flex items-end">
                <q-btn
                    class="full-width py-10"
                    style="
                        background-color: white;
                        border: 3px solid var(--c-blue-4);
                        border-radius: 15px;
                    "
                    @click="moveCamera"
                >
                    <div class="text-subtitle1 text-weight-bold text-blue-4">
                        다시 측정하기
                    </div>
                </q-btn>
            </c-col>
            <c-col cols="6" class="flex items-end">
                <q-btn
                    class="full-width py-10"
                    color="blue-4"
                    style="border-radius: 15px"
                    @click="moveHome"
                >
                    <q-icon left size="3em" color="white" name="mdi-home" />
                    <div
                        class="text-subtitle1 text-weight-bold text-white"
                        style="padding: 3px"
                    >
                        홈으로
                    </div>
                </q-btn>
            </c-col>
        </c-row>
    </q-page>
</template>

<script setup lang="ts">
import drntImg from '@/assets/images/result/mbti_banni_DRNT.png';
import drnwImg from '@/assets/images/result/mbti_banni_DRNW.png';
import drptImg from '@/assets/images/result/mbti_banni_DRPT.png';
import drpwImg from '@/assets/images/result/mbti_banni_DRPW.png';
import dsntImg from '@/assets/images/result/mbti_banni_DSNT.png';
import dsnwImg from '@/assets/images/result/mbti_banni_DSNW.png';
import dsptImg from '@/assets/images/result/mbti_banni_DSPT.png';
import dspwImg from '@/assets/images/result/mbti_banni_DSPW.png';
import orntImg from '@/assets/images/result/mbti_banni_ORNT.png';
import ornwImg from '@/assets/images/result/mbti_banni_ORNW.png';
import orptImg from '@/assets/images/result/mbti_banni_ORPT.png';
import orpwImg from '@/assets/images/result/mbti_banni_ORPW.png';
import osntImg from '@/assets/images/result/mbti_banni_OSNT.png';
import osnwImg from '@/assets/images/result/mbti_banni_OSNW.png';
import osptImg from '@/assets/images/result/mbti_banni_OSPT.png';
import ospwImg from '@/assets/images/result/mbti_banni_OSPW.png';
import qrcodeImg from '@/assets/images/diagnosis/qrcode.png';
import { useRoute, useRouter } from 'vue-router';
import { useQuasar } from 'quasar';
import meta from '@/api/meta';
import { UserSkinMbtiEntity, SkinMbtiEntity } from '@/types/global';
import { ref } from 'vue';

const mbtiImgObj = ref<{ [prop: string]: string }>({
    DRNT: drntImg,
    DRNW: drnwImg,
    DRPT: drptImg,
    DRPW: drpwImg,
    DSNT: dsntImg,
    DSNW: dsnwImg,
    DSPT: dsptImg,
    DSPW: dspwImg,
    ORNT: orntImg,
    ORNW: ornwImg,
    ORPT: orptImg,
    ORPW: orpwImg,
    OSNT: osntImg,
    OSNW: osnwImg,
    OSPT: osptImg,
    OSPW: ospwImg,
});

const $router = useRouter();
const $route = useRoute();
const $q = useQuasar();

const userMbti = ref<UserSkinMbtiEntity>({});
const mbti = ref<SkinMbtiEntity>({});

function moveHome() {
    $router.push('/intro');
}

function moveCamera() {
    $router.push({
        path: '/camera',
        query: {
            from: 'disease',
        },
    });
}

async function loadMbti() {
    $q.loading.show({ message: 'MBTI 불러오는 중...' });
    const { id } = $route.query;
    if (!id && isNaN(Number(id))) {
        $q.dialog({
            title: '확인',
            message: '매칭된 질환 결과가 없습니다. 다시 촬영하시겠어요?',
            cancel: true,
            persistent: true,
        })
            .onOk(() => {
                moveCamera();
            })
            .onCancel(() => {
                $router.push('/intro');
            });
        return;
    }
    const { data } = await meta.api.common.userSkinMbti.get(Number(id));
    userMbti.value = data;
    if (data.skinMbtiId) {
        const { data: mbtiData } = await meta.api.common.skinMbti.get(
            data.skinMbtiId
        );
        mbti.value = mbtiData;
    }
    $q.loading.hide();
}

loadMbti();
</script>

<style></style>
