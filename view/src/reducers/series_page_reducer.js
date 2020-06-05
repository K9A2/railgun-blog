import {SET_SERIES_ARTICLE} from '../actions';

const initialState = {
  seriesArticleList: [],
};

export default function seriesPageReducer(state = initialState, action) {
  switch (action.type) {
    case SET_SERIES_ARTICLE: {
      return {
        ...state,
        seriesArticleList: action.seriesArticleList,
      };
    }
    default: {
      return state;
    }
  }
}
