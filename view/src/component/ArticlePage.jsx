import React from 'react';
import {fetchArticlePageDetail} from '../actions/article';
import {connect} from 'react-redux';
import ArticleTitle from './ArticleTitle';
import HtmlToReactParser from 'html-to-react';

class ArticlePage extends React.Component {
  componentDidMount() {
    const {dispatch} = this.props;
    let slug = this.props.match.params.slug;
    dispatch(fetchArticlePageDetail(slug));
  }

  render() {
    let articleAddress = "view/article/" + this.props.match.params.slug;
    let parser = new HtmlToReactParser.Parser();
    let reactElement = parser.parse(this.props.html);

    return (
      <div>
        <div>
          <ArticleTitle address={articleAddress} title={this.props.title} updatedAt={this.props.updatedAt}/>
        </div>
        <div>{reactElement}</div>
      </div>
    )
  }
}

const mapStateToProps = state => {
  return {
    updatedAt: state.articlePage.detail.updatedAt,
    title: state.articlePage.detail.title,
    html: state.articlePage.detail.html,
  }
}

export default connect(mapStateToProps)(ArticlePage);
