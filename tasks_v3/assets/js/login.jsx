import React from 'react';
import { Link } from 'react-router-dom';
import { Button, FormGroup, Label, Input } from 'reactstrap';

export default function Login(props) {
  function submit(ev) {
    console.log("Submit pressed.");
  }

  return (
    <div>
      <h3>Login</h3>
      <FormGroup>
        <Label for="email">Email</Label>
        <Input type="email" name="email"/>
      </FormGroup>
      <FormGroup>
        <Label for="password">Password</Label>
        <Input type="password" name="password"/>
      </FormGroup>
      <Button onClick={submit} color="primary">Login</Button>
      &nbsp;&nbsp;&nbsp;
      <Link to="/register">Register</Link>
    </div>
  );
}
