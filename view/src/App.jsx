import React from 'react';
import './App.css';
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import Home from './component/Home';
import About from './component/About';
import SeriesPage from './component/SeriesPage';
import Tag from './component/Tag';
import Archive from './component/Archive';
import Footer from './component/Footer';
import SidePanel from './component/SidePanel';
import ArticlePage from './component/ArticlePage';

class App extends React.Component {
  render() {
    return (
      <Router>
        <div className="App flex-container">
          <SidePanel/>
          <div className="right-col full-height main-panel">
            <Switch>
              <Route path={'/series'} component={SeriesPage}/>
              <Route path={'/tag'} component={Tag}/>
              <Route path={'/archive'} component={Archive}/>
              <Route path={'/about'} component={About}/>

              <Route path={'/view/article/:slug'} component={ArticlePage}/>

              <Route path={'/'} component={Home}/>
            </Switch>
            <Footer/>
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
