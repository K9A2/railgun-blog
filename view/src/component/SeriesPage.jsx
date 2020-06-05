import React from 'react';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';
import {fetchSeriesArticle} from '../actions/series';
import SeriesItem from './SeriesItem';

class SeriesPage extends React.Component {
  static propTypes = {
    seriesArticleList: PropTypes.array.isRequired,
  };

  componentDidMount() {
    const {dispatch} = this.props;
    dispatch(fetchSeriesArticle());
  }

  render() {
    let seriesArticleList = [];
    this.props.seriesArticleList.forEach((value, _) => {
      console.log(value);
      seriesArticleList.push(
        <SeriesItem seriesName={value.SeriesName} seriesSlug={value.SeriesSlug}
                    seriesDescription={value.SeriesDescription}
                    seriesArticles={value.SimpleTitleList}
        />
      );
    });

    return (
      <div className={"align-left"}>
        <h1>专题</h1>
        {seriesArticleList}
      </div>
    );
  }
}

const mapStateToProps = state => {
  return {
    seriesArticleList: state.seriesPage.seriesArticleList,
  };
};

export default connect(mapStateToProps)(SeriesPage);
