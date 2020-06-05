import React from 'react';
import logo from "../img/logo.jpg";
import {Link} from "react-router-dom";

export default class SidePanel extends React.Component {
  render() {
    return (
      <div>
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
          <div className="function-area">
            <div className="function-btn"><Link to={'/'} className={"white"}>首页</Link></div>
            <div className="function-btn"><Link to={'/series'} className={"white"}>专题</Link></div>
            <div className="function-btn"><Link to={'/tag'} className={"white"}>标签</Link></div>
            <div className="function-btn"><Link to={'/archive'} className={"white"}>归档</Link></div>
            <div className="function-btn"><Link to={'/about'} className={"white"}>关于</Link></div>
          </div>
        </div>
      </div>
    );
  }
}
