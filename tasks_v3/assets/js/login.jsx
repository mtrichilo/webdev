import React from 'react';
import { Link, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import { Button, FormGroup, Label, Input } from 'reactstrap';

import api from './api';

function Login(props) {
  function update(ev) {
    let target = $(ev.target);
    let data = {};
    data[target.attr('name')] = target.val();
    props.dispatch({
      type: 'UPDATE_LOGIN',
      data: data,
    });
  }

  function submit(ev) { 
    api.submitLogin(props.login);
    props.history.push("/tasks");
  }

  return (
    <div>
      <h3>Login</h3>
      <FormGroup>
        <Label for="email">Email</Label>
        <Input type="email" name="email" onChange={update}/>
      </FormGroup>
      <FormGroup>
        <Label for="password">Password</Label>
        <Input type="password" name="password" onChange={update}/>
      </FormGroup>
      <Button onClick={submit} color="primary">Login</Button>
      &nbsp;&nbsp;&nbsp;
      <Link to="/register">Register</Link>
    </div>
  );
}

export default withRouter(connect((state) => state)(Login));
