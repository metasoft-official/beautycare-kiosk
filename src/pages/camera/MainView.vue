<template>
    <q-page class="row items-center justify-evenly" style="position: relative">
        <div class="container">
            <WebCamUI
                ref="cam"
                @photoTaken="photoTaken"
                style="position: relative"
                class="rotated-element"
            />
        </div>
        <div
            :style="`width: ${$q.screen.width}px; height: ${$q.screen.height}px; position: absolute;`"
        >
            <div
                :style="`width: ${$q.screen.width}px; height: ${$q.screen.height}px; position: relative;`"
            >
                <!-- <template v-if="$route.query.from === 'mbti'"> -->
                <div
                    class="flex items-center justify-center"
                    :style="`width: ${$q.screen.width}px; height: 90%; position: absolute; bottom: 15%; background-color: #00000000`"
                >
                    <q-img :src="facePositionImg" style="width: 50%"> </q-img>
                </div>
                <!-- <div
                        class="flex items-center justify-center"
                        :style="`width: ${$q.screen.width}px; height: 200px; position: absolute; top: 0; background-color: #00000080`"
                    >
                        <div class="text-subtitle1 text-white">
                            조금 더 멀리서 촬영해주세요.
                        </div>
                    </div> -->
                <template v-if="$route.query.from === 'mbti'">
                    <div
                        :style="`width: ${$q.screen.width}px; height: 200px; position: absolute; top: 0px; background-color: #00000000`"
                    >
                        <c-row noGutters>
                            <c-col cols="6" class="px-7 py-3">
                                <q-card
                                    bordered
                                    flat
                                    :style="`
                                        background-color: #ffffff4d;
                                        border: 3px solid var(--c-blue-4);
                                        border-radius: 108px;
                                        ${false ? 'opacity: 0.2;' : ''}`"
                                >
                                    <q-card-section
                                        class="text-content text-weight-bold text-blue-4 text-center"
                                    >
                                        정면을 주시하세요
                                    </q-card-section>
                                </q-card>
                            </c-col>
                            <c-col cols="6" class="px-7 py-3">
                                <q-card
                                    bordered
                                    flat
                                    :style="`
                                        background-color: #ffffff4d;
                                        border: 3px solid var(--c-blue-4);
                                        border-radius: 108px;
                                        ${false ? 'opacity: 0.2;' : ''}`"
                                >
                                    <q-card-section
                                        class="text-content text-weight-bold text-blue-4 text-center"
                                    >
                                        얼굴 조명을 균일하게
                                    </q-card-section>
                                </q-card>
                            </c-col>
                            <c-col cols="6" class="px-7 py-3">
                                <q-card
                                    bordered
                                    flat
                                    :style="`
                                        background-color: #ffffff4d;
                                        border: 3px solid var(--c-blue-4);
                                        border-radius: 108px;
                                        ${false ? 'opacity: 0.2;' : ''}`"
                                >
                                    <q-card-section
                                        class="text-content text-weight-bold text-blue-4 text-center"
                                    >
                                        눈을 뜨세요
                                    </q-card-section>
                                </q-card>
                            </c-col>
                            <c-col cols="6" class="px-7 py-3">
                                <q-card
                                    bordered
                                    flat
                                    :style="`
                                        background-color: #ffffff4d;
                                        border: 3px solid var(--c-blue-4);
                                        border-radius: 108px;
                                        ${false ? 'opacity: 0.2;' : ''}`"
                                >
                                    <q-card-section
                                        class="text-content text-weight-bold text-blue-4 text-center"
                                    >
                                        입을 벌리지 마세요
                                    </q-card-section>
                                </q-card>
                            </c-col>
                        </c-row>
                    </div>
                </template>
                <div
                    class="flex items-center justify-center"
                    :style="`width: ${$q.screen.width}px; height: 300px; position: absolute; bottom: 0; background-color: #00000080`"
                >
                    <div
                        style="
                            height: 80%;
                            aspect-ratio: 1;
                            background-color: #00000000;
                            border: 8px solid #fff;
                            border-radius: 150px;
                            position: relative;
                        "
                    >
                        <div
                            style="
                                height: 80%;
                                aspect-ratio: 1;
                                background-color: #fff;
                                border-radius: 150px;
                                position: absolute;
                                bottom: 10%;
                                left: 10%;
                            "
                            @click="capture"
                        ></div>
                    </div>
                </div>
            </div>
        </div>
    </q-page>
</template>

<script setup lang="ts">
import facePositionImg from '@/assets/images/camera/face_position.png';
import { WebCamUI } from 'vue-camera-lib';
import { useQuasar } from 'quasar';
import { onMounted, ref } from 'vue';
import { useRouter, useRoute } from 'vue-router';
import { storeToRefs } from 'pinia';
import { useAppStore } from '@/stores/store';

const appStore = useAppStore();
const { captureBlob } = storeToRefs(appStore);
const $q = useQuasar();
const $router = useRouter();
const $route = useRoute();

const cam = ref();

async function photoTaken(data: { blob: Blob; image_data_url: string }) {
    captureBlob.value = data.blob;
    $q.loading.hide();
    $q.loading.show({
        message: '페이지 이동 중...',
    });
    $router.push({
        path: '/again',
        query: {
            from: $route.query.from,
        },
    });
}

function capture() {
    $q.loading.show({
        message: '사진 처리 중...',
    });
    const buttonControl = document.getElementsByClassName('button-control');
    const button = buttonControl[0].getElementsByTagName('button');
    button[0].click();
}

$q.loading.show({
    message: '카메라 세팅 중...',
});

onMounted(() => {
    setTimeout(() => {
        if (!cam.value.deviceId) {
            cam.value.deviceId = cam.value.cameras[1].deviceId;
            cam.value.setCamera();
        }
        $q.loading.hide();
    }, 3000);
});
</script>

<style scoped>
.container {
    width: 100vw; /* 화면 너비에 맞게 조절 */
    height: 100vh; /* 화면 높이에 맞게 조절 */
    display: flex;
    align-items: center; /* 요소를 세로 중앙으로 정렬 */
    justify-content: center; /* 요소를 가로 중앙으로 정렬 */
    overflow: hidden; /* 스크롤 숨기기 */
}

.rotated-element {
    width: 100vh; /* 요소의 너비를 화면 높이에 맞게 설정 (90도 회전으로 인해 너비와 높이가 바뀜) */
    aspect-ratio: 16/9;
    height: 100vw; /* 요소의 높이를 화면 너비에 맞게 설정 (90도 회전으로 인해 너비와 높이가 바뀜) */
    transform: rotate(-90deg); /* 90도 회전 */
    transform-origin: center center; /* 회전 중심을 가운데로 설정 */
    box-sizing: border-box; /* 회전시에도 요소 크기가 화면 크기에 맞게 유지되도록 설정 */
}
</style>
