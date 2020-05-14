import {
    GET_ARTICLE_METADATA_FIRST_PAGE,
    GET_ARTICLE_METADATA_NEXT_PAGE,
    GET_ARTICLE_METADATA_PREVIOUS_PAGE,
} from '../constants/ActionsTypes';
import {
    defaultPageOffset, defaultPageLimit,  
} from '../constants/params';

const initialState = {
    currentPage: 0,
    articleMetadataList: [],
};

export default function indexList(state = initialState, action) {
    switch(action.type) {
        case GET_ARTICLE_METADATA_FIRST_PAGE:
            return 
    }
}
