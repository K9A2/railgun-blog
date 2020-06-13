import {SET_ABOUT_HTML} from './index';
import {getAboutHtml} from '../api/api';

export const receiveAboutHtml = (about) => ({
  type: SET_ABOUT_HTML, about,
});

export const fetchAboutHtml = () => dispatch => {
  getAboutHtml().then(resp => {
    dispatch(receiveAboutHtml(resp.data.about));
  });
};

