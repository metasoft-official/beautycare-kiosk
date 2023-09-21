// Utilities
import { defineStore } from 'pinia';

export const useAppStore = defineStore('app', {
    state: () => ({
        userAgentSummaryInfo: null as unknown,
        captureBlob: null as null | Blob,
        alert: {
            value: false,
            message: '',
        } as {
            value: boolean;
            message: string;
            callback: () => void;
        },
        confirm: {
            value: false,
            message: '',
            oktext: '확인',
            canceltext: '취소',
        } as {
            value: boolean;
            message: string;
            oktext: string;
            canceltext: string;
            callback: (result: unknown) => void;
        },
        loading: {
            zIndex: 9999,
            overlay: false,
            percent: {
                show: false,
                value: 0.0,
                configJsonData: {} as {
                    loaded: number;
                    total?: number;
                    timeStamp?: number;
                },
                previousConfigJsonData: [] as {
                    loaded: number;
                    timeStamp?: number;
                }[],
                previousDataMaxLength: 100,
                currentTransferSpeed: '',
                currentTransferStatus: '',
            },
        },
    }),
    getters: {
        getLoading: (state) => state.loading,
        getCaptureBlob: (state) => state.captureBlob,
        getUserAgentSummaryInfo: (state) => state.userAgentSummaryInfo,
        getAlert: (state) => state.alert,
        getConfirm: (state) => state.confirm,
        getLoadingDetailNeed: (state) => state.loading.percent.show,
        getLoadingPercentConfig: (state) =>
            state.loading.percent.configJsonData,
        getLoadingPercentPreviouseConfig: (state) =>
            state.loading.percent.previousConfigJsonData,
    },
    actions: {
        setCaptureBlob(payload: null | Blob) {
            this.captureBlob = payload;
        },
        setUserAgentSummaryInfo(payload: unknown) {
            this.userAgentSummaryInfo = payload;
        },
        setAlert(payload: {
            value: boolean;
            message: string;
            callback: () => void;
        }) {
            this.alert = payload;
        },
        setConfirm(payload: {
            value: boolean;
            message: string;
            oktext: string;
            canceltext: string;
            callback: (result: unknown) => void;
        }) {
            this.confirm = payload;
        },
        setLoading(payload: boolean) {
            this.loading.overlay = payload;
        },
        setLoadingPercentShow(payload: boolean) {
            this.loading.percent.show = payload;
        },
        setLoadingPercentValue(payload: number) {
            this.loading.percent.value = payload;
        },
        setLoadingPercentConfig(payload: {
            loaded: number;
            total?: number;
            timeStamp?: number;
        }) {
            this.loading.percent.configJsonData = payload;
            this.loading.percent.previousConfigJsonData.push({
                ...payload,
            });

            const previousDataMaxLength =
                this.loading.percent.previousDataMaxLength;
            const previousDataLength =
                this.loading.percent.previousConfigJsonData.length;
            if (previousDataLength > previousDataMaxLength) {
                this.loading.percent.previousConfigJsonData.splice(
                    0,
                    previousDataLength - previousDataMaxLength
                );
            }
        },
        setLoadingPercentConfigSpeed(payload: string) {
            this.loading.percent.currentTransferSpeed = payload;
        },
        setLoadingPercentConfigStatus(payload: string) {
            this.loading.percent.currentTransferStatus = payload;
        },
    },
});

export const useTimerStore = defineStore('timer', {
    state: () => ({
        timerId: 0 as unknown,
        timeout: 5000, // 일정 시간 (60초) 동안 이벤트 없으면 홈으로 돌아감
    }),
    getters: {},
    actions: {
        startTimer() {
            this.timerId = setTimeout(() => {
                // 타이머 만료 시 홈 페이지로 이동
                this.router.push({ path: '/intro' });
            }, this.timeout);
        },
        resetTimer() {
            clearTimeout(this.timerId as number);
            this.startTimer();
        },
        stopTimer() {
            clearTimeout(this.timerId as number);
        },
    },
});
