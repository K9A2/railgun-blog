import React from 'react';
import {Link} from 'react-router-dom';
import PropTypes from 'prop-types';
import ArticleTitle from './ArticleTitle';

export default class ArticleIndexEntry extends React.Component {
  static propTypes = {
    title: PropTypes.string.isRequired,
    slug: PropTypes.string.isRequired,
    updatedAt: PropTypes.string.isRequired,
    description: PropTypes.string.isRequired,
  };


  render() {
    let articleAddress = 'view/article/' + this.props.slug;
    return (
      <div className="index-entry-area">
        <div className={'horizontal-area'}>
          <ArticleTitle address={articleAddress} title={this.props.title}
                        updatedAt={this.props.updatedAt}/>
        </div>
        <div className="horizontal-area flex-container">
          <p className="description-text justified-text">{this.props.description}</p>
        </div>
        <div className="read-more-area">
          <Link to={articleAddress}>继续阅读</Link>
        </div>
      </div>
    )
  }
}
