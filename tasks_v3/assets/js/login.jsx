import React from 'react';
import { Button, FormGroup, Label, Input } from 'reactstrap';

function Login(params) {
  function submit(ev) {
    console.log("Submit pressed.");
  }

  function register(ev) {
    console.log("Register pressed.");
  }

  return (
    <div>
      <h2>Log in to Task Tracker</h2>
      <FormGroup>
        <Label for="email">Email</Label>
        <Input type="email" name="email"/>
      </FormGroup>
      <FormGroup>
        <Label for="password">Password</Label>
        <Input type="password" name="password"/>
      </FormGroup>
      <Button onClick={submit} color="primary">Log in</Button>
      <Button onClick={register}>Register</Button>
    </div>
  );
}
