import React from 'react';
import PropTypes from 'prop-types';
import {getFormatDateString} from '../util/util';

export default class SeriesItem extends React.Component {
  static propTypes = {
    seriesName: PropTypes.string.isRequired,
    seriesSlug: PropTypes.string.isRequired,
    seriesDescription: PropTypes.string.isRequired,
    seriesArticles: PropTypes.array.isRequired,
  };

  render() {
    let seriesArticleList = [];
    this.props.seriesArticles.forEach(value => {
      seriesArticleList.push(
        <ul>
          <li><a href={`view/article/${value.slug}`}>{value.title}</a> ({getFormatDateString(value.updatedAt)})</li>
        </ul>
      )
    });

    return (
      <div>
        <div><h2 className={'bold'}>{this.props.seriesName}</h2></div>
        <div><p>{this.props.seriesDescription}</p></div>
        <div>
          {seriesArticleList}
        </div>
      </div>
    );
  }
}
