import React from 'react';
import { withRouter } from 'react-router-dom';
import { Button, FormGroup, Label, Input } from 'reactstrap';
import { connect } from 'react-redux';

import api from './api';

function Register(props) {
  function update(ev) {
    let target = $(ev.target);
    let data = {};
    data[target.attr('name')] = target.val();
    props.dispatch({
      type: 'UPDATE_REGISTER',
      data: data,
    });
  }

  function submit(ev) {
    api.registerUser(props.register);
    props.history.push("/login"); 
  }

  return (
    <div>
      <h3>Register</h3>
      <FormGroup>
        <Label for="name">Name</Label>
        <Input type="text" name="name" onChange={update}/>
      </FormGroup>
      <FormGroup>
        <Label for="email">Email</Label>
        <Input type="email" name="email" onChange={update}/>
      </FormGroup>
      <FormGroup>
        <Label for="password">Password</Label>
        <Input type="password" name="password" onChange={update}/>
      </FormGroup>
      <Button onClick={submit} color="primary">Submit</Button> 
    </div>
  );
}

export default withRouter(connect((state) => state)(Register));
