import React from 'react';
import './App.css';
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import PublicContent from './component/PublicContent';
import LoginPage from './component/LoginPage';
import AdminPage from './component/ AdminPage';

class App extends React.Component {
  render() {
    return (
      <Router>
        <Switch>
          <Route path={'/login'} exact component={LoginPage}/>
          <Route path={'/admin'} exact component={AdminPage}/>
          <Route path={'/'} component={PublicContent}/>
        </Switch>
      </Router>
    );
  }
}

export default App;
