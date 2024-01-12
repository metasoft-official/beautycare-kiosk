<template>
    <q-page class="row items-center justify-evenly" @click="$router.push('/home')">
        <div :style="`z-index: 1; width: ${$q.screen.width}px;  height: ${$q.screen.height}px; opacity: 0; position: absolute`"></div>
        <template v-if="video.src">
            <video-player :src="video" :autoplay="'muted'" loop :width="$q.screen.width" :height="$q.screen.height" />
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
    video.value = { type: 'video/mp4', src: 'intro.mp4' };
}

loadVideo();
</script>

<style></style>
