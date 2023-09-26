<template>
    <q-page class="bg-grey-6 flex justify-between" style="position: relative">
        <q-toolbar class="py-10 bg-white" style="height: fit-content; position: absolute; z-index: 2">
            <q-img :src="logoImg" alt="뷰티케어 로고" style="max-width: 400px" />
            <q-space></q-space>
            <q-icon size="80px" color="blue-4" name="mdi-home" @click="$router.push('/home')"></q-icon>
        </q-toolbar>
        <c-row class="pa-0">
            <c-col
                cols="12"
                :class="{
                    'pa-0': true,
                    flex: true,
                    'items-center': true,
                    'justify-center': true,
                    'px-10': $route.query.from === 'mbti',
                }"
            >
                <template v-if="$route.query.from === 'mbti'">
                    <q-img :src="myImage" style="width: 100%"></q-img>
                </template>
                <template v-else>
                    <VueAdvancedCropper
                        ref="myCropper"
                        :src="myImage"
                        style="max-width: 1040px"
                        :defaultSize="{
                            width: 80,
                            height: 80,
                        }"
                        :stencil-props="{
                            aspectRatio: 1,
                        }"
                        @change="timerStore.resetTimer()"
                    />
                </template>
            </c-col>
        </c-row>
        <c-row style="position: absolute; z-index: 2; bottom: 0" class="full-width">
            <c-col cols="6" class="flex items-end mt-auto" style="height: fit-content">
                <q-btn class="full-width py-10" style="background-color: white; border: 3px solid var(--c-blue-4); border-radius: 15px" @click="moveCamera">
                    <div class="text-subtitle1 text-weight-bold text-blue-4">재촬영</div>
                </q-btn>
            </c-col>
            <c-col cols="6" class="flex items-end mt-auto" style="height: fit-content">
                <q-btn class="full-width py-10" color="blue-4" style="border-radius: 15px" @click="confirm">
                    <div class="text-subtitle1 text-weight-bold text-white" style="padding: 3px">확인</div>
                </q-btn>
            </c-col>
        </c-row>
    </q-page>
</template>

<script setup lang="ts">
import { useQuasar } from 'quasar';
import { ref } from 'vue';
import { useRouter, useRoute } from 'vue-router';
import axios from 'axios';
import meta from '@/api/meta';
import { storeToRefs } from 'pinia';
import { useAppStore, useTimerStore } from '@/stores/store';
import { Cropper as VueAdvancedCropper } from 'vue-advanced-cropper';
import 'vue-advanced-cropper/dist/style.css';
import 'vue-advanced-cropper/dist/theme.compact.css';
import logoImg from '@/assets/logo.png';

const myCropper = ref<typeof VueAdvancedCropper | null>(null);

const appStore = useAppStore();
const timerStore = useTimerStore();
const { captureBlob } = storeToRefs(appStore);

const myImage = ref('');

const $q = useQuasar();
const $router = useRouter();
const $route = useRoute();
console.log($route.query.from);

async function readBlob() {
    $q.loading.show({
        message: '사진 불러오는 중...',
    });
    const reader = new FileReader();
    reader.onloadend = function () {
        const base64data = reader.result as string;
        // 이미지 객체 생성
        var img = new Image();
        img.src = base64data; // 자르고자 하는 이미지 경로로 바꿔주세요

        // canvas 요소와 그림 컨텍스트 가져오기
        var canvas = document.createElement('canvas');
        var ctx = canvas.getContext('2d');

        // 이미지 로딩 후에 작업 수행
        img.onload = function () {
            // // 캔버스 크기를 이미지와 같게 설정
            // canvas.height = img.width;
            // canvas.width = img.height;

            // // 이미지를 캔버스에 그리기
            // ctx?.clearRect(0, 0, canvas.width, canvas.height);
            // ctx?.save();
            // ctx?.translate(canvas.width / 2, canvas.height / 2); // 회전 중심을 이미지 중심으로 설정
            // ctx?.rotate(Math.PI / -2); // -90도 회전
            // ctx?.drawImage(
            //     img,
            //     -img.width / 2,
            //     -img.height / 2,
            //     img.width,
            //     img.height
            // );
            if ($route.query.from === 'mbti') {
                // 캔버스 크기를 자를 영역과 같게 설정
                var cropWidth = img.height * 0.2 * (16 / 9); // 자를 영역의 가로 크기
                var cropHeight = img.width * 0.2; // 자를 영역의 세로 크기
                canvas.width = cropWidth;
                canvas.height = cropHeight;

                // 이미지를 캔버스의 중심에 그리기
                var sourceX = (img.width - cropWidth) / 2 + 250; // 이미지의 중심부터 시작
                var sourceY = (img.height - cropHeight) / 2; // 이미지의 중심부터 시작
                ctx?.drawImage(img, sourceX, sourceY, cropWidth, cropHeight, 0, 0, cropWidth, cropHeight);
            } else {
                // 캔버스 크기를 이미지와 같게 설정
                canvas.width = img.width;
                canvas.height = img.height;

                // 이미지를 캔버스에 그리기
                ctx?.clearRect(0, 0, canvas.width, canvas.height);
                ctx?.save();
                ctx?.drawImage(img, 0, 0);
            }

            var imgImage = canvas.toDataURL('image/jpeg');

            // 자른 이미지를 저장하거나 다른 작업을 수행할 수 있습니다.
            rotate(imgImage);
        };
    };
    if (captureBlob.value !== null) {
        reader.readAsDataURL(captureBlob.value);
    } else {
        $q.loading.hide();
        if (await meta.confirm('사진을 불러오는데 실패했습니다.. 다시 촬영하시겠어요?')) {
            moveCamera();
        } else {
            $router.push('/home');
        }
    }
}

