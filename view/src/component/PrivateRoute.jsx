import React from 'react';
import {Redirect, Route} from 'react-router-dom';

// PrivateRoute 组件使得客户端在没有登陆的情况下访问私有页面时会被重定向到登陆页
export const PrivateRoute = ({authenticated, ...props}) => {
  console.log('authenticated', authenticated)
  return authenticated ? <Route {...props} /> : <Redirect to={'/login'}/>;
};
