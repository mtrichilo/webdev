import React from 'react';
import { Button, FormGroup, Label, Input } from 'reactstrap';

export default function Register(props) {
  function submit(ev) {
    console.log("Submit pressed!");
  }

  return (
    <div>
      <h3>Register</h3>
      <FormGroup>
        <Label for="name">Name</Label>
        <Input type="text" name="name"/>
      </FormGroup>
      <FormGroup>
        <Label for="email">Email</Label>
        <Input type="email" name="email"/>
      </FormGroup>
      <FormGroup>
        <Label for="password">Password</Label>
        <Input type="password" name="password"/>
      </FormGroup>
      <Button onClick={submit} color="primary">Submit</Button> 
    </div>
  );
}
