import axios from 'axios';

const articleApiBase = '/article'

export const getArticleMetadataByPage = (offset, limit) => {
    return axios({
        method: 'GET',
        url: `${articleApiBase}metadata`,
        params: { offset: offset, limit: limit },
    })
};

