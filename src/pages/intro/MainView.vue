<template>
    <q-page class="row items-center justify-evenly" @click="$router.push('/home')">
        <div :style="`z-index: 1; width: ${$q.screen.width}px;  height: ${$q.screen.height}px; opacity: 0; position: absolute`"></div>
        <template v-if="video.src">
            <video-player :src="video" :autoplay="'muted'" :width="$q.screen.width" :height="$q.screen.height" />
        </template>
    </q-page>
</template>

<script setup lang="ts">
import { VideoPlayer } from '@videojs-player/vue';
import 'video.js/dist/video-js.css';
import { useQuasar } from 'quasar';
import { useRouter } from 'vue-router';
import meta from '@/api/meta';
import { ref } from 'vue';

const $q = useQuasar();
const $router = useRouter();

const video = ref<{ type: string; src: string }>({ type: '', src: '' });

async function loadVideo() {
    const { data } = await meta.api.common.video.getList({
        rowSize: 1,
        visibilityStatus: 'T',
        sort: ['order,desc', 'id,desc'],
    });

    if (data.items.length > 0) {
        const { imageId } = data.items[0];
        if (imageId) {
            video.value = { type: 'video/mp4', src: `${process.env.APP_URL}api/video/${imageId}` };
        }
    }
}

loadVideo();
</script>

<style></style>
