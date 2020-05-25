import React from 'react';
import logo from './img/logo.jpg';
import './App.css';
import {defaultPageLimit} from './consts';
import ArticleList from './component/ArticleList';
import {connect} from 'react-redux';
import {
  fetchArticleMetadataList,
  fetchPublicArticleCount,
  setPaginationButtonVisibility
} from "./actions/article_metadata";
import PropTypes from 'prop-types';

class App extends React.Component {
  static propTypes = {
    metadataList: PropTypes.array.isRequired,
    currentOffset: PropTypes.number.isRequired,
    isPreviousPageButtonShow: PropTypes.bool.isRequired,
    isNextPageButtonShow: PropTypes.bool.isRequired,
  };

  componentDidMount() {
    const {dispatch, currentOffset} = this.props;
    dispatch(fetchArticleMetadataList(currentOffset, defaultPageLimit));
    dispatch(fetchPublicArticleCount());
  }

  handlePreviousPage = (e) => {
    e.preventDefault();

    const {dispatch, currentOffset} = this.props;
    let newOffset = currentOffset - defaultPageLimit;
    if (newOffset < 0) {
      newOffset = 0
    }
    dispatch(fetchArticleMetadataList(newOffset, defaultPageLimit));
  };

  handleNextPage = (e) => {
    e.preventDefault();

    const {dispatch, currentOffset} = this.props;
    // todo: 增加请求校验功能
    let newOffset = currentOffset + defaultPageLimit;
    dispatch(fetchArticleMetadataList(newOffset, defaultPageLimit));
    dispatch(setPaginationButtonVisibility())
  };

  render() {
    let currentDate = new Date();
    let hidePreviousPageButton = this.props.isPreviousPageButtonShow ? '' : 'hidden';
    let hideNextPageButton = this.props.isNextPageButtonShow ? '' : 'hidden';
    return (
      <div className="App flex-container">
        <div className="left-col full-height wallpaper side-panel">
          <div className="logo-box">
            <img src={logo} alt="Logo" className="blog-logo"/>
          </div>
          <div className="blog-profile white">
            <div className="blog-title-area">
              <h1>stormlin</h1>
              <h2 className="motto-text">吃了3个巨无霸汉堡</h2>
            </div>
          </div>
          <div className="function-area white">
            <div className="function-btn">首页</div>
            <div className="function-btn">专题</div>
            <div className="function-btn">标签</div>
            <div className="function-btn">归档</div>
            <div className="function-btn">关于</div>
          </div>
        </div>
        <div className="right-col full-height main-panel">
          <ArticleList metadataList={this.props.metadataList}/>
          <div className="index-pagination-area flex-container">
            <div className={`previous-page-btn vertical-center ${hidePreviousPageButton}`}>
              <a onClick={this.handlePreviousPage}>上一页</a>
            </div>
            <div className="to-collection-btn vertical-center">
              <a href="javascript:void(0)">博客归档</a>
            </div>
            <div className={`next-page-btn vertical-center ${hideNextPageButton}`}>
              <a href="javascript:void(0)" onClick={this.handleNextPage}>下一页</a>
            </div>
          </div>
          <footer>
            <p>© {currentDate.getFullYear()}</p>
            <p>Powered by <a href="https://github.com/K9A2/railgun-blog">railgun-blog</a></p>
          </footer>
        </div>
      </div>
    );
  }
}

const mapStateToProps = state => {
  return {
    metadataList: state.metadataList,
    currentOffset: state.currentOffset,
    isPreviousPageButtonShow: state.isPreviousPageButtonShow,
    isNextPageButtonShow: state.isNextPageButtonShow,
  }
};

export default connect(mapStateToProps)(App);
