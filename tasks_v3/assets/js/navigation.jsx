import React from 'react';
import { NavLink } from 'react-router-dom';
import { NavItem } from 'reactstrap';
import { connect } from 'react-redux';

let UserInfo = connect(({token}) => {return {token};})((props) => {
  return (
    <span>
      <div className="navbar-text">Welcome, {props.token.name}</div>
      <NavLink to="/login" exact={true} className="nav-link">Logout</NavLink>
    </span>
  );
});

export default function Navigation(props) {
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
      {userInfo}
    </nav>
  );
}
