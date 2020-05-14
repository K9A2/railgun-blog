import React from 'react';

import ArticleIndexEntry from './ArticleIndexEntry';

export default class ArticleList extends React.Component {

    render() {
        const metadataList = this.props.metadataList;
        let articleEntryList = []
        for (const [_, value] of metadataList.entries()) {
            articleEntryList.push(
                <ArticleIndexEntry info={value} key={value.uri} />
            )
        }

        return (
            <div>
                <div>{articleEntryList}</div>
            </div>
        )
    }
}
