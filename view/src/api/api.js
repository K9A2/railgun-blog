import axios from 'axios';

const queryString = require('querystring');

const ApiBase = 'http://localhost:8080/api/';

const articleApiBase = `${ApiBase}article`;
const seriesApiBase = `${ApiBase}series`;
const archiveApiBase = `${ApiBase}archive`;
const aboutApiBase = `${ApiBase}about`;
const authApiBase = `${ApiBase}login`;

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
    url: `${articleApiBase}/public-count`,
  });
};

export const getArticlePageDetail = (slug) => {
  return axios({
    method: 'GET',
    url: `${articleApiBase}/detail/${slug}`,
  });
};

export const getSeriesArticle = () => {
  return axios({
    method: 'GET',
    url: `${seriesApiBase}`,
  });
};

export const getArchivedArticle = () => {
  return axios({
    method: 'GET',
    url: `${archiveApiBase}`,
  });
};

export const getAboutHtml = () => {
  return axios({
    method: 'GET',
    url: `${aboutApiBase}/html`,
  });
};

export const getAboutMarkdown = () => {
  return axios({
    method: 'GET',
    url: `${aboutApiBase}/markdown`,
  });
};

export const postLoginForm = (username, password) => {
  const formData = {
    username, password,
  };

  const postConfig = {
    headers: {
      'content-type': 'application/x-www-form-urlencoded',
    }
  };

  return axios({
    method: 'POST',
    url: `${authApiBase}/auth`,
    data: queryString.stringify(formData),
    postConfig,
  });
};
