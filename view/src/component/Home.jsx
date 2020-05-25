import React from 'react';
import PropTypes from 'prop-types';
import {
  fetchArticleMetadataList,
  fetchPublicArticleCount,
  setPaginationButtonVisibility
} from "../actions/article_metadata";
import {defaultPageLimit} from "../consts";
import ArticleList from "./ArticleList";
import {connect} from "react-redux";

class Home extends React.Component {
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
    let hidePreviousPageButton = this.props.isPreviousPageButtonShow ? '' : 'hidden';
    let hideNextPageButton = this.props.isNextPageButtonShow ? '' : 'hidden';
    return (
      <div>
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
      </div>
    )
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

export default connect(mapStateToProps)(Home);

