<template>
    <q-dialog :model-value="modelValue" @update:model-value="emits('update:model-value', $event)" persistent full-width>
        <q-card style="width: 90% !important">
            <q-card-section class="pa-10 text-header"> 알림 </q-card-section>
            <q-card-section class="text-content px-10 pb-15" style="white-space: pre-line">
                {{ message }}
            </q-card-section>
            <q-card-actions align="center">
                <c-col cols="12">
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
        type: Function as PropType<() => void>,
        default: () => {
            return;
        },
    },
});

function ok() {
    emits('update:model-value', false);
    props.callback();
}

const emits = defineEmits(['update:model-value']);
</script>

<style scoped></style>
