import React from 'react';
import LoginImage from '../img/login-image.webp';
import {submitLoginForm} from '../actions/login';
import {connect} from 'react-redux';
import {withRouter} from 'react-router-dom';

class LoginPage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: '',
    };
  }

  handleUsernameInput = (e) => {
    this.setState({
      username: e.target.value,
    });
  };

  handlePasswordInput = (e) => {
    this.setState({
      password: e.target.value,
    });
  };

  handlerSubmit = (e) => {
    const {dispatch} = this.props;
    dispatch(submitLoginForm(this.state.username, this.state.password, this.props.history));
    e.preventDefault();
  };

  render() {
    return (
      <div className={'gray-background login-container full-height'}>
        <div className={'login-box flex-container'}>
          <div className={'left-col login-image-panel'}>
            <img className={'login-image'} src={LoginImage} alt={'login-image'}/>
          </div>
          <div className={'right-col login-form-panel'}>
            <div className={''}>
              <h1 className={'bold'}>Only My Railgun</h1>
              <form onSubmit={this.handlerSubmit} method={'post'} id={'login form'}>
                <div className={'input-area'}>
                  <input type={'text'} placeholder={'username'} onChange={this.handleUsernameInput}/>
                </div>
                <div className={'input-area'}>
                  <input type={'password'} placeholder={'password'} onChange={this.handlePasswordInput}/>
                </div>
                <div>
                  <input type={'submit'} value={'Login'}/>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

const mapStateToProps = state => {
  return {};
};

export default withRouter(connect(mapStateToProps)(LoginPage));
