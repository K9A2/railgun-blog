import axios from 'axios';

const articleApiBase = 'http://192.168.247.134:8080/api/article/'

export const getArticleMetadataByPage = (offset, limit) => {
    return axios({
        method: 'GET',
        url: `${articleApiBase}metadata`,
        params: { offset: offset, limit: limit },
    })
};

