import {
  LOAD_NEXT_PAGE,
  LOAD_PREVIOUS_PAGE,
  RECEIVE_ARTICLE_METADATA_LIST,
  RECEIVE_PUBLIC_ARTICLE_COUNT,
  REQUEST_ARTICLE_METADATA_LIST,
  SET_ARTICLE_PAGE_DETAIL,
  SET_PAGINATION_BUTTON_VISIBILITY,
} from './index';
import {getArticleMetadataByPage, getArticlePageDetail, getPublicArticleCount} from '../api/api';

export const requestArticleMetadataList = (offset, limit) => ({
  type: REQUEST_ARTICLE_METADATA_LIST, offset, limit,
});

export const receiveArticleMetadataList = (offset, metadataList) => ({
  type: RECEIVE_ARTICLE_METADATA_LIST, metadataList, offset,
});

export const fetchArticleMetadataList = (offset, limit) => dispatch => {
  dispatch(requestArticleMetadataList(offset, limit));
  getArticleMetadataByPage(offset, limit)
    .then(resp => {
      dispatch(receiveArticleMetadataList(offset, resp.data.metadataList));
      dispatch(setPaginationButtonVisibility());
    })
};

export const fetchPublicArticleCount = () => dispatch => {
  getPublicArticleCount()
    .then(resp => {
      dispatch(receivePublicArticleCount(resp.data.publicArticleCount));
      dispatch(setPaginationButtonVisibility());
    })
};

export const fetchArticlePageDetail = (slug) => dispatch => {
  getArticlePageDetail(slug)
    .then(resp => {
      dispatch(setArticlePageDetail(resp.data.detail))
    })
};

export const receivePublicArticleCount = (publicArticleCount) => ({
  type: RECEIVE_PUBLIC_ARTICLE_COUNT, publicArticleCount,
});

export const setPaginationButtonVisibility = () => ({
  type: SET_PAGINATION_BUTTON_VISIBILITY
});

export const setArticlePageDetail = (detail) => ({
  type: SET_ARTICLE_PAGE_DETAIL, detail,
});
