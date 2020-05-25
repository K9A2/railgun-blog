import {
  LOAD_NEXT_PAGE,
  LOAD_PREVIOUS_PAGE,
  RECEIVE_ARTICLE_METADATA_LIST,
  REQUEST_ARTICLE_METADATA_LIST,
} from './index';
import {getArticleMetadataByPage} from '../api';

export const requestArticleMetadataList = (offset, limit) => ({
  type: REQUEST_ARTICLE_METADATA_LIST, offset, limit,
});

export const receiveArticleMetadataList = (offset, metadataList) => ({
  type: RECEIVE_ARTICLE_METADATA_LIST, metadataList, offset,
});

export const fetchArticleMetadataList = (offset, limit) => dispatch => {
  dispatch(requestArticleMetadataList(offset, limit));
  return getArticleMetadataByPage(offset, limit)
    .then(resp => dispatch(receiveArticleMetadataList(offset, resp.data.metadataList)))
};

export const loadPreviousPage = (offset) => ({
  type: LOAD_PREVIOUS_PAGE, offset,
});

export const loadNextPage = (offset) => ({
  type: LOAD_NEXT_PAGE, offset,
});
