/* eslint-disable */
import { ComponentConstructor, QInputProps, QTableProps } from 'quasar';
import { ComponentPublicInstance, VNode } from 'vue';

// declare global {
//     interface Window {}
// }

export interface CRowProps {
    tag?: string | undefined;
    vertical?: boolean | undefined;
    dense?: boolean | undefined;
    noGutters?: boolean | undefined;
    align?: 'start' | 'end' | 'center' | 'baseline' | 'stretch' | undefined;
    justify?: 'start' | 'end' | 'center' | 'between' | 'around' | undefined;
    alignContent?:
        | 'start'
        | 'end'
        | 'center'
        | 'space-between'
        | 'space-around'
        | 'stretch'
        | undefined;
    alignSm?: 'start' | 'end' | 'center' | 'baseline' | 'stretch' | undefined;
    justifySm?:
        | 'start'
        | 'end'
        | 'center'
        | 'space-between'
        | 'space-around'
        | undefined;
    alignContentSm?:
        | 'start'
        | 'end'
        | 'center'
        | 'space-between'
        | 'space-around'
        | 'stretch'
        | undefined;
    alignMd?: 'start' | 'end' | 'center' | 'baseline' | 'stretch' | undefined;
    justifyMd?:
        | 'start'
        | 'end'
        | 'center'
        | 'space-between'
        | 'space-around'
        | undefined;
    alignContentMd?:
        | 'start'
        | 'end'
        | 'center'
        | 'space-between'
        | 'space-around'
        | 'stretch'
        | undefined;
    alignLg?: 'start' | 'end' | 'center' | 'baseline' | 'stretch' | undefined;
    justifyLg?:
        | 'start'
        | 'end'
        | 'center'
        | 'space-between'
        | 'space-around'
        | undefined;
    alignContentLg?:
        | 'start'
        | 'end'
        | 'center'
        | 'space-between'
        | 'space-around'
        | 'stretch'
        | undefined;
    alignXl?: 'start' | 'end' | 'center' | 'baseline' | 'stretch' | undefined;
    justifyXl?:
        | 'start'
        | 'end'
        | 'center'
        | 'space-between'
        | 'space-around'
        | undefined;
    alignContentXl?:
        | 'start'
        | 'end'
        | 'center'
        | 'space-between'
        | 'space-around'
        | 'stretch'
        | undefined;
}

export interface CColProps {
    tag?: string | undefined;
    cols?: boolean | string | number | undefined;
    offset?: string | number | undefined;
    order?: string | number | undefined;
    colSm?: boolean | string | number | undefined;
    offsetSm?: string | number | undefined;
    orderSm?: string | number | undefined;
    colMd?: boolean | string | number | undefined;
    offsetMd?: string | number | undefined;
    orderMd?: string | number | undefined;
    colLg?: boolean | string | number | undefined;
    offsetLg?: string | number | undefined;
    orderLg?: string | number | undefined;
    colXl?: boolean | string | number | undefined;
    offsetXl?: string | number | undefined;
    orderXl?: string | number | undefined;
    alignSelf?:
        | 'auto'
        | 'start'
        | 'end'
        | 'center'
        | 'baseline'
        | 'stretch'
        | undefined;
}

export interface PageRequest {
    page?: number;
    rowSize?: number;
    pageSize?: number;
    isCount?: boolean;
    sort?: string[];
}

export interface PageResponse<T> {
    hasNext: boolean;
    hasPrevious: boolean;
    isFirst: boolean;
    isLast: boolean;
    items: T[];
    page: number;
    pageEnd: number;
    pageSize: number;
    pageStart: number;
    rowEnd: number;
    rowSize: number;
    rowStart: number;
    totalPages: number;
    totalRows: number;
}

export interface IntegratedAttachFileDto {
    integratedAttachFileNum?: number | null;
    attachFileTypeCode?: number | null;
    originFileName?: string | null;
    saveFileName?: string | null;
    fileSize?: number | null;
    filePath?: string | null;
    fileExtension?: string | null;
    createdUserNum?: number | null;
    createDate?: string | null;
    modifiedUserNum?: number | null;
    modifyDate?: string | null;
}

export interface IntegratedAttachFileEntity extends IntegratedAttachFileDto {
    fileType?: string | null;
}

export interface BannerKioskDto {
    id?: number | null;
    title?: string | null;
    imageId?: number | null;
    visibilityStatus?: string | null;
    order?: number | null;
    createdDate?: string | null;
    lastModifiedDate?: string | null;
}

