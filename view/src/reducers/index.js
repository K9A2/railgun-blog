import { combineReducers } from 'redux';
import indexList from './indexList';

export const initialState = {
  offset: 0,
  metadataList: [],
};

export const rootReducer = combineReducers({
  indexList,
});
