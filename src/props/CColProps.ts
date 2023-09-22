import { Prop } from 'vue';

function upperFirst(str: string): string {
    return str.charAt(0).toUpperCase() + str.slice(1);
}

const breakpoints = ['sm', 'md', 'lg', 'xl'];

export const breakpointProps = (() => {
    return breakpoints.reduce((props, val) => {
        props[val] = {
            type: [String, Number, Boolean],
            default: false,
        };
        return props;
    }, {} as { [key: string]: Prop<string | boolean | number> });
})();

export const offsetProps = (() => {
    return breakpoints.reduce((props, val) => {
        props['offset' + upperFirst(val)] = {
            type: [String, Number],
            default: null,
        };
        return props;
    }, {} as { [key: string]: Prop<string | number> });
})();

export const orderProps = (() => {
    return breakpoints.reduce((props, val) => {
        props['order' + upperFirst(val)] = {
            type: [String, Number],
            default: null,
        };
        return props;
    }, {} as { [key: string]: Prop<string | number> });
})();
