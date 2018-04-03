import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import { Provider, connect } from 'react-redux';

let Tracker = connect((state) => state)((props) => {
  return (
    <Router>
      <div>
        <Nav />
        <Route path="/" exact={true} render={() =>
          <Login />
        } />
        <Route path="/tasks" exact={true} render={() =>
          <TaskList tasks={props.state.tasks} />
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

