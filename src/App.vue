<template>
    <router-view />
</template>

<script setup lang="ts">
import { watch } from 'vue';
import { storeToRefs } from 'pinia';
import { useQuasar } from 'quasar';
import { useAppStore } from './stores/store';

const appStore = useAppStore();
const { alert, confirm } = storeToRefs(appStore);

const $q = useQuasar();

watch([alert, confirm], (newValues) => {
    const [newAlert, newConfirm] = newValues;
    if (newAlert.value) {
        $q.dialog({
            title: '알림',
            message: newAlert.message,
        }).onDismiss(() => {
            newAlert.callback();
        });
    } else if (newConfirm.value) {
        $q.dialog({
            title: '확인',
            message: newConfirm.message,
            cancel: true,
            persistent: true,
        })
            .onOk(() => {
                newConfirm.callback(true);
            })
            .onCancel(() => {
                newConfirm.callback(false);
            });
    }
});
</script>
