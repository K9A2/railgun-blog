import React from 'react';
import logo from './img/logo.jpg';
import './App.css';
import Home from './component/Home';

class App extends React.Component {
  render() {
    let currentDate = new Date();
    return (
      <div className="App flex-container">
        <div className="left-col full-height wallpaper side-panel">
          <div className="logo-box">
            <img src={logo} alt="Logo" className="blog-logo"/>
          </div>
          <div className="blog-profile white">
            <div className="blog-title-area">
              <h1>stormlin</h1>
              <h2 className="motto-text">吃了3个巨无霸汉堡</h2>
            </div>
          </div>
          <div className="function-area white">
            <div className="function-btn">首页</div>
            <div className="function-btn">专题</div>
            <div className="function-btn">标签</div>
            <div className="function-btn">归档</div>
            <div className="function-btn">关于</div>
          </div>
        </div>
        <div className="right-col full-height main-panel">
          <Home/>
          <footer>
            <p>© {currentDate.getFullYear()}</p>
            <p>Powered by <a href="https://github.com/K9A2/railgun-blog">railgun-blog</a></p>
          </footer>
        </div>
      </div>
    );
  }
}

export default App;
