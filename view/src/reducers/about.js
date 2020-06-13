import {SET_ABOUT_HTML} from '../actions';

const initialState = {
  updatedAt: '',
  html: '',
  markdown: '',
};

export default function about_page_reducer(state = initialState, action) {
  switch (action.type) {
    case SET_ABOUT_HTML: {
      return {
        ...state,
        html: action.about.Html,
      };
    }
    default: {
      return state;
    }
  }
}
