<template>
    <q-page class="bg-grey-2 flex justify-between">
        <c-row no-gutters class="py-15">
            <q-space></q-space>
            <c-col cols="6" class="flex items-end pr-2">
                <q-btn
                    unelevated
                    :disable="step === 0 && asnwerIndex === 0"
                    class="full-width py-10"
                    :style="`
                        background-color: ${
                            step === 0 && asnwerIndex === 0
                                ? 'var(--c-grey-4)'
                                : 'white'
                        };
                        border: 3px solid ${
                            step === 0 && asnwerIndex === 0
                                ? 'var(--c-grey-3)'
                                : 'var(--c-blue-4)'
                        };
                        border-radius: 15px;`"
                    @click="prev"
                >
                    <div
                        :class="{
                            'text-subtitle1': true,
                            'text-weight-bold': true,
                            'text-blue-4': !(step === 0 && asnwerIndex === 0),
                            'text-grey-3': step === 0 && asnwerIndex === 0,
                        }"
                    >
                        이전
                    </div>
                </q-btn>
            </c-col>
            <c-col cols="6" class="flex items-end">
                <q-btn
                    unelevated
                    :disable="
                        answers[step] &&
                        answers[step][asnwerIndex]?.answerId === null
                    "
                    class="full-width py-10"
                    color="blue-4"
                    :style="
                        'border-radius: 15px; ' +
                        (answers[step] &&
                        answers[step][asnwerIndex]?.answerId === null
                            ? 'background-color: var(--c-grey-4) !important; border: 3px solid var(--c-grey-3)'
                            : '')
                    "
                    @click="next"
                >
                    <div
                        class="text-subtitle1 text-weight-bold text-white"
                        :style="
                            answers[step] &&
                            answers[step][asnwerIndex]?.answerId !== null
                                ? 'padding: 3px'
                                : ''
                        "
                    >
                        {{
                            surveyList.length - 1 === step &&
                            answers[step].length - 1 === asnwerIndex
                                ? '완료'
                                : '다음'
                        }}
                    </div>
                </q-btn>
            </c-col>
        </c-row>
        <c-row v-if="surveyList[step]">
            <c-col cols="12">
                <div class="flex justify-between">
                    <div class="text-bigger text-blue-4">
                        {{ asnwerIndex + 1 }}.
                    </div>
                    <div class="text-subtitle3 text-grey-1">
                        ({{ asnwerIndex + 1 }}/{{ surveyList[step].length }})
                    </div>
                </div>
                <div class="text-subtitle2 text-weight-bold pt-10">
                    {{ surveyList[step][asnwerIndex].question }}
                </div>
            </c-col>
            <c-col
                v-for="(option, index) in surveyList[step][asnwerIndex]
                    .surveyAnswerList"
                :key="index"
                cols="12"
            >
                <q-card
                    flat
                    :class="{
                        'bg-white':
                            answers[step][asnwerIndex].answerId === option.id,
                        'bg-blue-4':
                            answers[step][asnwerIndex].answerId === option.id,
                        'text-white':
                            answers[step][asnwerIndex].answerId === option.id,
                    }"
                    style="border-radius: 30px"
                    @click="answerClick(option.id)"
                >
                    <q-card-section>
                        <div class="text-content">
                            <q-img
                                :src="scoreImgList[index]"
                                :alt="`점수${index + 1}`"
                                style="max-width: 42px"
                            ></q-img>
                            {{ option.answer }}
                        </div>
                    </q-card-section>
                </q-card>
            </c-col>
            <template v-for="(survey, index) in surveyList" :key="index">
                <c-col
                    cols="auto"
                    class="flex justify-center items-center px-0 py-5"
                >
                    <q-card
                        class="flex justify-center items-center"
                        flat
                        :style="`border-radius: 100px;
                        width: 160px;
                        height: 160px;
                        ${
                            step >= index
                                ? 'box-shadow: 0px 0px 28px 0px #00000040 !important; background-color: var(--c-blue-4); color: white'
                                : 'border: 5px solid var(--c-grey-7);'
                        }
                    `"
                    >
                        <q-card-section>
                            <div
                                :class="{
                                    'text-center': true,
                                    'text-grey-1': step < index,
                                }"
                            >
                                <div
                                    style="
                                        font-size: 28px;
                                        font-weight: 400;
                                        line-height: 51px;
                                        letter-spacing: 0.1em;
                                    "
                                >
                                    STEP
                                </div>
                                <div
                                    style="
                                        font-size: 56px;
                                        font-weight: 700;
                                        line-height: 51px;
                                        letter-spacing: -0.04em;
                                    "
                                >
                                    {{ index + 1 }}
                                </div>
                            </div>
                        </q-card-section>
                    </q-card>
                </c-col>
                <div
                    class="flex justify-center items-center"
                    style="flex-grow: 1 !important"
                >
                    <div
                        v-if="index + 1 !== surveyList.length"
                        :style="`width: 100%; border: 5px solid ${
                            step > index ? 'var(--c-blue-4)' : '#fff'
                        }`"
                    ></div>
                </div>
            </template>
        </c-row>
    </q-page>
</template>

<script setup lang="ts">
import meta from '@/api/meta';
import score1Img from '@/assets/images/survey/score1_icon.png';
import score2Img from '@/assets/images/survey/score2_icon.png';
import score3Img from '@/assets/images/survey/score3_icon.png';
import score4Img from '@/assets/images/survey/score4_icon.png';
import score5Img from '@/assets/images/survey/score5_icon.png';
import { SurveyQuestionEntity, SurveyResponsesEntity } from '@/types/global';
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { useQuasar } from 'quasar';

const $router = useRouter();
const $q = useQuasar();

const step = ref(0);

const asnwerIndex = ref(0);
const answers = ref<{ questionId: number; answerId: null | number }[][]>([]);
const scoreImgList = ref([
    score1Img,
    score2Img,
    score3Img,
    score4Img,
    score5Img,
]);
const surveyList = ref<SurveyQuestionEntity[][]>([]);

async function next() {
    if (
        surveyList.value.length - 1 === step.value &&
        answers.value[step.value].length - 1 === asnwerIndex.value
    ) {
        try {
            if (await meta.confirm('저장하시겠습니까?')) {
                $q.loading.show({ message: '저장 중...' });
                const responses: SurveyResponsesEntity[] = [];
                answers.value.forEach((x) => {
                    responses.push(...x);
                });
                const { data } = await meta.api.common.survey.create({
                    userId: 34,
                    responses,
                });
                $q.loading.hide();
                $router.push({
                    path: '/mbti/result',
                    query: {
                        id: data.toString(),
                    },
                });
            }
        } catch (e) {
            $q.loading.hide();
            meta.alert('문제가 발생했습니다. 다시 시도해주세요.');
        }
    } else if (answers.value[step.value].length - 1 === asnwerIndex.value) {
        step.value += 1;
        asnwerIndex.value = 0;
    } else {
        asnwerIndex.value += 1;
    }
}

function prev() {
    if (asnwerIndex.value === 0) {
        step.value -= 1;
        asnwerIndex.value = answers.value[step.value].length - 1;
    } else {
        asnwerIndex.value -= 1;
    }
}

function answerClick(id: number | null | undefined) {
    answers.value[step.value][asnwerIndex.value].answerId = id as number;
}

async function loadQuestionList() {
    $q.loading.show({ message: '문진표를 불러오고 있는 중...' });
    const promiseList = [
        meta.api.common.survey.getQuestionList({
            rowSize: 10000000,
            categoryCode: 6,
            visibilityStatusList: ['K', 'A'],
            sort: ['id'],
        }),
        meta.api.common.survey.getQuestionList({
            rowSize: 10000000,
            categoryCode: 7,
            visibilityStatusList: ['K', 'A'],
            sort: ['id'],
        }),
        meta.api.common.survey.getQuestionList({
            rowSize: 10000000,
            categoryCode: 8,
            visibilityStatusList: ['K', 'A'],
            sort: ['id'],
        }),
        meta.api.common.survey.getQuestionList({
            rowSize: 10000000,
            categoryCode: 9,
            visibilityStatusList: ['K', 'A'],
            sort: ['id'],
        }),
    ];
    (await Promise.all(promiseList)).forEach((x, index) => {
        if (!surveyList.value[index]) {
            surveyList.value.push([]);
        }

        x.data.items.forEach((item) => {
            if (item.surveyAnswerList?.length !== 0) {
                surveyList.value[index].push(item);
                if (!answers.value[index]) {
                    answers.value.push([]);
                }
                answers.value[index].push({
                    questionId: item.id as number,
                    answerId: null,
                });
            }
        });
    });
    $q.loading.hide();
}

loadQuestionList();
</script>

<style></style>
