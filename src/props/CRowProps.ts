import { Prop } from 'vue';

const breakpoints = ['sm', 'md', 'lg', 'xl'];

const ALIGNMENT = ['start', 'end', 'center'];

function upperFirst(str: string): string {
    return str.charAt(0).toUpperCase() + str.slice(1);
}

function makeProps(prefix: string, def: () => Prop<string>) {
    return breakpoints.reduce((props, val) => {
        props[prefix + upperFirst(val)] = def();
        return props;
    }, {} as { [key: string]: Prop<string> });
}

export const alignValidator = (str: string) =>
    [...ALIGNMENT, 'baseline', 'stretch'].includes(str);
export const alignProps = makeProps('align', () => ({
    type: String,
    default: null,
    validator: alignValidator,
}));

export const justifyValidator = (str: string) =>
    [...ALIGNMENT, 'between', 'space-around'].includes(str);
export const justifyProps = makeProps('justify', () => ({
    type: String,
    default: null,
    validator: justifyValidator,
}));

export const alignContentValidator = (str: string) =>
    [...ALIGNMENT, 'between', 'space-around', 'stretch'].includes(str);
export const alignContentProps = makeProps('alignContent', () => ({
    type: String,
    default: null,
    validator: alignContentValidator,
}));
