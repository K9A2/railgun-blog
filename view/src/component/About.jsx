import React from 'react';
import {connect} from 'react-redux';
import PropTypes from 'prop-types';
import {fetchAboutHtml} from '../actions/about';
import HtmlToReactParser from 'html-to-react';

class AboutPage extends React.Component {
  static propTypes = {
    html: PropTypes.string.isRequired,
  };

  componentDidMount() {
    const {dispatch} = this.props;
    dispatch(fetchAboutHtml());
  }

  render() {
    let parser = new HtmlToReactParser.Parser();
    let reactElement = parser.parse(this.props.html);

    return (
      <div className={'align-left'}>{reactElement}</div>
    );
  }
}

const mapStateToProps = state => {
  return {
    html: state.aboutPage.html,
  };
};

export default connect(mapStateToProps)(AboutPage);
