import React from 'react';
import { Button, FormGroup, Label, Input } from 'reactstrap';

import api from './api';

export default function New(props) {
  function submit(ev) {
    console.log("Submit pressed!");
  }

  let users = api.getUsers();
  console.log(users);
  let userOptions = _.map(users, (user) => <option>{user.name}</option>);

  return (
    <div>
      <h3>New</h3>
      <FormGroup>
        <Label for="title">Title</Label>
        <Input type="text" name="title" />
      </FormGroup>
      <FormGroup>
        <Label for="user">Assignee</Label>
        <Input type="select" name="user">
          { userOptions }
        </Input>
      </FormGroup>
      <FormGroup>
        <Label for="description">Description</Label>
        <Input type="text" name="description" />
      </FormGroup>
      <FormGroup>
        <Label for="time">Time Spent</Label>
        <Input type="number" name="time" />
      </FormGroup>
      <FormGroup>
        <Label for="completed">Completed</Label>
        <Input type="checkbox" name="completed" />
      </FormGroup>
      <Button onClick={submit} color="primary">Submit</Button>
    </div>
  );
}
