<template>
    <q-page class="bg-grey-6 flex justify-between">
        <c-row>
            <c-col
                cols="12"
                class="flex justify-center items-center mt-auto mb-0"
            >
                <template v-if="$route.query.from === 'mbti'">
                    <q-img :src="myImage" style="max-width: 100%"></q-img>
                </template>
                <template v-else>
                    <div class="cropper-container">
                        <VueAdvancedCropper
                            ref="myCropper"
                            :src="myImage"
                            style="width: 100%; height: 100%"
                            :stencil-props="{
                                aspectRatio: 1,
                            }"
                        />
                    </div>
                </template>
            </c-col>
            <c-col
                cols="6"
                class="flex items-end mt-auto"
                style="height: fit-content"
            >
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
                        재촬영
                    </div>
                </q-btn>
            </c-col>
            <c-col
                cols="6"
                class="flex items-end mt-auto"
                style="height: fit-content"
            >
                <q-btn
                    class="full-width py-10"
                    color="blue-4"
                    style="border-radius: 15px"
                    @click="confirm"
                >
                    <div
                        class="text-subtitle1 text-weight-bold text-white"
                        style="padding: 3px"
                    >
                        확인
                    </div>
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
import { useAppStore } from '@/stores/store';
import { Cropper as VueAdvancedCropper } from 'vue-advanced-cropper';
import 'vue-advanced-cropper/dist/style.css';
import 'vue-advanced-cropper/dist/theme.compact.css';

const myCropper = ref<typeof VueAdvancedCropper | null>(null);

const appStore = useAppStore();
const { captureBlob } = storeToRefs(appStore);

const myImage = ref('');

const $q = useQuasar();
const $router = useRouter();
const $route = useRoute();
console.log($route.query.from);

function readBlob() {
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

            // 캔버스 크기를 자를 영역과 같게 설정
            var cropWidth = img.height * 0.4 * (16 / 9); // 자를 영역의 가로 크기
            var cropHeight = img.width * 0.3 + 150; // 자를 영역의 세로 크기
            canvas.width = cropWidth;
            canvas.height = cropHeight;

            // 이미지를 캔버스의 중심에 그리기
            var sourceX = (img.width - cropWidth) / 2 + 150; // 이미지의 중심부터 시작
            var sourceY = (img.height - cropHeight) / 2; // 이미지의 중심부터 시작
            ctx?.drawImage(
                img,
                sourceX,
                sourceY,
                cropWidth,
                cropHeight,
                0,
                0,
                cropWidth,
                cropHeight
            );

            var imgImage = canvas.toDataURL('image/jpeg');

            // 자른 이미지를 저장하거나 다른 작업을 수행할 수 있습니다.
            rotate(imgImage);
        };
    };
    if (captureBlob.value !== null) {
        reader.readAsDataURL(captureBlob.value);
    } else {
        $q.loading.hide();
        $q.dialog({
            title: '확인',
            message: '사진을 불러오는데 실패했습니다.. 다시 촬영하시겠어요?',
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
        canvas.height = img.height;
        canvas.width = img.width;

        // 이미지를 캔버스에 그리기
        ctx?.clearRect(0, 0, canvas.width, canvas.height);
        ctx?.save();
        ctx?.translate(canvas.width / 2, canvas.height / 2); // 회전 중심을 이미지 중심으로 설정
        ctx?.rotate(Math.PI / -2); // -90도 회전
        ctx?.drawImage(
            img,
            -img.width / 2,
            -img.height / 2,
            img.width,
            img.height
        );

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
    if ($route.query.from === 'disease') {
        const data = (myCropper.value as any).getResult();
        myImage.value = data.canvas.toDataURL('image/jpeg');
    }
    if (!captureBlob.value) {
        $q.dialog({
            title: '확인',
            message: '사진을 불러오는데 실패했습니다.. 다시 촬영하시겠어요?',
            cancel: true,
            persistent: true,
        })
            .onOk(() => {
                moveCamera();
            })
            .onCancel(() => {
                $router.push('/intro');
            });
    } else {
        $q.loading.show({
            message: '검사 진행 중...',
        });
        const file = base64toFile(myImage.value);
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

        const { data: id } = await meta.api.common.userDiseases.create(
            userDiseaseDto
        );
        if (!id) {
            $q.loading.hide();
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

        const { data: userDiseaseEntity } =
            await meta.api.common.userDiseases.get(id);

        if (
            !userDiseaseEntity.topk1Id &&
            !userDiseaseEntity.topk2Id &&
            !userDiseaseEntity.topk3Id
        ) {
            $q.loading.hide();
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

        form.append('image', file);
        form.append('id', id.toString());

        await meta.api.common.userDiseases.diagnosisImage(id, form);
        $q.loading.hide();
        switch ($route.query.from) {
            case 'disease':
                $router.push({
                    path: `/${$route.query.from}/result`,
                    query: {
                        userDiseaseId: id,
                    },
                });
                break;
            case 'mbti':
                $router.push(`/${$route.query.from}/survey`);
                break;
            default:
                $q.dialog({
                    title: '확인',
                    message:
                        '매칭된 질환 결과가 없습니다. 다시 촬영하시겠어요?',
                    cancel: true,
                    persistent: true,
                })
                    .onOk(() => {
                        moveCamera();
                    })
                    .onCancel(() => {
                        $router.push('/intro');
                    });
                break;
        }
    }
}

function defaultSize({ imageSize, visibleArea }: any) {
    return {
        width: 1000,
        height: 1000,
    };
}
</script>

<style scoped>
.cropper-container {
    width: 100%; /* 부모 요소인 c-col의 가로 크기에 맞게 */
    height: 100%; /* 부모 요소인 c-col의 세로 크기에 맞게 */
}
</style>