export interface BannerKioskEntity extends BannerKioskDto {
    image?: IntegratedAttachFileEntity | null;
}

export interface BannerKioskParamDto extends PageRequest {
    title?: string | null;
    imageId?: number | null;
    visibilityStatus?: string | null;
}

export interface AdvertisementKioskDto {
    id?: number | null;
    title?: string | null;
    imageId?: number | null;
    visibilityStatus?: string | null;
    order?: number | null;
    createdDate?: string | null;
    lastModifiedDate?: string | null;
}

export interface AdvertisementKioskEntity extends AdvertisementKioskDto {
    image?: IntegratedAttachFileEntity | null;
}

export interface AdvertisementKioskParamDto extends PageRequest {
    title?: string | null;
    imageId?: number | null;
    visibilityStatus?: string | null;
}

export interface DiseaseDto {
    id?: number | null;
    name?: String | null;
    nameEng?: String | null;
    diseaseImageId?: number | null;
    symptoms?: String | null;
    cause?: String | null;
    test?: String | null;
    treatment?: String | null;
    prevention?: String | null;
    clinicImageId?: number | null;
    visibilityStatus?: String | null;
    createdDate?: String | null;
    lastModifiedDate?: String | null;
}

export interface DiseaseEntity extends DiseaseDto {
    diseaseImage?: IntegratedAttachFileEntity | null;
    clinicImage?: IntegratedAttachFileEntity | null;
}

export interface DiseaseParamDto extends PageRequest {
    name?: string | null;
    nameLike?: string | null;
}

export interface UserDiseaseDto {
    id?: number | null;
    userId?: number | null;
    imageId?: number | null;
    image?: File | null;
    topk1Label?: string | null;
    topk1Id?: number | null;
    topk1Value?: number | null;
    topk2Label?: string | null;
    topk2Id?: number | null;
    topk2Value?: number | null;
    topk3Label?: string | null;
    topk3Id?: number | null;
    topk3Value?: number | null;
    createdDate?: string | null;
    lastModifiedDate?: string | null;
}

export interface UserDiseaseEntity extends UserDiseaseDto {
    topk1Disease?: DiseaseEntity | null;
    topk1DiseaseImage?: IntegratedAttachFileEntity | null;
    topk2Disease?: DiseaseEntity | null;
    topk2DiseaseImage?: IntegratedAttachFileEntity | null;
    topk3Disease?: DiseaseEntity | null;
    topk3DiseaseImage?: IntegratedAttachFileEntity | null;
}

export interface UserDiseaseParamDto extends PageRequest {
    userId?: number | null;
}

export interface SurveyAnswerDto {
    id?: number | null;
    questionId?: number | null;
    answer?: string | null;
    order?: number | null;
    score?: number | null;
}

export type SurveyAnswerEntity = SurveyAnswerDto;

export interface SurveyAnswerParamDto extends PageRequest {
    questionId?: number | null;
}

export interface SurveyQuestionDto {
    id?: number | null;
    categoryCode?: number | null;
    question?: string | null;
    order?: number | null;
    visibilityStatus?: string | null;
    surveyAnswerList?: SurveyAnswerEntity[] | null;
}

export interface SurveyQuestionEntity extends SurveyQuestionDto {
    visibilityStatusName?: string | null;
}

export interface SurveyQuestionParamDto extends PageRequest {
    categoryCode?: number | null;
    visibilityStatusList?: string[] | null;
}

export interface SurveyDto {
    id?: number | null;
    userId?: number | null;
    createdDate?: String | null;
    lastModifiedDate?: String | null;
    responses?: SurveyResponsesEntity[] | null;
}

export interface SurveyEntity extends SurveyDto {
    imageId?: number | null;
    image?: IntegratedAttachFileEntity | null;
}

export interface SurveyParamDto extends PageRequest {
    id?: number | null;
    userId?: number | null;
    createdDate?: String | null;
    lastModifiedDate?: String | null;
}

export interface SurveyResponsesDto {
    id?: number | null;
    surveyId?: number | null;
    questionId?: number | null;
    answerId?: number | null;
}

export interface SurveyResponsesEntity extends SurveyResponsesDto {
    id?: number | null;
    surveyId?: number | null;
    questionId?: number | null;
    answerId?: number | null;
}

