<template>
    <div :class="classes()">
        <slot></slot>
    </div>
</template>

<script setup lang="ts">
import { breakpointProps, offsetProps, orderProps } from '@/props/CColProps';

const propMap = {
    col: Object.keys(breakpointProps),
    offset: Object.keys(offsetProps),
    order: Object.keys(orderProps),
};

function breakpointClass(
    type: keyof typeof propMap,
    prop: string,
    val: boolean | string | number
) {
    let className = type;
    if (val == null || val === false) {
        return undefined;
    }
    if (prop) {
        const breakpoint = prop.replace(type, '');
        className += `-${breakpoint}`;
    }
    // Handling the boolean style prop when accepting [Boolean, String, Number]
    // means Vue will not convert <v-col sm></v-col> to sm: true for us.
    // Since the default is false, an empty string indicates the prop's presence.
    if (type === 'col' && (val === '' || val === true)) {
        // .c-col-md
        return className.toLowerCase();
    }
    // .order-md-6
    className += `-${val}`;
    return className.toLowerCase();
}

const props = defineProps({
    cols: {
        type: [Boolean, String, Number],
        default: false,
    },
    ...breakpointProps,
    offset: {
        type: [String, Number],
        default: null,
    },
    ...offsetProps,
    order: {
        type: [String, Number],
        default: null,
    },
    ...orderProps,
    alignSelf: {
        type: String,
        default: null,
        validator: (str: string) =>
            ['auto', 'start', 'end', 'center', 'baseline', 'stretch'].includes(
                str
            ),
    },
    tag: {
        type: String,
        default: 'div',
    },
});

function classes() {
    const classList: string[] = [];
    let type: keyof typeof propMap;
    for (type in propMap) {
        propMap[type].forEach((prop) => {
            const value: string | number | boolean = (props as never)[prop];
            const className = breakpointClass(type, prop, value);
            if (className) classList.push(className);
        });

        const hasColClasses = classList.some((className) =>
            className.startsWith('c-col-')
        );
        if (!hasColClasses || !props.cols) classList.push('c-col');
        if (props.cols) classList.push(`c-col-${props.cols}`);
        if (props.offset) classList.push(`offset-${props.offset}`);
        if (props.order) classList.push(`order-${props.order}`);
        if (props.alignSelf) classList.push(`align-self-${props.alignSelf}`);
        return classList;
    }
}
</script>
