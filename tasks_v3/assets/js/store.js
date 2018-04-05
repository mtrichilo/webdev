import { createStore, combineReducers } from 'redux';
import deepFreeze from 'deep-freeze';

let emptyRegister = { name: "", email: "", password: "" };

function register(state = emptyRegister, action) {
  switch (action.type) {
    case 'UPDATE_REGISTER':
      return Object.assign({}, state, action.data);
    default:
      return state;
  }
}

let emptyLogin = { email: "", password: "", };

function login(state = emptyLogin, action) {
  switch (action.type) {
    case 'UPDATE_LOGIN':
      return Object.assign({}, state, action.data);
    default:
      return state;
  }
}

function token(state = null, action) {
  switch (action.type) {
    case 'SET_TOKEN': 
      return Object.assign({}, state, action.data);
    case 'CLEAR_TOKEN':
      return null;
    default:
      return state;
  }
}

function users(state = [], action) {
  switch (action.type) {
    case 'USER_LIST':
      return [...action.data];
    default:
      return state;
  }
}

function tasks(state = [], action) {
  switch (action.type) {
    case 'TASK_LIST':
      return [...action.data];
    case 'NEW_TASK':
      return [action.data, ...state];
    case 'UPDATE_TASK':
      return _.map(state, (task) => {
        if (task.id == action.data.id) {
          return action.data;
        } else {
          return task;
        }
      });
    default:
      return state;
  }
}

let emptyTask = { title: "", user: null, description: "", time: 0, completed: false }

function create(state = emptyTask, action) {
  switch (action.type) {
    case 'UPDATE_CREATE':
      return Object.assign({}, state, action.data);
    default:
      return state;
  }
}

function edit(state = emptyTask, action) {
  switch (action.type) {
    case 'UPDATE_EDIT':
      return Object.assign({}, state, action.data);
    default:
      return state;
  }
}

function rootReducer(state, action) {
  let reducer = combineReducers({ register, login, token, users, tasks, create, edit });
  let newState = reducer(state, action);
  return deepFreeze(newState);
}

let store = createStore(rootReducer);
export default store;
