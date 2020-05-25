import {
  LOAD_NEXT_PAGE,
  LOAD_PREVIOUS_PAGE,
  RECEIVE_ARTICLE_METADATA_LIST,
  REQUEST_ARTICLE_METADATA_LIST,
} from '../actions';
import {defaultPageLimit} from "../constants/params";

const initialState = {
  metadataList: [],
  currentOffset: 0,
};

export default function indexListReducer(state = initialState, action) {
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
    default:
      return state
  }
}
