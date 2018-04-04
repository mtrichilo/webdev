import React from 'react';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';

let Tasks = connect(({tasks}) => {return {tasks};})((props) => {
  return props.tasks.map(task =>
    <div className="row">
      <div className="col">
        <div className="card">
          <div className="card-body">
            <div className="row">
              <div className="col-11">
                <h5 className="card-title">{task.title}</h5>
              </div>
              <div className="col">
                <Link to={"/edit/" + task.id}>Edit</Link>
              </div>
            </div>
            <h6>{task.user.name}</h6>
            <p>{task.description}</p>
            if (task.completed) {
              <p>Completed in {task.time} minutes.</p>
            } else {
              <p>Not completed. Time taken is {task.time} minutes.</p>
            }
          </div>
        </div>
      </div>
    </div>
  );
});

export default Tasks;
