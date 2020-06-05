import {SET_ARTICLE_PAGE_DETAIL,} from '../actions';
import {getFormatDateString} from '../util/util';

const initialState = {
  detail: {
    title: '',
    updatedAt: '',
    html: '',
  }
};

export default function articlePageReducer(state = initialState, action) {
  switch (action.type) {
    case SET_ARTICLE_PAGE_DETAIL: {
      return {
        ...state,
        detail: {
          title: action.detail.title,
          updatedAt: getFormatDateString(action.detail.updatedAt),
          html: action.detail.html,
        },
      }
    }
    default: {
      return state;
    }
  }
}
