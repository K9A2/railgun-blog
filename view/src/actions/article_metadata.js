import {
  GET_ARTICLE_METADATA_BY_PAGE,
} from './index';

export const getArticleMetadataByPage = (offset, limit) => ({
  type: GET_ARTICLE_METADATA_BY_PAGE, offset, limit,
})
