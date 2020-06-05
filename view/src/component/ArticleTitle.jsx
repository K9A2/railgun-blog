import React from 'react';
import {Link} from "react-router-dom";
import {getFormatDateString} from "../util/util";
import PropTypes from 'prop-types';

export default class ArticleTitle extends React.Component {
  static propTypes = {
    address: PropTypes.string.isRequired,
    title: PropTypes.string.isRequired,
    updatedAt: PropTypes.string.isRequired,
  };

  render() {
    return (
      <div className="flex-container">
        <div className="left-col title-area">
          <h1 className="title-text">
            <Link to={this.props.address}>{this.props.title}</Link>
          </h1>
        </div>
        <div className="right-col date-area">
          <p className="date-text">{getFormatDateString(this.props.updatedAt)}</p>
        </div>
      </div>
    )
  }
}
