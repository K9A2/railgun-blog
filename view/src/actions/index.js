export const REQUEST_ARTICLE_METADATA_LIST = 'REQUEST_ARTICLE_METADATA_LIST'; // 发出请求后触发
export const RECEIVE_ARTICLE_METADATA_LIST = 'RECEIVE_ARTICLE_METADATA_LIST'; // 收到请求后触发
export const LOAD_PREVIOUS_PAGE = 'LOAD_PREVIOUS_PAGE'; // 加载上一页
export const LOAD_NEXT_PAGE = 'LOAD_NEXT_PAGE'; // 加载下一页

export const REQUEST_PUBLIC_ARTICLE_COUNT = 'REQUEST_PUBLIC_ARTICLE_COUNT'; // 获取可公开查看的文章总数
export const RECEIVE_PUBLIC_ARTICLE_COUNT = 'RECEIVE_PUBLIC_ARTICLE_COUNT'; // 收到请求
export const SHOW_PREVIOUS_PAGE_BUTTON = 'SHOW_PREVIOUS_PAGE_BUTTON';
export const HIDE_PREVIOUS_PAGE_BUTTON = 'HIDE_PREVIOUS_PAGE_BUTTON';
export const SHOW_NEXT_PAGE_BUTTON = 'SHOW_NEXT_PAGE_BUTTON';
export const HIDE_NEXT_PAGE_BUTTON = 'HIDE_NEXT_PAGE_BUTTON';
export const SET_PAGINATION_BUTTON_VISIBILITY = 'SET_PAGINATION_BUTTON_VISIBILITY';

export const GET_ARTICLE_PAGE_DETAIL = 'GET_ARTICLE_PAGE_DETAIL'; // 加载文章页所需资源
export const SET_ARTICLE_PAGE_DETAIL = 'SET_ARTICLE_PAGE_DETAIL'; // 设置文章页的内容

export const GET_ARTICLE_METADATA_BY_PAGE_PENDING = 'GET_ARTICLE_METADATA_BY_PAGE_PENDING'; // 让 UI 组件渲染加载中效果
export const GET_ARTICLE_METADATA_BY_PAGE_SUCCESS = 'GET_ARTICLE_METADATA_BY_PAGE_SUCCESS'; // 让 UI 组件渲染加载成功效果
export const GET_ARTICLE_METADATA_BY_PAGE_ERROR = 'GET_ARTICLE_METADATA_BY_PAGE_ERROR'; // 让 UI 组件渲染加载错误效果

export const GET_SERIES_ARTICLE = 'GET_SERIES_ARTICLE';
export const SET_SERIES_ARTICLE = 'SET_SERIES_ARTICLE';
