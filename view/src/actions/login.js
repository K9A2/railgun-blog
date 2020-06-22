import {SET_ADMIN_LOGIN, SET_ADMIN_LOGOUT} from './index';
import {postLoginForm} from '../api/api';

export const setAdminLogin = () => ({
  type: SET_ADMIN_LOGIN,
});

export const setAdminLogout = () => ({
  type: SET_ADMIN_LOGOUT,
});

export const submitLoginForm = (username, password, history) => dispatch => {
  postLoginForm(username, password).then(response => {
    dispatch(setAdminLogin());
    history.push('/admin');
  }).catch(response => {
    alert('this user is not authorized');
  });
};
