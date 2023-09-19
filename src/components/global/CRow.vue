<template>
    <div :class="classes()">
        <slot></slot>
    </div>
</template>

<script setup lang="ts">
import {
    alignProps,
    alignContentProps,
    alignContentValidator,
    alignValidator,
    justifyProps,
    justifyValidator,
} from '@/props/CRowProps';

const propMap = {
    align: Object.keys(alignProps),
    justify: Object.keys(justifyProps),
    alignContent: Object.keys(alignContentProps),
};

const classMap = {
    align: 'align',
    justify: 'justify',
    alignContent: 'align-content',
};

function breakpointClass(
    type: keyof typeof propMap,
    prop: string,
    val: string
) {
    let className = classMap[type];
    if (val == null) {
        return undefined;
    }
    if (prop) {
        // alignSm -> Sm
        const breakpoint = prop.replace(type, '');
        className += `-${breakpoint}`;
    }
    // .align-items-sm-center
    className += `-${val}`;
    return className.toLowerCase();
}

const props = defineProps({
    tag: {
        type: String,
        default: 'div',
    },
    dense: Boolean,
    noGutters: Boolean,
    align: {
        type: String,
        default: null,
        validator: alignValidator,
    },
    ...alignProps,
    justify: {
        type: String,
        default: null,
        validator: justifyValidator,
    },
    ...justifyProps,
    alignContent: {
        type: String,
        default: null,
        validator: alignContentValidator,
    },
    ...alignContentProps,
});

function classes() {
    const classList: string[] = ['c-row'];
    // Loop through `align`, `justify`, `alignContent` breakpoint props
    let type: keyof typeof propMap;
    for (type in propMap) {
        propMap[type].forEach((prop) => {
            const value: string | number | boolean = (props as never)[prop];
            const className = breakpointClass(type, prop, value);
            if (className) classList.push(className);
        });
    }
    if (props.noGutters) classList.push('no-gutters');
    if (props.dense) classList.push('c-row--dense');
    if (props.align) classList.push(`align-${props.align}`);
    if (props.justify) classList.push(`justify-${props.justify}`);
    if (props.alignContent)
        classList.push(`align-content-${props.alignContent}`);

    return classList;
}
</script>
