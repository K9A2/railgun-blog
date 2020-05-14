import React from 'react';
import axios from 'axios';
// import { Button, DatePicker } from 'antd';
import logo from './img/logo.jpg';
import './App.css';
// import 'antd/dist/antd.css';
import { defaultPageOffset, defaultPageLimit } from './consts';
import ArticleList from './component/ArticleList';

export default class App extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      currentOffset: defaultPageOffset,
      currentLimit: defaultPageLimit,
      metadataList: [],
    };
  }

  componentDidMount() {
    this.getArticleMetadataByPage();
  }

  getArticleMetadataByPage() {
    axios.get('http://192.168.8.207:8081/article/metadata', {
      method: 'GET',
      params: {
        'offset': this.state.currentOffset,
        'limit': this.state.currentLimit,
      },
    }).then(res => {
      const articleMetadata = res.data;
      this.setState({ metadataList: articleMetadata });
    });
  }

  handlePreviousPage = (event) => {
    console.log(this.state);
    let newOffset = Math.max(this.state.currentOffset - this.state.currentLimit, 0);
    this.setState({
      currentOffset: newOffset,
    });
    this.getArticleMetadataByPage();
  }

  handleNextPage= (event) => {
    console.log(this.state);
    let newOffset = Math.max(this.state.currentOffset + this.state.currentLimit, 0);
    console.log(newOffset);
    this.setState({
      currentOffset: newOffset,
    });
    this.getArticleMetadataByPage();
  }

  render() {
    let currentDate = new Date()
    return (
      <div className="App flex-container">
        <div className="left-col full-height wallpaper side-panel">
          <div className="logo-box">
            <img src={logo} alt="Logo" className="blog-logo" />
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
          <ArticleList metadataList={this.state.metadataList}></ArticleList>
          <div className="index-pagination-area flex-container">
            <div className="previous-page-btn vertical-center">
              <a onClick={this.handlePreviousPage}>上一页</a>
            </div>
            <div className="to-collection-btn vertical-center">
              <a href="">博客归档</a>
            </div>
            <div className="next-page-btn vertical-center">
              <a onClick={this.handleNextPage}>下一页</a>
            </div>
          </div>
          <footer>
            <p>© {currentDate.getFullYear()} - stormlin's blog - 粤ICP备16029958号-1</p>
            <p>Powered by <a href="https://github.com/K9A2">java-my-blog</a></p>
          </footer>
        </div>
      </div>
    );
  }
}