readBlob();

function rotate(image: string) {
    // 이미지 객체 생성
    var img = new Image();
    img.src = image; // 자르고자 하는 이미지 경로로 바꿔주세요

    // canvas 요소와 그림 컨텍스트 가져오기
    var canvas = document.createElement('canvas');
    var ctx = canvas.getContext('2d');

    // 이미지 로딩 후에 작업 수행
    img.onload = function () {
        // 캔버스 크기를 이미지와 같게 설정
        if ($route.query.from === 'mbti') {
            canvas.height = img.height;
            canvas.width = img.width;
        } else {
            canvas.height = img.width;
            canvas.width = img.height;
        }

        // 이미지를 캔버스에 그리기
        ctx?.clearRect(0, 0, canvas.width, canvas.height);
        ctx?.save();
        ctx?.translate(canvas.width / 2, canvas.height / 2); // 회전 중심을 이미지 중심으로 설정
        ctx?.scale(-1, 1); // x 축을 뒤집어 좌우 반전
        ctx?.rotate(Math.PI / -2); // -90도 회전
        ctx?.drawImage(img, -img.width / 2, -img.height / 2, img.width, img.height);

        // 자른 이미지를 저장하거나 다른 작업을 수행할 수 있습니다.
        myImage.value = canvas.toDataURL('image/jpeg');
        $q.loading.hide();
    };
}

function moveCamera() {
    $router.go(-1);
}

function base64toFile(base_data: string) {
    let arr = base_data.split(','),
        bstr = atob(arr[1]),
        n = bstr.length,
        u8arr = new Uint8Array(n);

    while (n--) {
        u8arr[n] = bstr.charCodeAt(n);
    }

    return new File([u8arr], 'my_image.png', { type: 'image/jpeg' });
}

async function confirm() {
    try {
        if (!captureBlob.value) {
            if (await meta.confirm('사진을 불러오는데 실패했습니다.. 다시 촬영하시겠어요?')) {
                moveCamera();
            } else {
                $router.push('/home');
            }
        } else {
            $q.loading.show({
                message: '검사 진행 중...',
            });
            switch ($route.query.from) {
                case 'disease':
                    const data = (myCropper.value as any).getResult();
                    let cutImage = data.canvas.toDataURL('image/jpeg');
                    const file = base64toFile(cutImage);
                    const form = new FormData();
                    form.append('file', file);
                    const response = await axios.post('/other/', form, {
                        headers: { 'Content-Type': 'multipart/form-data' },
                    });
                    const jsonData = response.data;
                    console.log(jsonData['topk_values']);
                    const userDiseaseDto = {
                        userId: 34,
                        topk1Label: jsonData['topk_label'][0],
                        topk1Value: jsonData['topk_values'][0],
                        topk2Label: jsonData['topk_label'][1],
                        topk2Value: jsonData['topk_values'][1],
                        topk3Label: jsonData['topk_label'][2],
                        topk3Value: jsonData['topk_values'][2],
                    };

                    const { data: id } = await meta.api.common.userDiseases.create(userDiseaseDto);
                    if (!id) {
                        $q.loading.hide();
                        if (await meta.confirm('매칭된 질환 결과가 없습니다.\n다시 촬영하시겠어요?')) {
                            moveCamera();
                        } else {
                            $router.push('/home');
                        }
                    }

                    const { data: userDiseaseEntity } = await meta.api.common.userDiseases.get(id);

                    if (!userDiseaseEntity.topk1Id && !userDiseaseEntity.topk2Id && !userDiseaseEntity.topk3Id) {
                        $q.loading.hide();
                        if (await meta.confirm('매칭된 질환 결과가 없습니다.\n다시 촬영하시겠어요?')) {
                            moveCamera();
                        } else {
                            $router.push('/home');
                        }
                        return;
                    }

                    form.append('image', file);
                    form.append('id', id.toString());

                    await meta.api.common.userDiseases.diagnosisImage(id, form);
                    $q.loading.hide();
                    $router.push({
                        path: `/${$route.query.from}/result`,
                        query: {
                            userDiseaseId: id,
                        },
                    });
                    break;
                case 'mbti':
                    $q.loading.hide();
                    $router.push(`/${$route.query.from}/survey`);
                    break;
                default:
                    $q.loading.hide();
                    if (await meta.confirm('매칭된 질환 결과가 없습니다.\n다시 촬영하시겠어요?')) {
                        moveCamera();
                    } else {
                        $router.push('/home');
                    }
                    break;
            }
        }
    } catch (e) {
        $q.loading.hide();
        if (await meta.confirm('매칭된 질환 결과가 없습니다.\n다시 촬영하시겠어요?')) {
            moveCamera();
        } else {
            $router.push('/home');
        }
    }
}

async function test() {
    if (await meta.confirm('테스트입니다.')) {
        meta.alert('확인');
    }
}

test();
</script>

<style scoped></style>
