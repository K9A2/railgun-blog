import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App.jsx';
import thunk from 'redux-thunk';
import {applyMiddleware, createStore} from 'redux';
import {Provider} from 'react-redux';
import rootReducer from './reducers';
import logger from 'redux-logger';

if (module.hot) {
  module.hot.accept();
}

const middleware = [thunk];
if (process.env.NODE_ENV !== 'production') {
  middleware.push(logger);
}
const store = createStore(rootReducer, applyMiddleware(...middleware));

ReactDOM.render(
  <React.StrictMode>
    <Provider store={store}>
      <App/>
    </Provider>
  </React.StrictMode>,
  document.getElementById('root')
);