export interface SurveyResponsesParamDto extends PageRequest {
    id?: number | null;
    surveyId?: number | null;
    questionId?: number | null;
    answerId?: number | null;
}

export interface UserSkinMbtiDto {
    id?: number | null;
    userId?: number | null;
    surveyId?: number | null;
    skinMbtiId?: number | null;
    createdDate?: String | null;
    lastModifiedDate?: String | null;
}

export interface UserSkinMbtiEntity extends UserSkinMbtiDto {
    category1Score?: number | null;
    category1Type?: String | null;
    category2Score?: number | null;
    category2Type?: String | null;
    category3Score?: number | null;
    category3Type?: String | null;
    category4Score?: number | null;
    category4Type?: String | null;
    skinMbtiName?: String | null;
    descriptionEng?: String | null;
}

export interface UserSkinMbtiParamDto extends PageRequest {
    id?: number | null;
    userId?: number | null;
    surveyId?: number | null;
    skinMbtiId?: number | null;
    createdDate?: String | null;
    lastModifiedDate?: String | null;
}

export interface SkinMbtiDto {
    id?: number | null;
    skinMbtiName?: string | null;
    descriptionEng?: string | null;
    subtitle?: string | null;
    description?: string | null;
    skinTypeCode?: number | null;
    visibilityStatus?: string | null;
    createdDate?: string | null;
    lastModifiedDate?: string | null;
}

export interface SkinMbtiEntity extends SkinMbtiDto {
    skinType?: string | null;
    skincareProductList?: SkinMbtiSkincareProductEntity[] | null;
    keywordList?: SkinMbtiKeywordEntity[] | null;
    caretipList?: SkinMbtiCaretipEntity[] | null;
}

export interface SkinMbtiParamDto extends PageRequest {
    id?: number | null;
    skinMbtiName?: string | null;
    descriptionEng?: string | null;
    subtitle?: string | null;
    description?: string | null;
    skinTypeCode?: number | null;
    visibilityStatus?: string | null;
}

export interface SkinMbtiSkincareProductDto {
    id?: number | null;
    skinMbtiId?: number | null;
    skincareCategoryId?: number | null;
    skincareProductId?: number | null;
    skincareProductOrder?: number | null;
}

export interface SkinMbtiSkincareProductEntity
    extends SkinMbtiSkincareProductDto {
    skincareProduct?: SkincareProductEntity | null;
}

export interface SkinMbtiSkincareProductParamDto extends PageRequest {
    id?: number | null;
    skinMbtiId?: number | null;
    skincareCategoryId?: number | null;
    skincareProductId?: number | null;
    skincareProductOrder?: number | null;
}

export interface SkinMbtiKeywordDto {
    id?: number | null;
    skinMbtiId?: number | null;
    keywordCode?: number | null;
}

export interface SkinMbtiKeywordEntity extends SkinMbtiKeywordDto {
    keyword?: string | null;
}

export interface SkinMbtiKeywordParamDto extends PageRequest {
    id?: number | null;
    skinMbtiId?: number | null;
    keywordCode?: number | null;
}

export interface SkinMbtiCaretipDto {
    id?: number | null;
    skinMbtiId?: number | null;
    content?: string | null;
    sortOrder?: number | null;
    createdDate?: string | null;
    lastModifiedDate?: string | null;
}

export type SkinMbtiCaretipEntity = SkinMbtiCaretipDto;

export interface SkinMbtiCaretipParamDto extends PageRequest {
    id?: number | null;
    skinMbtiId?: number | null;
    content?: string | null;
    sortOrder?: number | null;
    createdDate?: string | null;
    lastModifiedDate?: string | null;
}

export interface SkincareProductDto {
    id?: number | null;
    name?: string | null;
    imageId?: number | null;
    price?: number | null;
    popularityOrder?: number | null;
    description?: string | null;
    skintypeCategoryId?: number | null;
    productLineCategoryId?: number | null;
    productUrl?: string | null;
}

export interface SkincareProductEntity extends SkinMbtiCaretipDto {
    image?: IntegratedAttachFileEntity | null;
    categoryName?: string | null;
}

export interface SkincareProductParamDto extends PageRequest {
    id?: number | null;
    name?: string | null;
    imageId?: number | null;
    price?: number | null;
    popularityOrder?: number | null;
    description?: string | null;
    skintypeCategoryId?: number | null;
    productLineCategoryId?: number | null;
    productUrl?: string | null;
    nameLike?: string | null;
}
