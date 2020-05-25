import axios from 'axios';

const articleApiBase = 'http://localhost:8080/api/article/';

export const getArticleMetadataByPage = (offset, limit) => {
  return axios({
    method: 'GET',
    url: `${articleApiBase}metadata`,
    params: {offset: offset, limit: limit},
  })
};

export const getPublicArticleCount = () => {
  return axios({
    method: 'GET',
    url: `${articleApiBase}public-count`
  })
};
