import React from 'react';
import './App.css';
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import PublicContent from './component/PublicContent';
import LoginPage from './component/LoginPage';
import AdminPage from './component/AdminPage';
import {PrivateRoute} from './component/PrivateRoute';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';

class App extends React.Component {
  static propTypes = {
    authenticated: PropTypes.bool.isRequired,
  };

  render() {
    return (
      <Router>
        <Switch>
          <Route path={'/login'} exact component={LoginPage}/>
          {/*<Route path={'/admin'} exact component={AdminPage}/>*/}
          <PrivateRoute path={'/admin'} authenticated={this.props.authenticated} exact component={AdminPage}/>
          <Route path={'/'} component={PublicContent}/>
        </Switch>
      </Router>
    );
  }
}

const mapStateToProps = state => {
  return {
    authenticated: state.loginPage.authenticated,
  };
};

export default connect(mapStateToProps)(App);
