import axios from 'axios';
import {apiBase} from '../constants/params';

const ApiBase = 'http://localhost:8080/api/';

const articleApiBase = `${ApiBase}article`;
const seriesApiBase = `${ApiBase}series`;
const archiveApiBase = `${apiBase}archive`;

export const getArticleMetadataByPage = (offset, limit) => {
  return axios({
    method: 'GET',
    url: `${articleApiBase}/metadata`,
    params: {offset: offset, limit: limit},
  });
};

export const getPublicArticleCount = () => {
  return axios({
    method: 'GET',
    url: `${articleApiBase}/public-count`
  });
};

export const getArticlePageDetail = (slug) => {
  return axios({
    method: 'GET',
    url: `${articleApiBase}/detail/${slug}`
  });
};

export const getSeriesArticle = () => {
  return axios({
    method: 'GET',
    url: `${seriesApiBase}`
  });
};

export const getArchivedArticle = () => {
  return axios({
    method: 'GET',
    url: `${archiveApiBase}`,
  });
};
