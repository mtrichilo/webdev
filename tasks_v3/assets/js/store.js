import { createStore, combineReducers } from 'redux';
import deepFreeze from 'deep-freeze';

let emptyLogin = { email: "", password: "", };

function login(state = emptyLogin, action) {
  switch (action.type) {
    default:
      return state;
  }
}

function tasks(state = [], action) {
  switch (action.type) {
    case 'TASKS_LIST':
      return [action.tasks];
    case 'NEW_TASK':
      return [action.task, ...state];
    default:
      return state;
  }
}

function rootReducer(state, action) {
  let reducer = combineReducers({ login, tasks });
  let newState = reducer(state, action);
  return deepFreeze(newState);
}

let store = createStore(rootReducer);
export default store;
