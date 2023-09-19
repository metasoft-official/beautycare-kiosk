import { boot } from 'quasar/wrappers';
import axios, {
    AxiosError,
    AxiosInstance,
    AxiosResponse,
    ParamsSerializerOptions,
} from 'axios';
import Qs from 'qs';
import meta from '@/api/meta';

declare module '@vue/runtime-core' {
    interface ComponentCustomProperties {
        $axios: AxiosInstance;
    }
}

// Be careful when using SSR for cross-request state pollution
// due to creating a Singleton instance here;
// If any client changes this (global) instance, it might be a
// good idea to move this instance creation inside of the
// "export default () => {}" function below (which runs individually
// for each client)
const api = axios.create({ baseURL: 'https://api.example.com' });

export default boot(({ app }) => {
    // for use inside Vue files (Options API) through this.$axios and this.$api
    app.config.globalProperties.$axios = axios;
    // ^ ^ ^ this will allow you to use this.$axios (for Vue Options API form)
    //       so you won't necessarily have to import axios in each vue file

    app.config.globalProperties.$api = api;
    // ^ ^ ^ this will allow you to use this.$api (for Vue Options API form)
    //       so you can easily perform requests against your app's API
    const paramsSerializerOptions: ParamsSerializerOptions = {};
    paramsSerializerOptions.serialize = function paramsSerializer(params) {
        return Qs.stringify(params, { indices: false });
    };
    axios.defaults.paramsSerializer = paramsSerializerOptions;

    axios.defaults.onUploadProgress = meta.onAxiosUploadProgress;

    // 로딩을 할 필요가 없는 url
    const notLoadingUrl = ['/api', '/api/common/codes'];

    // 무한루프에 빠져들게 하지 않게 하기 위한 가장 기초적인 예외에 속하는 API 목록
    const alawaysPermitURL = ['/api'];
    axios.interceptors.request.use(
        (request) => {
            if (
                notLoadingUrl.filter(
                    (e) =>
                        e !== undefined &&
                        e != null &&
                        request != null &&
                        request.url !== undefined &&
                        request.url != null &&
                        e === request.url
                ).length === 0
            ) {
                meta.config.curruntLoadingApi += 1;
                meta.config.loadingShow();
            }
            return request;
        },
        async (error: AxiosError) => {
            const currentApiRequest = error.config;

            if (
                notLoadingUrl.filter(
                    (e: string) =>
                        e !== undefined &&
                        e != null &&
                        currentApiRequest != null &&
                        currentApiRequest.url !== undefined &&
                        currentApiRequest.url != null &&
                        e === currentApiRequest.url
                ).length === 0
            ) {
                if (meta.config.curruntLoadingApi > 0)
                    meta.config.curruntLoadingApi -= 1;
                if (meta.config.curruntLoadingApi <= 0)
                    meta.config.loadingHide();
            }

            return Promise.reject(error);
        }
    );

    // api 요청이 실패할 경우 사용된 토큰에 대해 유효성 검사를 행함
    axios.interceptors.response.use(
        (response: AxiosResponse) => {
            response.config.url;
            if (
                notLoadingUrl.filter(
                    (e: string) =>
                        e !== undefined &&
                        e != null &&
                        response.config.url !== undefined &&
                        response.config.url != null &&
                        e === response.config.url
                ).length === 0
            ) {
                if (meta.config.curruntLoadingApi > 0)
                    meta.config.curruntLoadingApi -= 1;
                if (meta.config.curruntLoadingApi <= 0)
                    meta.config.loadingHide();
            }

            return response;
        },
        async (error: AxiosError) => {
            const currentApiRequest = error.config;

            if (
                notLoadingUrl.filter(
                    (e: string) =>
                        e !== undefined &&
                        e != null &&
                        currentApiRequest != null &&
                        currentApiRequest.url !== undefined &&
                        currentApiRequest.url != null &&
                        e === currentApiRequest.url
                ).length === 0
            ) {
                if (meta.config.curruntLoadingApi > 0)
                    meta.config.curruntLoadingApi -= 1;
                if (meta.config.curruntLoadingApi <= 0)
                    meta.config.loadingHide();
            }

            if (
                alawaysPermitURL.filter(
                    (e: string) =>
                        e !== undefined &&
                        e != null &&
                        error !== undefined &&
                        currentApiRequest != null &&
                        currentApiRequest.url !== undefined &&
                        currentApiRequest.url != null &&
                        e === currentApiRequest.url
                ).length > 0
            ) {
                return Promise.reject(error);
            }

            return Promise.reject(error);
        }
    );
});

export { api };
