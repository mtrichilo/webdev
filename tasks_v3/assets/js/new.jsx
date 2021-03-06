import React from 'react';
import { withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import { Button, FormGroup, Label, Input } from 'reactstrap';

import api from './api';

function New(props) {
  function update(ev) {
    let target = $(ev.target);
    let data = {};
    data[target.attr('name')] = target.val();
    props.dispatch({
      type: 'UPDATE_CREATE',
      data: data,
    });
  }
    
  function submit(ev) {
    api.createTask(props.create);
    props.history.push("/tasks");
  }

  let users = _.map(props.users, (user) => <option key={user.id} id={user.id}>{user.name}</option>);

  return (
    <div>
      <h3>New</h3>
      <FormGroup>
        <Label for="title">Title</Label>
        <Input type="text" name="title" onChange={update}/>
      </FormGroup>
      <FormGroup>
        <Label for="user_name">Assignee</Label>
        <Input type="select" name="user_name" onChange={update}>
          <option />
          { users }
        </Input>
      </FormGroup>
      <FormGroup>
        <Label for="description">Description</Label>
        <Input type="text" name="description" onChange={update}/>
      </FormGroup>
      <FormGroup>
        <Label for="time">Time Spent</Label>
        <Input type="number" name="time" onChange={update}/>
      </FormGroup>
      <FormGroup>
        <Label for="completed">
          <Input type="checkbox" name="completed" onChange={update}/>
          Completed
        </Label>
      </FormGroup>
      <Button onClick={submit} color="primary">Submit</Button>
    </div>
  );
}

export default withRouter(connect(({create}) => {return {create};})(New));
