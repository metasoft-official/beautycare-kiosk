<template>
    <q-page class="bg-grey-2 flex justify-between">
        <c-row no-gutters class="bg-white" style="border-bottom-right-radius: 90px; border-bottom-left-radius: 90px; box-shadow: 0px 0px 60px 0px #0000001a">
            <c-col cols="12 text-center">
                <div class="text-title">피부MBTI 진단을 위한 촬영이 있습니다.</div>
                <div class="text-subtitle2 text-grey-1">촬영 한번으로 피부 MBTI를 예측해드릴게요!</div>
            </c-col>
            <c-col cols="5">
                <q-img :src="careraExImg" alt="예시"> </q-img>
            </c-col>
            <c-col cols="7" class="flex justify-center items-center">
                <div>
                    <div class="text-subtitle2">촬영화면이 나오면,</div>
                    <div class="text-subtitle2 text-blue-4 text-weight-bold">상단의 버튼을 터치해</div>
                    <div class="text-subtitle2">촬영을 진행할 수 있어요.</div>
                </div>
            </c-col>
        </c-row>

        <c-row class="mt-20">
            <c-col cols="12">
                <q-card flat class="bg-white" style="border-radius: 30px">
                    <q-card-section>
                        <div class="text-subtitle1 flex justify-center items-center">
                            <q-img style="width: 90px" :src="makeupIcomImg" class="mr-10"></q-img>
                            <span class="text-weight-bold"> 화장하지 않은 상태 </span>
                            로 진단하세요
                        </div>
                    </q-card-section>
                </q-card>
            </c-col>
            <c-col cols="12">
                <q-card flat class="bg-white" style="border-radius: 30px">
                    <q-card-section>
                        <div class="text-subtitle1 flex justify-center items-center">
                            <q-img style="width: 90px" :src="hairIconImg" class="mr-10"></q-img>
                            <span class="text-weight-bold"> 앞머리는 넘긴 채 </span>
                            로 유지해주세요
                        </div>
                    </q-card-section>
                </q-card>
            </c-col>
            <c-col cols="12">
                <q-card flat class="bg-white" style="border-radius: 30px">
                    <q-card-section>
                        <div class="text-subtitle1 flex justify-center items-center">
                            <q-img style="width: 90px" :src="accessoryIconImg" class="mr-10"></q-img>
                            <span class="text-weight-bold"> 안경, 마스크, 모자 </span>
                            로 벗어주세요
                        </div>
                    </q-card-section>
                </q-card>
            </c-col>
        </c-row>
        <c-row>
            <c-col cols="6" class="flex items-end">
                <q-btn class="full-width py-10" style="background-color: white; border: 3px solid var(--c-blue-4); border-radius: 15px" @click="moveHome">
                    <q-icon left size="3em" color="blue-4" name="mdi-home" />
                    <div class="text-subtitle1 text-weight-bold text-blue-4">괜찮아요</div>
                </q-btn>
            </c-col>
            <c-col cols="6" class="flex items-end">
                <q-btn class="full-width py-10" color="blue-4" style="border-radius: 15px" @click="moveCamera">
                    <div class="text-subtitle1 text-weight-bold text-white" style="padding: 3px">할래요</div>
                </q-btn>
            </c-col>
        </c-row>
    </q-page>
</template>

<script setup lang="ts">
import careraExImg from '@/assets/images/diagnosis/camera_example2.png';
import makeupIcomImg from '@/assets/images/diagnosis/makeup_icon.png';
import accessoryIconImg from '@/assets/images/diagnosis/accessory_icon.png';
import hairIconImg from '@/assets/images/diagnosis/hair_icon.png';
import { useRouter } from 'vue-router';

const $router = useRouter();

function moveHome() {
    $router.push('/home');
}

function moveCamera() {
    $router.push({
        path: '/camera',
        query: {
            from: 'mbti',
        },
    });
}
</script>

<style></style>
