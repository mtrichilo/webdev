import React from 'react';
import { withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import { Button, FormGroup, Label, Input } from 'reactstrap';

import api from './api';

function Edit(props) {
  function update(ev) {
    let target = $(ev.target);
    let data = {};
    data[target.attr('name')] = target.val();
    props.dispatch({
      type: 'UPDATE_EDIT',
      data: data,
    });
  }
    
  function submit(ev) {
    api.updateTask(props.edit, props.task.id);
    props.history.push("/tasks");
  }

  let users = _.map(props.users, (user) => <option key={user.id} id={user.id}>{user.name}</option>);

  return (
    <div>
      <h3>Edit</h3>
      <FormGroup>
        <Label for="title">Title</Label>
        <Input type="text" name="title" onChange={update} defaultValue={props.task.title}/>
      </FormGroup>
      <FormGroup>
        <Label for="user_name">Assignee</Label>
        <Input type="select" name="user_name" onChange={update} defaultValue={props.task.user.name}>
          <option />
          { users }
        </Input>
      </FormGroup>
      <FormGroup>
        <Label for="description">Description</Label>
        <Input type="text" name="description" onChange={update} defaultValue={props.task.description}/>
      </FormGroup>
      <FormGroup>
        <Label for="time">Time Spent</Label>
        <Input type="number" name="time" onChange={update} defaultValue={props.task.time}/>
      </FormGroup>
      <FormGroup>
        <Label for="completed">
          <Input type="checkbox" name="completed" onChange={update} defaultValue={props.task.completed}/>
          Completed
        </Label>
      </FormGroup>
      <Button onClick={submit} color="primary">Submit</Button>
    </div>
  );
}

export default withRouter(connect((state) => state)(Edit));
