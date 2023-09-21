<template>
    <q-layout view="lHh Lpr lFf">
        <q-header
            :class="{
                'bg-white':
                    $router.currentRoute.value.path !== '/mbti/survey' &&
                    $router.currentRoute.value.path !== '/mbti/result',
                'bg-grey-2': $router.currentRoute.value.path === '/mbti/survey',
                transparent: $router.currentRoute.value.path === '/mbti/result',
            }"
        >
            <q-toolbar class="py-10">
                <q-img
                    :src="logoImg"
                    alt="뷰티케어 로고"
                    style="max-width: 400px"
                />
                <q-space></q-space>
                <q-icon
                    size="80px"
                    color="blue-4"
                    name="mdi-home"
                    @click="$router.push('/home')"
                ></q-icon>
            </q-toolbar>
        </q-header>

        <q-page-container
            :class="{
                background2: $router.currentRoute.value.path === '/mbti/result',
            }"
        >
            <router-view />
        </q-page-container>
    </q-layout>
</template>

<script setup lang="ts">
import logoImg from '@/assets/logo.png';
</script>
