import React from 'react';

import ArticleIndexEntry from './ArticleIndexEntry';

export default class ArticleList extends React.Component {
  render() {
    const metadataList = this.props.metadataList;
    let articleEntryList = [];
    for (const [, value] of metadataList.entries()) {
      articleEntryList.push(
        <ArticleIndexEntry
          key={value.Slug}
          title={value.Title}
          slug={value.Slug}
          updatedAt={value.UpdatedAt}
          description={value.Description}
        />
      )
    }

    return (
      <div>
        <div>{articleEntryList}</div>
      </div>
    )
  }
}
