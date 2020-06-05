import {
  HIDE_NEXT_PAGE_BUTTON,
  HIDE_PREVIOUS_PAGE_BUTTON,
  LOAD_NEXT_PAGE,
  LOAD_PREVIOUS_PAGE,
  RECEIVE_ARTICLE_METADATA_LIST,
  RECEIVE_PUBLIC_ARTICLE_COUNT,
  REQUEST_ARTICLE_METADATA_LIST,
  REQUEST_PUBLIC_ARTICLE_COUNT,
  SET_PAGINATION_BUTTON_VISIBILITY,
  SHOW_NEXT_PAGE_BUTTON,
  SHOW_PREVIOUS_PAGE_BUTTON,
} from '../actions';
import {defaultPageLimit, defaultPublicArticleCount} from '../constants/params';

const initialState = {
  metadataList: [],
  currentOffset: 0,
  publicArticleCount: defaultPublicArticleCount,
  isPreviousPageButtonShow: false,
  isNextPageButtonShow: true,
};

export default function homePageReducer(state = initialState, action) {
  switch (action.type) {
    case REQUEST_ARTICLE_METADATA_LIST:
      return {
        ...state,
      };
    case RECEIVE_ARTICLE_METADATA_LIST:
      return {
        ...state,
        currentOffset: action.offset,
        metadataList: action.metadataList,
      };
    case REQUEST_PUBLIC_ARTICLE_COUNT:
      return {
        ...state,
      };
    case RECEIVE_PUBLIC_ARTICLE_COUNT: {
      return {
        ...state,
        publicArticleCount: action.publicArticleCount,
      };
    }
    case SET_PAGINATION_BUTTON_VISIBILITY: {
      let isPreviousPageButtonShow = false;
      let isNextPageButtonShow = true;
      if (state.currentOffset !== 0) {
        isPreviousPageButtonShow = true
      }
      if (state.currentOffset + defaultPageLimit >= state.publicArticleCount) {
        isNextPageButtonShow = false
      }
      return {
        ...state,
        isPreviousPageButtonShow: isPreviousPageButtonShow,
        isNextPageButtonShow: isNextPageButtonShow,
      };
    }
    case LOAD_PREVIOUS_PAGE:
      return {
        ...state,
        currentOffset: action.offset,
      };
    case LOAD_NEXT_PAGE:
      return {
        ...state,
        currentOffset: action.offset,
      };
    case SHOW_PREVIOUS_PAGE_BUTTON:
      return {
        ...state,
        isPreviousPageButtonShow: true,
      };
    case HIDE_PREVIOUS_PAGE_BUTTON:
      return {
        ...state,
        isPreviousPageButtonShow: false,
      };
    case SHOW_NEXT_PAGE_BUTTON:
      return {
        ...state,
        isNextPageButtonShow: true,
      };
    case HIDE_NEXT_PAGE_BUTTON:
      return {
        ...state,
        isNextPageButtonShow: false,
      };
    default:
      return state
  }
}
