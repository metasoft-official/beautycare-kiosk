import { RouteRecordRaw } from 'vue-router';

const routes: RouteRecordRaw[] = [
    {
        path: '/',
        redirect: '/intro',
        component: () => import('layouts/MainLayout.vue'),
        children: [
            {
                path: 'mbti',
                redirect: 'mbti/diagnosis',
            },
            {
                path: 'mbti/diagnosis',
                component: () => import('pages/mbti/diagnosis/MainView.vue'),
            },
            {
                path: 'mbti/survey',
                component: () => import('pages/mbti/survey/MainView.vue'),
            },
            {
                path: 'mbti/result',
                component: () => import('pages/mbti/result/MainView.vue'),
            },
            {
                path: 'disease',
                redirect: 'disease/diagnosis',
            },
            {
                path: 'disease/diagnosis',
                component: () => import('pages/disease/diagnosis/MainView.vue'),
            },
            {
                path: 'disease/result',
                component: () => import('pages/disease/result/MainView.vue'),
            },
            {
                path: 'disease/detail',
                component: () => import('pages/disease/detail/MainView.vue'),
            },
            {
                path: 'again',
                component: () => import('pages/again/MainView.vue'),
            },
        ],
    },
    {
        path: '/',
        redirect: '/intro',
        component: () => import('layouts/BlankLayout.vue'),
        children: [
            {
                path: 'intro',
                component: () => import('pages/intro/MainView.vue'),
            },
            {
                path: 'camera',
                component: () => import('pages/camera/MainView.vue'),
            },
        ],
    },
    {
        path: '/',
        redirect: '/intro',
        component: () => import('layouts/HomeLayout.vue'),
        children: [
            {
                path: 'home',
                component: () => import('pages/home/MainView.vue'),
            },
        ],
    },

    // Always leave this as last one,
    // but you can also remove it
    {
        path: '/:catchAll(.*)*',
        component: () => import('pages/ErrorNotFound.vue'),
    },
];

export default routes;
