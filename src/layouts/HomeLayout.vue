<template>
    <q-layout view="lHh Lpr lFf">
        <q-header
            class="background1"
            style="padding-top: 120px; padding-bottom: 120px"
        >
            <q-toolbar class="flex justify-center items-center">
                <q-img style="width: 700px" :src="logoImg"></q-img>
            </q-toolbar>
        </q-header>

        <q-page-container>
            <router-view />
        </q-page-container>
        <q-footer>
            <q-carousel
                v-model="slide"
                infinite
                autoplay
                animated
                height="220px"
            >
                <q-carousel-slide
                    v-for="(bannerImage, index) in bannerImageList"
                    :key="index"
                    :name="index + 1"
                    :img-src="bannerImage"
                ></q-carousel-slide>
                <!-- <q-carousel-slide :name="1" :img-src="banner1Img" />
                <q-carousel-slide :name="2" :img-src="banner2Img" />
                <q-carousel-slide :name="3" :img-src="banner3Img" /> -->
            </q-carousel>
        </q-footer>
    </q-layout>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import logoImg from '@/assets/logo.png';
// import banner1Img from '@/assets/images/home/banner1.png';
// import banner2Img from '@/assets/images/home/banner2.png';
// import banner3Img from '@/assets/images/home/banner3.png';
import meta from '@/api/meta';

const slide = ref(1);

const bannerImageList = ref<string[]>([]);

async function loadBannerList() {
    const { data } = await meta.api.common.banner.getList({
        rowSize: 10000000,
        visibilityStatus: 'T',
        sort: ['order', 'id'],
    });
    const reader = new FileReader();
    reader.onloadend = function () {
        const base64data = reader.result as string;
        bannerImageList.value.push(base64data);
    };

    data.items.forEach(async (item) => {
        const { imageId } = item;
        if (imageId) {
            const { data: blob } = await meta.api.attachFile.getImage(imageId);
            reader.readAsDataURL(blob);
        }
    });
}

loadBannerList();
</script>
