import {combineReducers} from 'redux';
import indexListReducer from './index_list_reducer';

// const rootReducer = combineReducers({
//   indexListReducer,
// });
const rootReducer = indexListReducer;
export default rootReducer;
