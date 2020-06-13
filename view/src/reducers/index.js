import {combineReducers} from 'redux';
import homePageReducer from './home_page_reducer';
import articlePageReducer from './article_page_reducer';
import seriesPageReducer from './series_page_reducer';
import archive_page_reducer from './archive_page_reducer';
import about_page_reducer from './about';

const rootReducer = combineReducers({
  // 管理关于页的状态
  aboutPage: about_page_reducer,
  // 管理归档页的状态
  archivePage: archive_page_reducer,
  // 管理文章页的状态
  articlePage: articlePageReducer,
  // 管理首页的状态
  homePage: homePageReducer,
  // 管理专栏页的状态
  seriesPage: seriesPageReducer,
});
export default rootReducer;
