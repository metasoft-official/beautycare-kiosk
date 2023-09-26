<template>
    <q-dialog :model-value="modelValue" @update:model-value="emits('update:model-value', $event)" persistent full-width>
        <q-card style="width: 90% !important">
            <q-card-section class="pa-10 text-header"> 확인 </q-card-section>
            <q-card-section class="text-content px-10 pb-15" style="white-space: pre-line">
                {{ message }}
            </q-card-section>
            <q-card-actions align="center">
                <c-col cols="6">
                    <q-btn class="full-width py-10" style="background-color: white; border: 3px solid var(--c-blue-4); border-radius: 15px" @click="cancel">
                        <div class="text-subtitle1 text-weight-bold text-blue-4">취소</div>
                    </q-btn>
                </c-col>
                <c-col cols="6">
                    <q-btn class="full-width py-10" color="blue-4" style="border-radius: 15px" @click="ok">
                        <div class="text-subtitle1 text-weight-bold text-white" style="padding: 3px">확인</div>
                    </q-btn>
                </c-col>
            </q-card-actions>
        </q-card>
    </q-dialog>
</template>

<script setup lang="ts">
import { PropType } from 'vue';

const props = defineProps({
    modelValue: {
        type: Boolean,
        default: false,
    },
    message: {
        type: String,
        default: '',
    },
    callback: {
        type: Function as PropType<(status: boolean) => void>,
        default: () => {
            return;
        },
    },
});

function ok() {
    emits('update:model-value', false);
    props.callback(true);
}

function cancel() {
    emits('update:model-value', false);
    props.callback(false);
}

const emits = defineEmits(['update:model-value']);
</script>

<style scoped></style>
