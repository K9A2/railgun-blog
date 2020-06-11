import {SET_ARCHIVED_ARTICLES,} from './index';
import {getArchivedArticle} from '../api/api';

export const receiveArchivedArticle = (archivedArticle) => ({
  type: SET_ARCHIVED_ARTICLES, archivedArticle,
});

export const fetchArchivedArticle = () => dispatch => {
  getArchivedArticle().then(resp => {
    dispatch(receiveArchivedArticle(resp.data.archivedArticle));
  });
};
