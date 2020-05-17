import React from 'react';

import ArticleIndexEntry from './ArticleIndexEntry';

export default class ArticleList extends React.Component {

    render() {
        const metadataList = this.props.metadataList;
        let articleEntryList = []
        let index = 0;
        for (const [_, value] of metadataList.entries()) {
            articleEntryList.push(
                <ArticleIndexEntry info={value} key={value.Slug} />
            )
        }

        return (
            <div>
                <div>{articleEntryList}</div>
            </div>
        )
    }
}
