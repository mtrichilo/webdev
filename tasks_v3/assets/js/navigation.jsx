import React from 'react';
import { NavLink, withRouter } from 'react-router-dom';
import { NavItem } from 'reactstrap';
import { connect } from 'react-redux';

let UserInfo = withRouter(connect(({token}) => {return {token};})((props) => {
  function logout(ev) {
    ev.preventDefault();
    props.dispatch({
      type: 'CLEAR_TOKEN',
    });
    props.history.push("/login");
  }

  return (
    <ul className="navbar-nav">
      <NavItem>
        <span className="navbar-text">Welcome, {props.token.name} | </span>
      </NavItem>
      <NavItem>
        <NavLink to="/login" onClick={logout} exact={true} className="nav-link">Logout</NavLink>
      </NavItem>
    </ul>
  );
}));

function Navigation(props) {
  let userInfo; 
  if (props.token) {
    userInfo = <UserInfo token={props.token} />;
  } else {
    userInfo = <NavLink to="/login" exact={true} className="nav-link">Login</NavLink>;
  }

  return (
    <nav className="navbar navbar-light bg-light navbar-expand">
      <span className="navbar-brand">
        Tasker
      </span>
      <ul className="navbar-nav mr-auto">
        <NavItem>
          <NavLink to="/tasks" exact={true} activeClassName="active" className="nav-link">All</NavLink>
        </NavItem>
        <NavItem>
          <NavLink to="/new" exact={true} className="nav-link">New</NavLink>
        </NavItem>
      </ul>
      { userInfo }
    </nav>
  );
}

export default connect(({token}) => {return {token};})(Navigation);
