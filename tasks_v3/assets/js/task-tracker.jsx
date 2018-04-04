import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import { Provider, connect } from 'react-redux';

import Navigation from './navigation';
import Register from './register';
import Login from './login';
import Tasks from './tasks';

let Tracker = connect((state) => state)((props) => {
  return (
    <Router>
      <div>
        <Navigation />
        <Route path="/register" exact={true} render={() =>
          <Register />
        } />
        <Route path="/login" exact={true} render={() =>
          <Login />
        } />
        <Route path="/tasks" exact={true} render={() =>
          <Tasks tasks={props.state.tasks} />
        } />
      </div>
    </Router>
  );
});

export default function tracker_init(store) {
  ReactDOM.render(
    <Provider store={store}>
      <Tracker />
    </Provider>,
    document.getElementById('root'),
  );
}

