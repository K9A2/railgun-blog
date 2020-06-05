import {GET_SERIES_ARTICLE, SET_SERIES_ARTICLE} from './index';
import {getSeriesArticle} from '../api/api';

export const requestSeriesArticle = () => ({
  type: GET_SERIES_ARTICLE,
});

export const receiveSeriesArticle = (seriesArticleList) => ({
  type: SET_SERIES_ARTICLE, seriesArticleList,
});

export const fetchSeriesArticle = () => dispatch => {
  getSeriesArticle().then(resp => {
    dispatch(receiveSeriesArticle(resp.data.seriesArticle));
  });
};


