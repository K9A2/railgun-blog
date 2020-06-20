import React from 'react';
import SidePanel from './SidePanel';
import {Route} from 'react-router-dom';
import SeriesPage from './SeriesPage';
import Tag from './Tag';
import ArchivePage from './ArchivePage';
import About from './About';
import ArticlePage from './ArticlePage';
import Home from './Home';
import Footer from './Footer';

class PublicContent extends React.Component {
  render() {
    return (
      <div>
        <div className="App flex-container">
          <SidePanel/>
          <div className="right-col full-height main-panel">
            <Route path={'/series'} exact component={SeriesPage}/>
            <Route path={'/tag'} exact component={Tag}/>
            <Route path={'/archive'} exact component={ArchivePage}/>
            <Route path={'/about'} exact component={About}/>

            <Route path={'/view/article/:slug'} exact component={ArticlePage}/>

            <Route path={'/'} exact component={Home}/>
            <Footer/>
          </div>
        </div>
      </div>
    );
  }
}

export default PublicContent;
