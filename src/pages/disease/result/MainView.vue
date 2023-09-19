<template>
    <q-page class="bg-grey-2 flex justify-between">
        <c-row
            class="bg-white pt-10 pb-20"
            style="
                border-bottom-right-radius: 90px;
                border-bottom-left-radius: 90px;
                box-shadow: 0px 0px 60px 0px #0000001a;
            "
        >
            <c-col cols="12" class="text-center">
                <q-img
                    :src="myImage.base64"
                    alt="예시"
                    style="max-width: 540px"
                    ratio="1"
                ></q-img>
                <div class="text-header">
                    당신의 증상과 가장 비슷한 피부질환
                </div>
            </c-col>
            <c-col cols="12">
                <q-card
                    flat
                    style="
                        border-radius: 30px;
                        border: 3px solid var(--c-blue-4);
                    "
                    class="bg-blue-3"
                    @click="moveDetail"
                >
                    <q-card-section>
                        <c-row no-gutters>
                            <c-col>
                                <div class="text-subtitle2 text-blue-4">
                                    <span class="text-weight-bold">
                                        {{ disease.name }}
                                    </span>
                                    {{ Math.round(disease.value * 100) }}%
                                </div>
                                <q-linear-progress
                                    size="48px"
                                    :value="disease.value"
                                    color="blue-4"
                                    track-color="white"
                                    style="border-radius: 54px"
                                    class="q-mt-sm"
                                />
                            </c-col>
                            <c-col
                                cols="auto"
                                class="flex justify-center items-center"
                            >
                                <q-icon
                                    size="60px"
                                    color="blue-4"
                                    class="pl-4"
                                    name="mdi-chevron-right"
                                ></q-icon>
                            </c-col>
                        </c-row>
                    </q-card-section>
                </q-card>
            </c-col>
        </c-row>

        <c-row class="pt-10">
            <c-col class="flex">
                <div class="text-content">
                    내 피부 관리법에 대해 살펴보고,<br />
                    시술과 화장품을 추천받고 싶다면?
                </div>
                <div
                    class="text-subtitle3 text-blue-4 text-weight-bold flex items-end pb-10"
                >
                    QR코드를 촬영해 App 다운로드하기
                </div>
            </c-col>
            <c-col cols="auto">
                <q-card style="aspect-ratio: 1; width: 282px">
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
import meta from '@/api/meta';
import qrcodeImg from '@/assets/images/diagnosis/qrcode.png';
import { useQuasar } from 'quasar';
import { ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';

const $q = useQuasar();
const $router = useRouter();
const $route = useRoute();

const { userDiseaseId } = $route.query;
const myImage = ref<{ base64: string; id: number }>({ base64: '', id: 0 });
const disease = ref({ name: '', value: 0, topkId: 0 });

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

function moveDetail() {
    $router.push({
        path: '/disease/detail',
        query: {
            imageId: myImage.value.id,
            topkId: disease.value.topkId,
        },
    });
}

async function loadUserDisease() {
    if (!userDiseaseId || isNaN(Number(userDiseaseId))) {
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
    const { data } = await meta.api.common.userDiseases.get(
        Number(userDiseaseId)
    );

    if (data.imageId) {
        const reader = new FileReader();
        reader.onloadend = function () {
            const base64data = reader.result as string;
            myImage.value.base64 = base64data;
        };
        myImage.value.id = data.imageId;
        const { data: blob } = await meta.api.attachFile.getImage(data.imageId);
        reader.readAsDataURL(blob);
    }

    if (data.topk1Id) {
        disease.value = {
            topkId: data.topk1Id,
            name: data.topk1Label as string,
            value: data.topk1Value as number,
        };
    } else if (data.topk2Id) {
        disease.value = {
            topkId: data.topk2Id,
            name: data.topk2Label as string,
            value: data.topk2Value as number,
        };
    } else if (data.topk3Id) {
        disease.value = {
            topkId: data.topk3Id,
            name: data.topk3Label as string,
            value: data.topk3Value as number,
        };
    } else {
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
    }

    // if (disease.value && disease.value.value < 0.3) {
    //     disease.value.value *= 2;
    // }
}

loadUserDisease();
</script>

<style></style>
