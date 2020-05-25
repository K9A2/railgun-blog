import {getArticleMetadataPending} from '../reducers/index_list_reducer';
import axios from 'axios';
import {apiBase} from "../constants/params";
import {getArticleMetadataByPageError, getArticleMetadataByPageSuccess} from "../actions/article_metadata";

export const getArticleMetadataByPage = (offset, limit) => {
  return dispatch => {
    dispatch(getArticleMetadataPending);
    axios.get(`${apiBase}/article/metadata`, {
      'offset': offset, 'limit': limit,
    }).then(resp => {
      dispatch(getArticleMetadataByPageSuccess(resp.metadataList));
    }).catch(err => {
      dispatch(getArticleMetadataByPageError(err));
    });
  };
};
