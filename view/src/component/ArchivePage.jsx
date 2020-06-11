import React from 'react';
import {connect} from 'react-redux';
import PropTypes from 'prop-types';
import {fetchArchivedArticle} from '../actions/archive';
import {getFormatDateString} from '../util/util';

class ArchivePage extends React.Component {
  static propTypes = {
    archivedArticle: PropTypes.array.isRequired,
  };

  componentDidMount() {
    const {dispatch} = this.props;
    dispatch(fetchArchivedArticle());
  }

  render() {
    let archiveList = [];
    this.props.archivedArticle.map(yearArticles => {
      // 构建每一年的文章列表
      let articleList = [];
      yearArticles.ArticleList.map(entry => {
        articleList.push(
          <ul>
            <li>
              <a href={`view/article/${entry.slug}`}>{entry.title}</a> ({getFormatDateString(entry.updatedAt)})
            </li>
          </ul>,
        );
      });
      archiveList.push(
        <div>
          <div><h2 className={'bold'}>{yearArticles.Year}</h2>
          </div>
          <div>{articleList}</div>
        </div>,
      );
    });

    return (
      <div className={'align-left'}>
        <div>
          <h1>归档页</h1>
        </div>
        <div>{archiveList}</div>
      </div>
    );
  }
}

const mapStateToProps = state => {
  return {
    archivedArticle: state.archivePage.archivedArticle,
  };
};

export default connect(mapStateToProps)(ArchivePage);
