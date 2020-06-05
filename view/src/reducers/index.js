import {combineReducers} from 'redux';
import homePageReducer from './home_page_reducer';
import articlePageReducer from './article_page_reducer';
import seriesPageReducer from './series_page_reducer';

const rootReducer = combineReducers({
  // 管理文章页的状态
  articlePage: articlePageReducer,
  // 管理首页的状态
  homePage: homePageReducer,
  // 管理专栏页的状态
  seriesPage: seriesPageReducer,
});
export default rootReducer;
