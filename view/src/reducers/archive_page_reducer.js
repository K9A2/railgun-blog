import {SET_ARCHIVED_ARTICLES} from '../actions';

const initialState = {
  archivedArticle: [],
};

export default function archive_page_reducer(state = initialState, action) {
  switch (action.type) {
    case SET_ARCHIVED_ARTICLES: {
      return {
        ...state,
        archivedArticle: action.archivedArticle,
      };
    }
    default: {
      return state;
    }
  }
}
