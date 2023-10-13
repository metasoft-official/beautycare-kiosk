<template>
    <q-page class="bg-grey-2 flex justify-between">
        <c-row class="bg-white pt-10 pb-20" style="border-bottom-right-radius: 90px; border-bottom-left-radius: 90px; box-shadow: 0px 0px 60px 0px #0000001a">
            <c-col cols="12" class="flex items-center" style="position: relative">
                <div class="text-header text-blue-4 mr-5">
                    {{ disease.name }}
                </div>
                <div class="text-subtitle2 text-grey-1" style="word-break: break-all">
                    {{ disease.nameEng }}
                </div>
                <div style="position: absolute; right: 0" class="pr-4">
                    <q-img :src="parkReturnIcon" alt="뒤로가기" style="min-width: 58px; min-height: 58px" @click="moveBack"></q-img>
                </div>
            </c-col>
            <c-col :cols="diseaseImage ? 6 : 12" class="text-center">
                <q-img :src="myImage" alt="나" style="max-width: 540px" ratio="1"></q-img>
            </c-col>
            <template v-if="diseaseImage">
                <c-col cols="6" class="text-center">
                    <q-img :src="diseaseImage" alt="질병" style="max-width: 540px"></q-img>
                </c-col>
            </template>
            <c-col cols="12" class="">
                <div class="text-content text-blue-4 text-weight-bold flex items-center">
                    <q-img :src="infoIcon" alt="요약 정보 아이콘" class="mr-3" style="max-width: 30px"></q-img>
                    요약 정보
                </div>
                <div class="text-content text-grey-5 py-5" style="max-height: 300px; overflow-y: auto">
                    {{ disease.symptoms }}
                </div>
            </c-col>
        </c-row>

        <c-row class="pt-10 mt-auto">
            <c-col class="flex">
                <div class="text-subcontent flex items-center">
                    내 피부 관리법에 대해 살펴보고,<br />
                    시술과 화장품을 추천받고 싶다면?
                </div>
                <div class="text-content text-blue-4 text-weight-bold flex pb-10">
                    QR코드를 촬영해<br />
                    App 다운로드하기
                </div>
            </c-col>
            <c-col cols="auto" style="display: flex">
                <div class="pr-5">
                    <q-card style="aspect-ratio: 1; width: 282px; border-radius: 35px">
                        <q-card-section>
                            <q-img src="https://oxyfacial.co.kr/api/image/825" alt="QR코드" style="max-width: 250px"></q-img>
                        </q-card-section>
                    </q-card>
                    <c-col cols="12" class="d-flex align-center justify-center text-subtitle3 text-weight-bold flex items-end pb-10 d-flex align-cente">
                        <q-img :src="iosImg" alt="QR코드" style="width: 105px; height: 50px"></q-img>
                    </c-col>
                </div>
                <div>
                    <q-card style="aspect-ratio: 1; width: 282px; border-radius: 35px">
                        <q-card-section>
                            <q-img src="https://oxyfacial.co.kr/api/image/847" alt="QR코드" style="max-width: 250px"></q-img>
                        </q-card-section>
                    </q-card>
                    <c-col cols="12" class="d-flex align-center justify-center text-subtitle3 text-weight-bold flex items-end pb-10 d-flex align-cente">
                        <q-img :src="aosImg" alt="QR코드" style="width: 175px; height: 50px"></q-img>
                    </c-col>
                </div>
            </c-col>
        </c-row>
        <c-row>
            <c-col cols="6" class="flex items-end">
                <q-btn class="full-width py-10" style="background-color: white; border: 3px solid var(--c-blue-4); border-radius: 15px" @click="moveCamera">
                    <div class="text-subtitle1 text-weight-bold text-blue-4">다시 측정하기</div>
                </q-btn>
            </c-col>
            <c-col cols="6" class="flex items-end">
                <q-btn class="full-width py-10" color="blue-4" style="border-radius: 15px" @click="moveHome">
                    <q-icon left size="3em" color="white" name="mdi-home" />
                    <div class="text-subtitle1 text-weight-bold text-white" style="padding: 3px">홈으로</div>
                </q-btn>
            </c-col>
        </c-row>
    </q-page>
</template>

<script setup lang="ts">
import meta from '@/api/meta';
import infoIcon from '@/assets/images/result/icon_info.png';
import parkReturnIcon from '@/assets/images/result/icon_park_return.png';
import iosImg from '@/assets/images/diagnosis/ios.png';
import aosImg from '@/assets/images/diagnosis/aos.png';
import { DiseaseEntity } from '@/types/global';
import { ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';

const $router = useRouter();
const $route = useRoute();

const { imageId, topkId } = $route.query;

const myImage = ref('');
const diseaseImage = ref('');
const disease = ref<DiseaseEntity>({});

function moveHome() {
    $router.push('/home');
}

function moveCamera() {
    $router.push({
        path: '/camera',
        query: {
            from: 'disease',
        },
    });
}

function moveBack() {
    $router.go(-1);
}

async function load() {
    if (!imageId || !topkId || isNaN(Number(imageId)) || isNaN(Number(topkId))) {
        if (await meta.confirm('매칭된 질환 결과가 없습니다.\n다시 촬영하시겠어요?')) {
            moveCamera();
        } else {
            $router.push('/home');
        }
        return;
    }
    loadDisease();
    loadImage();
}

async function loadDisease() {
    const { data } = await meta.api.common.diseases.get(Number(topkId));
    disease.value = data;
    if (data.diseaseImageId) {
        const reader = new FileReader();
        reader.onloadend = function () {
            const base64data = reader.result as string;
            diseaseImage.value = base64data;
        };
        const { data: blob } = await meta.api.attachFile.getImage(data.diseaseImageId);
        reader.readAsDataURL(blob);
    }
}

async function loadImage() {
    const reader = new FileReader();
    reader.onloadend = function () {
        const base64data = reader.result as string;
        myImage.value = base64data;
    };
    const { data: blob } = await meta.api.attachFile.getImage(Number(imageId));
    reader.readAsDataURL(blob);
}

load();
</script>

<style></style>
