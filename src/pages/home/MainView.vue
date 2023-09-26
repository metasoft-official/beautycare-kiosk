<template>
    <q-page class="flex items-center">
        <c-row no-gutters justify="center">
            <c-col cols="12" class="text-title pb-10 text-center"> 예측할 정보를 선택해 주세요. </c-col>
            <c-col cols="6" class="text-content text-center">
                <q-img @click="moveDisease" :src="btnSkinDiseaseImg"></q-img>
                내 피부 속 숨겨진 문제를<br />찾아드립니다.
            </c-col>
            <c-col cols="6" class="text-content text-center">
                <q-img @click="moveMbti" :src="btnSkinMbtiImg"></q-img>
                AI로 내 피부타입 진단 받고,<br />체계적으로 관리해보세요!
            </c-col>
        </c-row>
    </q-page>
</template>

<script setup lang="ts">
import btnSkinDiseaseImg from '@/assets/images/home/btn_skin_disease.png';
import btnSkinMbtiImg from '@/assets/images/home/btn_skin_mbti.png';
import { useRouter } from 'vue-router';

const $router = useRouter();

function moveDisease() {
    $router.push('/disease/diagnosis');
}

function moveMbti() {
    $router.push('/mbti/diagnosis');
}
</script>

<style></style>
