import { boot } from 'quasar/wrappers';
import CCol from '@/components/global/CCol.vue';
import CRow from '@/components/global/CRow.vue';
import CAlert from '@/components/global/CAlert.vue';
import CConfirm from '@/components/global/CConfirm.vue';
import VueCameraLib from 'vue-camera-lib';
import VueVideoPlayer from '@videojs-player/vue';
import 'video.js/dist/video-js.css';
import { CColProps, CRowProps } from '@/types/global';
import { GlobalComponentConstructor } from 'quasar';

declare module '@vue/runtime-core' {
    interface GlobalComponents {
        CRow: GlobalComponentConstructor<CRowProps>;
        CCol: GlobalComponentConstructor<CColProps>;
    }
}

export default boot(async ({ app }) => {
    app.use(VueVideoPlayer);
    app.component('c-col', CCol).component('c-row', CRow).component('c-alert', CAlert).component('c-confirm', CConfirm).component(VueCameraLib);
});
