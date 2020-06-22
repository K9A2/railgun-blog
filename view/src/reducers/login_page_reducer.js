import {SET_ADMIN_LOGIN, SET_ADMIN_LOGOUT} from '../actions';

const initialState = {
  authenticated: false,
};

export default function loginPageReducer(state = initialState, action) {
  switch (action.type) {
    case SET_ADMIN_LOGIN: {
      return {
        ...state,
        authenticated: true,
      };
    }
    case SET_ADMIN_LOGOUT: {
      return {
        ...state,
        authenticated: false,
      };
    }
    default: {
      return state;
    }
  }
}
