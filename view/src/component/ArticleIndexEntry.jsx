import React from 'react';
import { getFormatDateString } from '../util/util';

export default class ArticleIndexEntry extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            title: props.info.Title,
            slug: props.info.Slug,
            updatedAt: props.info.UpdatedAt,
            description: props.info.Description,
        };
    }

    render() {
        let articleAddress = "/article/show/" + this.state.slug;
        return (
            <div className="index-entry-area">
                <div className="horizontal-area flex-container">
                    <div className="left-col title-area">
                        <h1 className="title-text"><a href={articleAddress}>{this.state.title}</a></h1>
                    </div>
                    <div className="right-col date-area">
                        <p className="date-text">{getFormatDateString(this.state.updatedAt)}</p>
                    </div>
                </div>
                <div className="horizontal-area flex-container">
                    <p className="description-text justified-text">{this.state.description}</p>
                </div>
                <div className="read-more-area">
                    <a href={articleAddress}>继续阅读</a>
                </div>
            </div>
        )
    }
}
