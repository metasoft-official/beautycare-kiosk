import axios, { AxiosHeaderValue, AxiosProgressEvent, AxiosPromise } from 'axios';
import { useAppStore } from '@/stores/store';
import {
    PageResponse,
    BannerKioskParamDto,
    BannerKioskEntity,
    AdvertisementKioskParamDto,
    AdvertisementKioskEntity,
    UserDiseaseParamDto,
    UserDiseaseEntity,
    UserDiseaseDto,
    DiseaseEntity,
    SurveyQuestionEntity,
    SurveyQuestionParamDto,
    SurveyDto,
    UserSkinMbtiEntity,
    SkinMbtiEntity,
} from '@/types/global';

type ErrorWithMessage = {
    message: string;
};

const meta = {
    version: '1.0.0',
    async onAxiosUploadProgress(e: AxiosProgressEvent) {
        const calculatyBytesUnitCapacityToBigCapacityUnit = (Bytes: number) => {
            let calculateNum = Bytes;
            if (calculateNum / 1024 > 1) {
                calculateNum /= 1024;
                if (calculateNum / 1024 > 1) {
                    calculateNum /= 1024;
                    if (calculateNum / 1024 > 1) {
                        calculateNum /= 1024;
                        if (calculateNum / 1024 > 1) {
                            calculateNum /= 1024;
                            if (calculateNum / 1024 > 1) {
                                calculateNum /= 1024;
                                if (calculateNum / 1024 > 1) {
                                    calculateNum /= 1024;
                                    return `${calculateNum.toFixed(2)}EB`;
                                }
                                return `${calculateNum.toFixed(2)}PB`;
                            }
                            return `${calculateNum.toFixed(2)}TB`;
                        }
                        return `${calculateNum.toFixed(2)}GB`;
                    }
                    return `${calculateNum.toFixed(2)}MB`;
                }
                return `${calculateNum.toFixed(2)}KB`;
            }
            return `${calculateNum.toFixed(2)}B`;
        };

        if (e.total !== undefined && e.total != null && e.total > 1024 * 1024) {
            meta.config.uploadLoadingOneTimeUse();
        }

        if (useAppStore().getLoadingDetailNeed) {
            const myProgressData = {
                loaded: e.loaded,
                total: e.total,
                timeStamp: e.rate,
            };

            useAppStore().setLoadingPercentConfig({ ...myProgressData });
            if (e.total) {
                useAppStore().setLoadingPercentValue((e.loaded / e.total) * 100);
            }

            const configData = useAppStore().getLoadingPercentConfig;

            const previousConfigData = useAppStore().getLoadingPercentPreviouseConfig;

            let totalSumSpeed = 0;
            let totalSpeedValueCount = 0;

            for (let i = 1; i < previousConfigData.length; i += 1) {
                const currentCalSpeed =
                    (previousConfigData[i].loaded - previousConfigData[i - 1].loaded) /
                    (((previousConfigData[i].timeStamp ?? 0) - (previousConfigData[i - 1].timeStamp ?? 0)) / 1000);
                totalSumSpeed += currentCalSpeed;
                totalSpeedValueCount += 1;
            }

            const currentTransferSpeed =
                totalSumSpeed !== undefined &&
                totalSumSpeed != null &&
                totalSpeedValueCount !== undefined &&
                totalSpeedValueCount != null &&
                totalSpeedValueCount > 0
                    ? `${calculatyBytesUnitCapacityToBigCapacityUnit(totalSumSpeed / totalSpeedValueCount)}/s`
                    : '';

            useAppStore().setLoadingPercentConfigSpeed(currentTransferSpeed);

            const convertToLoaded =
                configData.loaded !== undefined && configData.loaded != null ? calculatyBytesUnitCapacityToBigCapacityUnit(configData.loaded) : '';

            const convertToTotal =
                configData.total !== undefined && configData.total != null ? calculatyBytesUnitCapacityToBigCapacityUnit(configData.total) : '';

            const currentTransferStatus = convertToLoaded !== '' && convertToTotal !== '' ? `${convertToLoaded} / ${convertToTotal}` : '';

            useAppStore().setLoadingPercentConfigStatus(currentTransferStatus);
        }
    },
    alert(message: string) {
        return new Promise<void>((resolve) => {
            useAppStore().setAlert({
                value: true,
                message,
                callback() {
                    resolve();
                },
            });
        });
    },
    confirm(message: string, oktext = '예', canceltext = '아니오') {
        return new Promise((resolve) => {
            useAppStore().setConfirm({
                value: true,
                message,
                oktext,
                canceltext,
                callback(result: unknown) {
                    resolve(result);
                },
            });
        });
    },
    auth: {
        async api(headers: { Authorization?: AxiosHeaderValue } = {}) {
            await axios({
                url: '/api',
                method: 'get',
                headers: Object.keys(headers).length > 0 ? headers : undefined,
            });
        },
    },
    config: {
        curruntLoadingApi: 0,
        loadingHide() {
            useAppStore().setLoading(false);
            useAppStore().setLoadingPercentShow(false);
            useAppStore().setLoadingPercentValue(0.0);
        },
        loadingShow() {
            useAppStore().setLoading(true);
        },
        uploadLoadingOneTimeUse() {
            useAppStore().setLoadingPercentValue(0.0);
            useAppStore().setLoadingPercentShow(true);
        },
        // getCodeNameById(id: number) {
        //     const row = useAppStore().getCodeList.find((e) => e.id === id);
        //     if (row !== undefined) {
        //         return row.name;
        //     }

        //     return null;
        // },
        // getCodeValueById(id: number) {
        //     const row = useAppStore().getCodeList.find((e) => e.id === id);
        //     if (row !== undefined) {
        //         return row.value;
        //     }

        //     return null;
        // },
        // getCodeDescriptionById(id: number) {
        //     const row = useAppStore().getCodeList.find((e) => e.id === id);
        //     if (row !== undefined) {
        //         return row.description;
        //     }

        //     return null;
        // },
        // getCodeRowById(id: number) {
        //     return useAppStore().getCodeList.find((e) => e.id === id);
        // },
        // getCodeListByParentId(parentId: number) {
        //     return useAppStore().getCodeList.filter(
        //         (e) => e.parentId === parentId
        //     );
        // },
        // getCodeListByParentName(parentName: string) {
        //     const parentRow = useAppStore().getCodeList.find(
        //         (e) => e.name === parentName
        //     );

        //     if (parentRow !== undefined) {
        //         return useAppStore().getCodeList.filter(
        //             (e) => e.parentId === parentRow.id
        //         );
        //     }
        //     return null;
        // },
    },
    api: {
        attachFile: {
            getVideo(id: number) {
                return axios({
                    url: `/api/video/${id}`,
                    method: 'get',
                    responseType: 'arraybuffer',
                    headers: {
                        Range: 'bytes=0-999999999',
                    },
                });
            },
            getImage(id: number) {
                return axios({
                    url: `/api/image/${id}`,
                    responseType: 'blob',
                    method: 'get',
                });
            },
        },
        common: {
            userDiseases: {
                // getUserDisease(params: object): AxiosPromise<PageResponse<entity>>
                getList(params: UserDiseaseParamDto): AxiosPromise<PageResponse<UserDiseaseEntity>> {
                    return axios({
                        url: '/api/common/user-diseases',
                        method: 'get',
                        params,
                    });
                },
                get(id: number): AxiosPromise<UserDiseaseEntity> {
                    return axios({
                        url: `/api/common/user-diseases/${id}`,
                        method: 'get',
                    });
                },
                // createUserDisease(data: dto): AxiosPromise<int> {
                create(data: UserDiseaseDto): AxiosPromise<number> {
                    return axios({
                        url: '/api/common/user-diseases',
                        method: 'post',
                        data,
                    });
                },
                diagnosisImage(id: number, data: FormData): AxiosPromise<number> {
                    return axios({
                        url: `/api/common/user-diseases/attach-file/${id}`,
                        method: 'put',
                        data,
                    });
                },
            },
            diseases: {
                get(id: number): AxiosPromise<DiseaseEntity> {
                    return axios({
                        url: `/api/common/diseases/${id}`,
                        method: 'get',
                    });
                },
            },
            survey: {
                getQuestionList(params: SurveyQuestionParamDto): AxiosPromise<PageResponse<SurveyQuestionEntity>> {
                    return axios({
                        url: '/api/common/survey-questions',
                        method: 'get',
                        params,
                    });
                },
                create(data: SurveyDto): AxiosPromise<PageResponse<number>> {
                    return axios({
                        url: '/api/common/surveys',
                        method: 'post',
                        data,
                    });
                },
            },
            integratedAttachFiles: {
                create(data: object) {
                    return axios({ url: '/api/common/integrated-attach-files', method: 'post', data });
                },
            },
            userSkinMbti: {
                get(id: number): AxiosPromise<UserSkinMbtiEntity> {
                    return axios({
                        url: `/api/common/user-skin-mbtis/${id}`,
                        method: 'get',
                    });
                },
            },
            skinMbti: {
                get(id: number): AxiosPromise<SkinMbtiEntity> {
                    return axios({
                        url: `/api/common/skin-mbtis/${id}`,
                        method: 'get',
                    });
                },
            },
            banner: {
                getList(params: BannerKioskParamDto): AxiosPromise<PageResponse<BannerKioskEntity>> {
                    return axios({
                        url: '/api/common/banner-kiosks',
                        method: 'get',
                        params,
                    });
                },
            },
            video: {
                getList(params: AdvertisementKioskParamDto): AxiosPromise<PageResponse<AdvertisementKioskEntity>> {
                    return axios({
                        url: '/api/common/advertisement-kiosks',
                        method: 'get',
                        params,
                    });
                },
            },
        },
    },
    util: {
        sort(sortBy: string[], sortDesc: boolean[]) {
            const str = [];
            if (sortBy.length > 0 && sortDesc.length > 0) {
                for (let i = 0; i < sortBy.length; i += 1) {
                    if (sortBy[i]) str.push(`${sortBy[i]},${sortDesc[i] ? 'desc' : 'asc'}`);
                }
            }
            return str;
        },
    },
    error: {
        isErrorWithMessage(error: unknown): error is ErrorWithMessage {
            return typeof error === 'object' && error !== null && 'message' in error && typeof (error as Record<string, unknown>).message === 'string';
        },
        toErrorWithMessage(maybeError: unknown): ErrorWithMessage {
            if (meta.error.isErrorWithMessage(maybeError)) return maybeError;

            try {
                return new Error(JSON.stringify(maybeError));
            } catch {
                return new Error(String(maybeError));
            }
        },
        getErrorMessage(error: unknown) {
            return meta.error.toErrorWithMessage(error).message;
        },
    },
};

export default meta;
