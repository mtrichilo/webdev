import { createStore, combineReducers } from 'redux';
import { deepFreeze } from 'deep-freeze';

function tasks(state = [], action) {
  switch (action.type) {
    case 'NEW_TASK':
      return [action.task, ...state];
    default:
      state;
  }
}

function rootReducer(state, action) {
  let reducer = combineReducers({ tasks });
  let newState = reducer(state, action);
  return deepFreeze(newState);
}

let store = createStore(rootReducer);
export default store;
