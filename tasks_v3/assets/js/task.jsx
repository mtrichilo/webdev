import React from 'react';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import { Card, CardBody, CardTitle } from 'reactstrap';

export default function Task(props) {
  let task = props.task;
  
  let completed;
  if (task.completed) {
    completed = <p>Completed in {task.time} minutes.</p>
  } else {
    completed = <p>Worked on for {task.time} minutes.</p>
  }

  return (
    <Card>
      <CardBody>
        <div className="row">
          <div className="col-11">
            <CardTitle>{task.title}</CardTitle>
          </div>
          <div className="col">
            <Link to={"/edit/" + task.id}>Edit</Link>
          </div>
        </div>
        <h6>{task.user.name}</h6>
        <p>{task.description}</p>
        { completed }
      </CardBody>
    </Card>
  );
}
